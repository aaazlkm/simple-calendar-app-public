import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/item_select_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/eventdate/date_picker_builder.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/eventdate/time_of_day_picker.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/eventdate/time_of_days_view.dart';
import 'package:timezone/timezone.dart';

class EventDateItemView extends StatelessWidget {
  const EventDateItemView({
    required this.eventDate,
    required this.itemSelectState,
    Key? key,
  }) : super(key: key);

  final EventDate eventDate;

  final ItemSelectState itemSelectState;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _EventDateItemBody(eventDate: eventDate, itemSelectState: itemSelectState),
          AnimatedExpansion(
            isExpanded: [ItemSelectState.date, ItemSelectState.timeOfDay].contains(itemSelectState),
            duration: kThemeAnimationDuration,
            curve: [ItemSelectState.date, ItemSelectState.timeOfDay].contains(itemSelectState) ? Curves.easeOutSine : Curves.easeInSine,
            maintainState: true,
            maintainAnimation: true,
            child: _EventDateExpansion(itemSelectState: itemSelectState, eventDate: eventDate),
          ),
        ],
      );
}

class _EventDateItemBody extends StatelessWidget {
  const _EventDateItemBody({
    required this.eventDate,
    required this.itemSelectState,
    Key? key,
  }) : super(key: key);

  final EventDate eventDate;
  final ItemSelectState itemSelectState;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => EventEditController.of(context).onEventDateItemTap(),
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(vertical: [ItemSelectState.date, ItemSelectState.timeOfDay].contains(itemSelectState) ? Dimens.padding16 : Dimens.padding12),
          duration: kThemeAnimationDuration,
          child: Row(
            children: [
              const SizedBox(width: Dimens.padding24),
              Icon(
                FluentIcons.calendar_empty_20_regular,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
              ),
              const SizedBox(width: Dimens.padding16),
              Expanded(
                child: _DateRangeTexts(
                  itemSelectState: itemSelectState,
                  eventDate: eventDate,
                ),
              ),
              TimeOfDaysView(
                eventDate: eventDate,
                itemSelectState: itemSelectState,
              ),
              const SizedBox(width: Dimens.padding24),
            ],
          ),
        ),
      );
}

class _DateRangeTexts extends StatelessWidget {
  const _DateRangeTexts({
    required this.itemSelectState,
    required this.eventDate,
    Key? key,
  }) : super(key: key);

  final ItemSelectState itemSelectState;
  final EventDate eventDate;

  double _dateFontSize({
    required BuildContext context,
    required bool isSelected,
    required bool isVisible,
  }) {
    if (!isVisible) {
      return 0;
    }

    if (isSelected) {
      return 15;
    }

    return 14;
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildDateText(
            context: context,
            date: eventDate.start,
            isSelected: itemSelectState == ItemSelectState.date,
            isVisible: true,
          ),
          SizedBox(height: eventDate.isRange ? 3 : 0),
          _buildDateText(
            context: context,
            date: eventDate.end,
            isSelected: itemSelectState == ItemSelectState.date,
            isVisible: eventDate.isRange,
          ),
        ],
      );

  /// 無理やり共通化してるので、これより複雑にするのであれば別のWidgetに切り分けること
  TweenAnimationBuilder<num> _buildDateText({
    required BuildContext context,
    required TZDateTime date,
    required bool isSelected,
    required bool isVisible,
  }) =>
      TweenAnimationBuilder<double>(
        duration: kThemeAnimationDuration,
        curve: Curves.easeInCubic,
        tween: Tween<double>(begin: 0, end: isSelected ? 1 : 0),
        builder: (context, elevation, child) => Material(
          elevation: elevation,
          type: isSelected ? MaterialType.card : MaterialType.transparency,
          color: isSelected ? Theme.of(context).colorScheme.background : Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius4)),
          child: child,
        ),
        child: Padding(
          padding: isVisible ? const EdgeInsets.symmetric(horizontal: Dimens.padding8) : EdgeInsets.zero,
          child: AnimatedDefaultTextStyle(
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: _dateFontSize(context: context, isSelected: isSelected, isVisible: isVisible),
                ),
            duration: kThemeAnimationDuration,
            curve: Curves.easeInOutSine,
            child: Text(DateFormat.yMMMMd().format(date)),
          ),
        ),
      );
}

class _EventDateExpansion extends StatelessWidget {
  const _EventDateExpansion({
    required this.itemSelectState,
    required this.eventDate,
    Key? key,
  }) : super(key: key);

  final ItemSelectState itemSelectState;
  final EventDate eventDate;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        color: Theme.of(context).colorScheme.background.withOpacity(Dimens.emphasisMedium),
        padding: const EdgeInsets.symmetric(horizontal: Dimens.padding12, vertical: Dimens.padding12),
        height: itemSelectState == ItemSelectState.date ? 340 : 240,
        duration: kThemeAnimationDuration,
        curve: itemSelectState == ItemSelectState.date ? Curves.easeOutSine : Curves.easeInSine,
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedOpacity(
                duration: kThemeAnimationDuration,
                curve: Curves.easeOut,
                opacity: itemSelectState == ItemSelectState.date ? 1 : 0,
                child: const DatePickerBuilder(),
              ),
            ),
            Positioned.fill(
              child: AnimatedOpacity(
                duration: kThemeAnimationDuration,
                curve: Curves.easeOut,
                opacity: itemSelectState == ItemSelectState.timeOfDay ? 1 : 0,
                child: IgnorePointer(
                  ignoring: itemSelectState != ItemSelectState.timeOfDay,
                  child: TimeOfDayPickerView(
                    eventDate: eventDate,
                    itemSelectState: itemSelectState,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
