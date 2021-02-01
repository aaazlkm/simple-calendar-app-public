import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar_id.dart';

part 'holiday_device_calendar_list.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class HolidayDeviceCalendarList implements _$HolidayDeviceCalendarList {
  const factory HolidayDeviceCalendarList({
    required final BuiltList<DeviceCalendarId> ids,
  }) = _HolidayDeviceCalendarList;

  const HolidayDeviceCalendarList._();

  static HolidayDeviceCalendarList empty() => HolidayDeviceCalendarList(ids: BuiltList.of([]));

  bool contains(DeviceCalendarId id) => ids.contains(id);

  HolidayDeviceCalendarList add(DeviceCalendarId deviceCalendarId) => HolidayDeviceCalendarList(ids: ids.rebuild((list) => list..add(deviceCalendarId)));

  HolidayDeviceCalendarList remove(DeviceCalendarId deviceCalendarId) => HolidayDeviceCalendarList(ids: ids.rebuild((list) => list.where((id) => id != deviceCalendarId)));
}
