import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nifu_flutter_kit/extensions/extensions.dart';
import 'package:simple_calendar_app/domain/calendar/model/date_range.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

part 'date_picker_state.freezed.dart';

@freezed
abstract class DatePickerState implements _$DatePickerState {
  const factory DatePickerState.initial({
    required final DateTime yearMonth,
    required final DateRange prevDateRange,
  }) = Initial;

  const factory DatePickerState.day({
    required final DateTime yearMonth,
    required final DateRange prevDateRange,
    required final DateTime day,
  }) = Day;

  const factory DatePickerState.range({
    required final DateTime yearMonth,
    required final DateRange prevDateRange,
    required final DateTime start,
    required final DateTime end,
  }) = Range;

  const DatePickerState._();

  bool isSelected(DateTime dateTime) => map(
        initial: (state) => false,
        day: (state) => state.day.isSameDay(dateTime),
        range: (state) => state.start.startDayTime.millisecondsSinceEpoch <= dateTime.millisecondsSinceEpoch && dateTime.millisecondsSinceEpoch < state.end.tomorrowStartDayTime.millisecondsSinceEpoch,
      );

  DatePickerState toInitial() => DatePickerState.initial(yearMonth: yearMonth, prevDateRange: prevDateRange);

  DatePickerState toDay(DateTime day) => DatePickerState.day(yearMonth: yearMonth, prevDateRange: prevDateRange, day: day);
}

extension DayEx on Day {
  DatePickerState toRange(DateTime dateTime) => day.isBefore(dateTime)
      ? DatePickerState.range(yearMonth: yearMonth, prevDateRange: prevDateRange, start: day, end: dateTime)
      : DatePickerState.range(yearMonth: yearMonth, prevDateRange: prevDateRange, start: dateTime, end: day);
}
