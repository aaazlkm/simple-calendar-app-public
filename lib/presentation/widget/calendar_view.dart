import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';

//region default value
const DayOfWeek _kDefaultStartDayOfWeek = DayOfWeek.sunday;
//endregion

//region builder
typedef DayOfWeekTextBuilder = Widget Function(BuildContext context, DayOfWeek dayOfWeek);

typedef DayBuilder = Widget Function(BuildContext context, DateTime day);

typedef DividerBuilder = Widget Function(BuildContext context);
//endregion

class CalendarView extends StatelessWidget {
  const CalendarView({
    required this.yearMonth,
    this.dayOfWeekTextBuilder,
    this.dayBuilder,
    this.calendarDividerBuilder,
    DayOfWeek? startDayOfWeek,
    Key? key,
  })  : startDayOfWeek = startDayOfWeek ?? _kDefaultStartDayOfWeek,
        super(key: key);

  final DateTime yearMonth;

  final DayOfWeekTextBuilder? dayOfWeekTextBuilder;

  final DividerBuilder? calendarDividerBuilder;

  final DayBuilder? dayBuilder;

  final DayOfWeek startDayOfWeek;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          DayOfWeeksView(
            startDayOfWeek: startDayOfWeek,
            dayOfWeekTextBuilder: dayOfWeekTextBuilder,
          ),
          Expanded(
            child: CalendarMonthView(
              yearMonth: yearMonth,
              startDayOfWeek: startDayOfWeek,
              dayBuilder: dayBuilder,
            ),
          ),
        ],
      );
}

class CalendarMonthView extends StatelessWidget {
  CalendarMonthView({
    required DateTime yearMonth,
    required DayOfWeek startDayOfWeek,
    this.dayBuilder,
    this.calendarDividerBuilder,
    Key? key,
  })  : calendarDays = _createCalendarDays(yearMonth: yearMonth, startDayOfWeek: startDayOfWeek),
        super(key: key);

  final List<DateTime> calendarDays;

  final DayBuilder? dayBuilder;

  final DividerBuilder? calendarDividerBuilder;

  @override
  Widget build(BuildContext context) => Column(
        children: List.generate(calendarDays.length ~/ DateTime.daysPerWeek, (index) => index)
            .map(
              (i) => Expanded(
                child: Column(
                  children: [
                    _buildDivider(context: context),
                    Expanded(
                      child: _buildWeek(
                        context: context,
                        weekDays: calendarDays.sublist(DateTime.daysPerWeek * i, DateTime.daysPerWeek * (i + 1)),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      );

  Widget _buildWeek({
    required BuildContext context,
    required List<DateTime> weekDays,
  }) {
    assert(weekDays.length == DateTime.daysPerWeek, 'week dates length must be ${DateTime.daysPerWeek}');
    return Row(
      children: weekDays
          .map(
            (day) => Expanded(
              child: _buildDay(context: context, day: day),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDay({
    required BuildContext context,
    required DateTime day,
  }) =>
      Stack(
        children: [
          Positioned.fill(
            child: dayBuilder?.call(context, day) ?? const SizedBox(),
          ),
        ],
      );

  Widget _buildDivider({
    required BuildContext context,
  }) =>
      calendarDividerBuilder?.call(context) ?? const Divider(height: 0);
}

class DayOfWeeksView extends StatelessWidget {
  const DayOfWeeksView({
    required this.startDayOfWeek,
    this.dayOfWeekTextBuilder,
    Key? key,
  }) : super(key: key);

  final DayOfWeek startDayOfWeek;

  final DayOfWeekTextBuilder? dayOfWeekTextBuilder;

  @override
  Widget build(BuildContext context) => Row(
        children: startDayOfWeek.dayOfWeeksStartThis
            .map(
              (dayOfWeek) => Expanded(
                child: Center(
                  child: dayOfWeekTextBuilder?.call(context, dayOfWeek) ??
                      Text(
                        _getDayOfWeekText(dayOfWeek),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                ),
              ),
            )
            .toList(),
      );
}

List<DateTime> _createCalendarDays({
  required DateTime yearMonth,
  required DayOfWeek startDayOfWeek,
}) {
  final startDateInMonth = DateTime(yearMonth.year, yearMonth.month);
  final endDateInMonth = DateTime(yearMonth.year, yearMonth.month + 1, 0);
  final offset = startDayOfWeek.calculateOffset(to: DayOfWeekEx.from(dateTime: startDateInMonth));
  final startDayInCalendar = startDateInMonth.add(Duration(days: -offset));
  final weeksPerCalendar = endDateInMonth.difference(startDayInCalendar).inDays ~/ DateTime.daysPerWeek + 1;
  final calendarDates = List.generate(weeksPerCalendar * DateTime.daysPerWeek, (i) => i)
      .map(
        (i) => startDayInCalendar.add(Duration(days: i)),
      )
      .toList();
  return calendarDates;
}

String _getDayOfWeekText(DayOfWeek dayOfWeek) {
  switch (dayOfWeek) {
    case DayOfWeek.sunday:
      return 'sun';
    case DayOfWeek.monday:
      return 'mon';
    case DayOfWeek.tuesday:
      return 'tue';
    case DayOfWeek.wednesday:
      return 'wed';
    case DayOfWeek.thursday:
      return 'thu';
    case DayOfWeek.friday:
      return 'fri';
    case DayOfWeek.saturday:
      return 'sat';
  }
}
