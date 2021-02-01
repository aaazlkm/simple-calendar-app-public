import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/calendar/model/date_range.dart';
import 'package:simple_calendar_app/domain/calendar/model/recurrencerule/month_of_year.dart';
import 'package:simple_calendar_app/domain/calendar/model/recurrencerule/recurrence_frequency.dart';
import 'package:timezone/timezone.dart';

part 'recurrence_rule.freezed.dart';

@freezed
abstract class RecurrenceRule implements _$RecurrenceRule {
  const factory RecurrenceRule.daily({
    required final int interval,
    @Default(RecurrenceFrequency.daily) final RecurrenceFrequency recurrenceFrequency,
    final TZDateTime? endDate,
    final int? count,
  }) = _RecurrenceRuleDaily;

  const factory RecurrenceRule.weekly({
    required final int interval,
    required final BuiltList<DayOfWeek> dayOfWeeks,
    @Default(RecurrenceFrequency.weekly) final RecurrenceFrequency recurrenceFrequency,
    final TZDateTime? endDate,
    final int? count,
  }) = _RecurrenceRuleWeekly;

  const factory RecurrenceRule.monthly({
    required final int interval,
    required final BuiltList<int> dayOfMonths,
    @Default(RecurrenceFrequency.monthly) final RecurrenceFrequency recurrenceFrequency,
    final TZDateTime? endDate,
    final int? count,
  }) = _RecurrenceRuleMonthly;

  const factory RecurrenceRule.yearly({
    required final int interval,
    required final BuiltList<MonthOfYear> monthOfYears,
    @Default(RecurrenceFrequency.yearly) final RecurrenceFrequency recurrenceFrequency,
    final TZDateTime? endDate,
    final int? count,
  }) = _RecurrenceRuleYearly;

  const RecurrenceRule._();

  BuiltList<TZDateTime> createEventStartDates({
    required TZDateTime eventStart,
    required DateRange range,
  }) =>
      map(
        daily: (daily) => daily.createEventStartDates(eventStart: eventStart, range: range),
        weekly: (weekly) => weekly.createEventStartDates(eventStart: eventStart, range: range),
        monthly: (monthly) => monthly.createEventStartDates(eventStart: eventStart, range: range),
        yearly: (yearly) => yearly.createEventStartDates(eventStart: eventStart, range: range),
      );
}
