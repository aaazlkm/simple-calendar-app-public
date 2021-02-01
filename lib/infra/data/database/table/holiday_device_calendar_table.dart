import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'holiday_device_calendar_table.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class HolidayDeviceCalendarTable implements _$HolidayDeviceCalendarTable {
  const factory HolidayDeviceCalendarTable({
    required final String id,
  }) = _HolidayDeviceCalendarTable;

  const HolidayDeviceCalendarTable._();

  static const tableName = 'holidayDeviceCalendar';

  static const columnNameId = 'id';

  static HolidayDeviceCalendarTable fromMap(Map<String, dynamic> map) => HolidayDeviceCalendarTable(
        id: map[columnNameId] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        columnNameId: id,
      };
}
