import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar.dart';

part 'calendar_list_item.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class CalendarListItem with _$CalendarListItem {
  const factory CalendarListItem({
    required final DeviceCalendar deviceCalendar,
    required final bool isSelected,
  }) = _CalendarListItem;
}
