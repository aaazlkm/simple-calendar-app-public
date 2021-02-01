import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_calendar_id.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class DeviceCalendarId implements _$DeviceCalendarId {
  const factory DeviceCalendarId({
    required final String value,
  }) = _DeviceCalendarId;

  const DeviceCalendarId._();
}
