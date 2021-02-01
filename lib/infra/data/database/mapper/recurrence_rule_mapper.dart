import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:sembast/timestamp.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/calendar/model/recurrencerule/month_of_year.dart';
import 'package:simple_calendar_app/domain/calendar/model/recurrencerule/recurrence_frequency.dart';
import 'package:simple_calendar_app/domain/calendar/model/recurrencerule/recurrence_rule.dart';
import 'package:simple_calendar_app/infra/data/database/table/recurrence_rule_table.dart';
import 'package:timezone/timezone.dart';

/// fixme
/// migrate 時に適当に強制アンラップ付けたので修正すること
class RecurrenceRuleMapper {
  static RecurrenceRule fromTable(RecurrenceRuleTable table) {
    final recurrenceFrequency = _fromTableRecurrenceFrequency(table.recurrenceFrequency);
    switch (recurrenceFrequency) {
      case RecurrenceFrequency.daily:
        return RecurrenceRule.daily(
          interval: table.interval,
          endDate: TZDateTime.from(table.endDate!.toDateTime(), local),
          count: table.count,
        );
      case RecurrenceFrequency.weekly:
        return RecurrenceRule.weekly(
          interval: table.interval,
          endDate: TZDateTime.from(table.endDate!.toDateTime(), local),
          count: table.count,
          dayOfWeeks: table.dayOfWeeks!.map(_fromTableDayOfWeek).whereType<DayOfWeek>().toBuiltList(),
        );
      case RecurrenceFrequency.monthly:
        return RecurrenceRule.monthly(
          interval: table.interval,
          endDate: TZDateTime.from(table.endDate!.toDateTime(), local),
          count: table.count,
          dayOfMonths: table.dayOfMonths!.toBuiltList(),
        );
      case RecurrenceFrequency.yearly:
        return RecurrenceRule.yearly(
          interval: table.interval,
          endDate: TZDateTime.from(table.endDate!.toDateTime(), local),
          count: table.count,
          monthOfYears: table.monthOfYears!.map(_fromTableMonthOfYear).whereType<MonthOfYear>().toBuiltList(),
        );
      case null:
        throw AssertionError('unknown this type: $recurrenceFrequency');
    }
  }

  static RecurrenceRuleTable toTable(RecurrenceRule recurrenceRule) => recurrenceRule.map(
        daily: (daily) => RecurrenceRuleTable(
          recurrenceFrequency: _toTableRecurrenceFrequency(daily.recurrenceFrequency),
          interval: daily.interval,
          endDate: Timestamp.fromDateTime(daily.endDate!),
          count: daily.count,
        ),
        weekly: (weekly) => RecurrenceRuleTable(
          recurrenceFrequency: _toTableRecurrenceFrequency(weekly.recurrenceFrequency),
          interval: weekly.interval,
          endDate: Timestamp.fromDateTime(weekly.endDate!),
          count: weekly.count,
          dayOfWeeks: weekly.dayOfWeeks.map(_toTableDayOfWeek).toBuiltList(),
        ),
        monthly: (monthly) => RecurrenceRuleTable(
          recurrenceFrequency: _toTableRecurrenceFrequency(monthly.recurrenceFrequency),
          interval: monthly.interval,
          endDate: Timestamp.fromDateTime(monthly.endDate!),
          count: monthly.count,
          dayOfMonths: monthly.dayOfMonths.toBuiltList(),
        ),
        yearly: (yearly) => RecurrenceRuleTable(
          recurrenceFrequency: _toTableRecurrenceFrequency(yearly.recurrenceFrequency),
          interval: yearly.interval,
          endDate: Timestamp.fromDateTime(yearly.endDate!),
          count: yearly.count,
          monthOfYears: yearly.monthOfYears.map(_toTableMonthOfYear).toBuiltList(),
        ),
      );

  //region RecurrenceFrequency converter
  static RecurrenceFrequency? _fromTableRecurrenceFrequency(int recurrenceRuleTable) => RecurrenceFrequency.values.firstWhereOrNull(
        (recurrenceFrequency) => _toTableRecurrenceFrequency(recurrenceFrequency) == recurrenceRuleTable,
      );

  static int _toTableRecurrenceFrequency(RecurrenceFrequency recurrenceFrequency) {
    switch (recurrenceFrequency) {
      case RecurrenceFrequency.daily:
        return 0000;
      case RecurrenceFrequency.weekly:
        return 0001;
      case RecurrenceFrequency.monthly:
        return 0002;
      case RecurrenceFrequency.yearly:
        return 0003;
    }
  }

//endregion

  //region DayOfWeek converter
  static DayOfWeek? _fromTableDayOfWeek(int dayOfWeekTable) => DayOfWeek.values.firstWhereOrNull(
        (dayOfWeek) => _toTableDayOfWeek(dayOfWeek) == dayOfWeekTable,
      );

  static int _toTableDayOfWeek(DayOfWeek dayOfWeek) {
    switch (dayOfWeek) {
      case DayOfWeek.monday:
        return 0000;
      case DayOfWeek.tuesday:
        return 0001;
      case DayOfWeek.wednesday:
        return 0002;
      case DayOfWeek.thursday:
        return 0003;
      case DayOfWeek.friday:
        return 0004;
      case DayOfWeek.saturday:
        return 0005;
      case DayOfWeek.sunday:
        return 0006;
    }
  }

  //endregion

  //region MonthOfYear converter
  static MonthOfYear? _fromTableMonthOfYear(int monthOfYearTable) => MonthOfYear.values.firstWhereOrNull(
        (monthOfYear) => _toTableMonthOfYear(monthOfYear) == monthOfYearTable,
      );

  static int _toTableMonthOfYear(MonthOfYear monthOfYear) {
    switch (monthOfYear) {
      case MonthOfYear.january:
        return 0001;
      case MonthOfYear.february:
        return 0002;
      case MonthOfYear.march:
        return 0003;
      case MonthOfYear.april:
        return 0004;
      case MonthOfYear.may:
        return 0005;
      case MonthOfYear.june:
        return 0006;
      case MonthOfYear.july:
        return 0007;
      case MonthOfYear.august:
        return 0008;
      case MonthOfYear.september:
        return 0009;
      case MonthOfYear.october:
        return 0010;
      case MonthOfYear.november:
        return 0011;
      case MonthOfYear.december:
        return 0012;
    }
  }
//endregion
}
