import 'package:built_collection/built_collection.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday_device_calendar_list.dart';
import 'package:simple_calendar_app/infra/data/database/table/holiday_device_calendar_table.dart';

class HolidayDeviceCalendarListMapper {
  static HolidayDeviceCalendarList fromTable(BuiltList<HolidayDeviceCalendarTable> tables) => HolidayDeviceCalendarList(
        ids: tables.map((e) => DeviceCalendarId(value: e.id)).toBuiltList(),
      );

  static BuiltList<HolidayDeviceCalendarTable> toTable(HolidayDeviceCalendarList holidayDeviceCalendarList) => holidayDeviceCalendarList.ids
      .map(
        (e) => HolidayDeviceCalendarTable(id: e.value),
      )
      .toBuiltList();
}
