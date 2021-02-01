import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

tz.TZDateTime calculateNextScheduleDate(TimeOfDay timeOfDay) {
  final now = tz.TZDateTime.now(tz.local);
  var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  if (scheduledDate.isBefore(now)) {
    scheduledDate = scheduledDate.add(const Duration(days: 1));
  }
  return scheduledDate;
}
