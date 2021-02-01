// @dart=2.9

import 'package:device_calendar/device_calendar.dart' as device_calendar;
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar_id.dart';

class DeviceCalendarConverter {
  static DeviceCalendar fromPluginOrNull(device_calendar.Calendar calendar) {
    if (calendar == null) {
      return null;
    }

    if (calendar?.id == null) {
      return null;
    }

    if (calendar?.name == null) {
      return null;
    }

    return DeviceCalendar(
      id: DeviceCalendarId(value: calendar.id),
      name: calendar.name,
      color: calendar?.color != null ? Color(calendar.color) : Colors.red[200],
      accountName: calendar?.accountName ?? '',
      accountType: calendar?.accountType ?? '',
    );
  }
}
