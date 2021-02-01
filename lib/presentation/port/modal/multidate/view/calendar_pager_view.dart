import 'package:built_collection/built_collection.dart';
import 'package:calendar_event/calendar_event.dart' as calendar_event;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/extensions/extensions.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday.dart';
import 'package:simple_calendar_app/presentation/navigator/herotag/calendar_event_list_hero_tag.dart';
import 'package:simple_calendar_app/presentation/pages/app/setting_store.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/controller/calendar_pager_controller.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/model/selected_state.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/multi_date_picker.dart';
import 'package:simple_calendar_app/presentation/res/app_theme.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class CalendarPagerView extends StatelessWidget {
  const CalendarPagerView({
    required this.selectedState,
    required this.startDayOfWeek,
    Key? key,
  }) : super(key: key);

  final SelectedState selectedState;
  final DayOfWeek startDayOfWeek;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.padding4),
        child: Column(
          children: [
            const SizedBox(height: Dimens.padding4),
            _DayOfWeeksView(startDayOfWeek: startDayOfWeek),
            const SizedBox(height: Dimens.padding4),
            Expanded(
              child: _CalendarPager(
                onYearMonthChanged: MultiDateController.of(context).onCalendarYearMonthChanged,
                calendarBuilder: (context, yearMonth) => calendar_event.CalendarMonthView<Event>(
                  yearMonth: yearMonth,
                  events: _convertToCalendarEvent(selectedState.events).toList(),
                  holidays: const [],
                  startDayOfWeek: _convertCalendarToDayOfWeek(startDayOfWeek),
                  eventHeight: _EventView.height,
                  eventBuilder: (context, event) => _EventView(selectedState: selectedState, event: event),
                  dayTextHeight: _DayTextView.height,
                  dayTextBuilder: (context, day) => _DayTextView(day: day),
                  dayBackgroundBuilder: (context, day) => _DayBackgroundView(day: day),
                  calendarDividerBuilder: (context) => const SizedBox(),
                ),
              ),
            ),
          ],
        ),
      );
}

class _DayOfWeeksView extends StatelessWidget {
  const _DayOfWeeksView({
    required this.startDayOfWeek,
    Key? key,
  }) : super(key: key);

  final DayOfWeek startDayOfWeek;

  @override
  Widget build(BuildContext context) => calendar_event.DayOfWeeksView(
        startDayOfWeek: _convertCalendarToDayOfWeek(startDayOfWeek),
        dayOfWeekTextBuilder: (context, dayOfWeek) => Text(
          AppLocalizations.string(context).multiDate.calendarDayOfWeekText(_convertToDayOfWeeks(dayOfWeek)),
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                fontSize: Dimens.fontSize12,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisMedium),
              ),
        ),
      );
}

class _CalendarPager extends StatelessWidget {
  const _CalendarPager({
    required this.calendarBuilder,
    required this.onYearMonthChanged,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, DateTime yearMonth) calendarBuilder;

  final ValueChanged<DateTime> onYearMonthChanged;

  @override
  Widget build(BuildContext context) => PageView.builder(
        controller: CalendarPagerController.of(context).pageController,
        onPageChanged: (pageIndex) => onYearMonthChanged(CalendarPagerController.calculateYearMonthFromPageIndex(pageIndex)),
        itemCount: CalendarPagerController.pageCount,
        itemBuilder: (context, index) => calendarBuilder(context, CalendarPagerController.calculateYearMonthFromPageIndex(index)),
      );
}

class _DayTextView extends StatelessWidget {
  const _DayTextView({
    required this.day,
    Key? key,
  }) : super(key: key);

  static const height = Dimens.viewSize20;

  final calendar_event.Day day;

  Color _dayTextColor(BuildContext context, calendar_event.Day day) {
    var textColor = Theme.of(context).colorScheme.onBackground;
    final holidayColor = AppTheme.getAppColor(SettingStore.of(context).themeTypeValue).holidayColor;
    if (DayOfWeekEx.from(dateTime: day.dateTime) == DayOfWeek.sunday) {
      textColor = holidayColor;
    }

    if (day.holidays.isNotEmpty) {
      textColor = holidayColor;
    }

    switch (day.dayInCalendarState) {
      case calendar_event.DayInCalendarMonthState.thisMonth:
        return textColor.withOpacity(Dimens.emphasisHigh);
      case calendar_event.DayInCalendarMonthState.otherMonth:
        return textColor.withOpacity(Dimens.emphasisLow);
    }
  }

