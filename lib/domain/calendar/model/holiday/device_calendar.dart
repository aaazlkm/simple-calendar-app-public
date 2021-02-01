import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar_id.dart';

part 'device_calendar.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class DeviceCalendar with _$DeviceCalendar {
  const factory DeviceCalendar({
    required DeviceCalendarId id,
    required String name,
    required Color color,
    required String accountName,
    required String accountType,
  }) = _DeviceCalendar;
}
