import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/date_range.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar.dart';

part 'holiday.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class Holiday with _$Holiday {
  const factory Holiday({
    required final String id,
    required final String title,
    required final DateRange dateRange,
    required final DeviceCalendar deviceCalendar,
  }) = _Holiday;
}
