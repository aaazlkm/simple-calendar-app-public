// @dart=2.9

import 'package:device_calendar/device_calendar.dart' as device_calendar;
import 'package:simple_calendar_app/domain/calendar/model/date_range.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday.dart';

class HolidayConverter {
  static Holiday fromDeviceEventOrNull(DeviceCalendar deviceCalendar, device_calendar.Event deviceEvent) {
    if (deviceCalendar == null) {
      return null;
    }

    if (deviceEvent?.title == null) {
      return null;
    }

    if (deviceEvent?.start == null || deviceEvent?.end == null) {
      return null;
    }

    return Holiday(
      id: deviceEvent?.eventId ?? '',
      title: deviceEvent.title,
      dateRange: DateRange(start: deviceEvent.start, end: deviceEvent.end),
      deviceCalendar: deviceCalendar,
    );
  }
}