  @override
  Widget build(BuildContext context) => Text(
        day.dateTime.day.toString(),
        style: Theme.of(context).textTheme.caption?.copyWith(
              fontSize: Dimens.fontSize11,
              color: _dayTextColor(context, day),
            ),
      );
}

class _DayBackgroundView extends StatelessWidget {
  const _DayBackgroundView({
    required this.day,
    Key? key,
  }) : super(key: key);

  final calendar_event.Day day;

  Color _backgroundColor(BuildContext context) => day.dateTime.isSameDay(DateTime.now())
      ? Color.alphaBlend(Theme.of(context).colorScheme.onBackground.withOpacity(0.05), Theme.of(context).colorScheme.surface)
      : Theme.of(context).colorScheme.surface;

  @override
  Widget build(BuildContext context) => Hero(
        flightShuttleBuilder: (context, anim, direction, fromContext, toContext) {
          // pop時はアニメーションが走らないようにしてる
          if (direction == HeroFlightDirection.pop) {
            return FadeTransition(opacity: const AlwaysStoppedAnimation(0), child: toContext.widget);
          }
          return toContext.widget;
        },
        tag: CalendarEventListHeroTag.heroTagDayView(day.dateTime),
        child: Material(
          color: _backgroundColor(context),
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius4)),
            onTap: () => MultiDateController.of(context).onCalendarCellTaped(day.dateTime),
          ),
        ),
      );
}

class _EventView extends StatelessWidget {
  const _EventView({
    required this.selectedState,
    required this.event,
    Key? key,
  }) : super(key: key);

  static const double height = 20.5;

  final SelectedState selectedState;
  final Event event;

  bool get isOriginEvent => selectedState.isOriginEvent(event);

  Color backgroundColor(BuildContext context) => isOriginEvent
      ? Color.alphaBlend(Theme.of(context).colorScheme.background.withOpacity(0.05), event.color)
      : Color.alphaBlend(Theme.of(context).colorScheme.background.withOpacity(0.05), event.color).withOpacity(0.6);

  Color textColor(BuildContext context) => isOriginEvent ? Colors.black.withOpacity(Dimens.emphasisMedium) : Colors.black.withOpacity(Dimens.emphasisLow);

  @override
  Widget build(BuildContext context) => IgnorePointer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.padding1, horizontal: 1.5),
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius2)),
            color: backgroundColor(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding2, vertical: Dimens.padding1),
              child: Center(
                child: Text(
                  event.name,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: textColor(context),
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
        ),
      );
}

calendar_event.DayOfWeek _convertCalendarToDayOfWeek(DayOfWeek dayOfWeek) {
  switch (dayOfWeek) {
    case DayOfWeek.monday:
      return calendar_event.DayOfWeek.monday;
    case DayOfWeek.tuesday:
      return calendar_event.DayOfWeek.tuesday;
    case DayOfWeek.wednesday:
      return calendar_event.DayOfWeek.wednesday;
    case DayOfWeek.thursday:
      return calendar_event.DayOfWeek.thursday;
    case DayOfWeek.friday:
      return calendar_event.DayOfWeek.friday;
    case DayOfWeek.saturday:
      return calendar_event.DayOfWeek.saturday;
    case DayOfWeek.sunday:
      return calendar_event.DayOfWeek.sunday;
  }
}

DayOfWeek _convertToDayOfWeeks(calendar_event.DayOfWeek dayOfWeek) {
  switch (dayOfWeek) {
    case calendar_event.DayOfWeek.monday:
      return DayOfWeek.monday;
    case calendar_event.DayOfWeek.tuesday:
      return DayOfWeek.tuesday;
    case calendar_event.DayOfWeek.wednesday:
      return DayOfWeek.wednesday;
    case calendar_event.DayOfWeek.thursday:
      return DayOfWeek.thursday;
    case calendar_event.DayOfWeek.friday:
      return DayOfWeek.friday;
    case calendar_event.DayOfWeek.saturday:
      return DayOfWeek.saturday;
    case calendar_event.DayOfWeek.sunday:
      return DayOfWeek.sunday;
  }
}

BuiltList<calendar_event.CalendarEvent<Event>> _convertToCalendarEvent(BuiltList<Event> events) => events
    .map(
      (event) => calendar_event.CalendarEvent(
        value: event,
        dateRange: calendar_event.DateRange.range(
          start: event.eventDate.startInLocal,
          end: event.eventDate.endInLocal,
        ),
      ),
    )
    .toBuiltList();

BuiltList<calendar_event.Holiday> _convertToCalendarHoliday(BuiltList<Holiday> holidays) => holidays
    .map(
      (holiday) => calendar_event.Holiday(
        name: holiday.title,
        dateRange: calendar_event.DateRange.range(
          start: holiday.dateRange.start,
          end: holiday.dateRange.end,
        ),
      ),
    )
    .toBuiltList();
