import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:nifu_flutter_kit/extensions/extensions.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:result/result.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday.dart';
import 'package:simple_calendar_app/presentation/navigator/herotag/calendar_event_list_hero_tag.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/event_list_page.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';
import 'package:uuid/uuid.dart';

class DayView extends StatelessWidget {
  const DayView({
    required this.day,
    required this.nowDay,
    required this.eventsResult,
    required this.holidays,
    Key? key,
  }) : super(key: key);

  static const double viewportHeightFraction = 0.8;

  static const double viewportWidthFraction = 0.88;

  static const double horizontalPadding = Dimens.padding8;

  final DateTime day;

  final DateTime nowDay;

  final LoadResult<BuiltList<Event>> eventsResult;

  final BuiltList<Holiday> holidays;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Hero(
          tag: day.isSameDay(nowDay) ? CalendarEventListHeroTag.heroTagDayView(day) : const Uuid().v4(), // 選択していない日付はHeroアニメーションさせないために、UUIDをセットしてる
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius8)),
            child: Column(
              children: [
                _DayToolbar(day: day, holidays: holidays),
                const Divider(height: Dimens.viewSize1),
                Expanded(
                  child: eventsResult.maybeMap(
                    success: (success) => EventListView(events: success.value),
                    orElse: () => const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _DayToolbar extends StatelessWidget {
  const _DayToolbar({
    required this.day,
    required this.holidays,
    Key? key,
  }) : super(key: key);

  final DateTime day;

  final BuiltList<Holiday> holidays;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: Dimens.padding16, right: Dimens.padding52), // iconのぶん
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: Dimens.padding12),
                  Text(
                    DateTime.now().isSameYear(day) ? AppLocalizations.string(context).eventListDayTitleThisYear(day) : AppLocalizations.string(context).eventListDayTitleNotThisYear(day),
                    style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisHigh),
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                  ),
                  Visibility(
                    visible: holidays.isNotEmpty,
                    child: Text(
                      holidays.isNotEmpty ? holidays.fold<String>('', (prev, holiday) => '$prev${holiday.title}, ').dropLast(2) : '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisMedium),
                          ),
                    ),
                  ),
                  const SizedBox(height: Dimens.padding12),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: Dimens.padding12),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius64)),
                  onTap: () => EventListController.of(context).onCloseButtonTap(),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimens.padding4),
                    child: Icon(
                      Octicons.x,
                      size: 15,
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}

class EventListView extends StatelessWidget {
  const EventListView({
    required this.events,
    Key? key,
  }) : super(key: key);

  static BuiltList<Event> sortEvents(BuiltList<Event> events) {
    final eventRanges = events.where((event) => event.eventDate.isRange).toList()
      ..sort(
        (a, b) => b.eventDate.diffInMilliseconds.compareTo(a.eventDate.diffInMilliseconds),
      );
    final eventDaysAllDay = events.where((event) => event.eventDate.isDay && event.eventDate.isAllDay).toList()
      ..sort(
        (a, b) => a.createdAt.millisecondsSinceEpoch.compareTo(b.createdAt.millisecondsSinceEpoch),
      );
    final eventDaysNotAllDay = events.where((event) => event.eventDate.isDay && !event.eventDate.isAllDay).toList()
      ..sort(
        (a, b) => a.eventDate.startInLocal.millisecondsSinceEpoch.compareTo(b.eventDate.startInLocal.millisecondsSinceEpoch),
      );
    return (eventRanges + eventDaysAllDay + eventDaysNotAllDay).toBuiltList();
  }

  final BuiltList<Event> events;

  @override
  Widget build(BuildContext context) => events.isNotEmpty
      ? ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.grey[400]!,
            child: ImplicitlyAnimatedList<Event>(
              items: sortEvents(events).toList(),
              areItemsTheSame: (a, b) => a.id == b.id,
              insertDuration: const Duration(milliseconds: 300),
              padding: EdgeInsets.zero,
              itemBuilder: (context, animation, item, index) => SizeFadeTransition(
                sizeFraction: 0.7,
                curve: Curves.easeInOut,
                animation: animation,
                child: Column(
                  children: [
                    _EventView(event: item),
                    const Divider(height: 1),
                  ],
                ),
              ),
            ),
          ),
        )
      : const _EventListEmptyView();
}

class _EventView extends StatelessWidget {
  const _EventView({
    required this.event,
    Key? key,
  }) : super(key: key);

  static const double colorSize = 10;

  static const double colorPaddingHorizontal = Dimens.padding16;

  static const double colorPaddingRight = Dimens.padding12;

  final Event event;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => EventListController.of(context).onEventTap(event),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.padding6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: colorPaddingHorizontal),
                  Material(
                    color: event.color,
                    borderRadius: BorderRadius.circular(Dimens.radius64),
                    child: SizedBox.fromSize(
                      size: const Size.square(colorSize),
                    ),
                  ),
                  const SizedBox(width: colorPaddingRight),
                  Expanded(
                    child: Text(
                      event.name,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(width: colorPaddingHorizontal),
                ],
              ),
              Visibility(
                visible: event.note.isNotEmpty,
                child: Column(
                  children: [
                    const SizedBox(height: Dimens.padding2),
                    Row(
                      children: [
                        const SizedBox(width: colorPaddingHorizontal + colorPaddingRight + colorSize),
                        Expanded(
                          child: Text(
                            event.note,
                            style: Theme.of(context).textTheme.caption?.copyWith(
                                  color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisMedium),
                                  fontSize: Dimens.fontSize12,
                                ),
                          ),
                        ),
                        const SizedBox(width: colorPaddingHorizontal),
                      ],
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: event.eventDate.isRange || !event.eventDate.isAllDay,
                child: Column(
                  children: [
                    SizedBox(height: event.note.isNotEmpty ? Dimens.padding6 : 2),
                    Row(
                      children: [
                        const SizedBox(width: colorPaddingHorizontal + colorPaddingRight + colorSize + 1), // ずれてるように見えるので調整する
                        Expanded(
                          child: Text(
                            event.eventDate.isRange
                                ? AppLocalizations.string(context).eventListEventDateRange(event.eventDate.start, event.eventDate.end)
                                : !event.eventDate.isAllDay
                                    ? AppLocalizations.string(context).eventListEventDateNotAllDay(event.eventDate.start, event.eventDate.end)
                                    : '',
                            style: Theme.of(context).textTheme.caption?.copyWith(
                                  color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisMedium),
                                  fontSize: Dimens.fontSize12,
                                ),
                          ),
                        ),
                        const SizedBox(width: colorPaddingHorizontal),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );
}

class _EventListEmptyView extends StatelessWidget {
  const _EventListEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Align(
        alignment: const Alignment(0, -0.2),
        child: Text(
          AppLocalizations.string(context).eventListNoEvents,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontSize: Dimens.fontSize14,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisMedium),
              ),
        ),
      );
}
