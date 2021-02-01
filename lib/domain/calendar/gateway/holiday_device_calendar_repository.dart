import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday_device_calendar_list.dart';

abstract class HolidayDeviceCalendarRepository {
  Future<void> saveOrUpdateHolidayDeviceCalendars(HolidayDeviceCalendarList holidayDeviceCalendarList);

  Future<void> clearAllHolidayDeviceCalendarList();

  Future<HolidayDeviceCalendarList> fetchHolidayDeviceCalendars();
}
