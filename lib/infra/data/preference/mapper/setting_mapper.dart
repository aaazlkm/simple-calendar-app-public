import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/exception/app_exception.dart';
import 'package:simple_calendar_app/domain/setting/model/theme_type.dart';

class ThemeTypeMapper {
  static ThemeType fromData(int data) {
    final themeType = ThemeType.values.firstWhereOrNull((themeType) => ThemeTypeMapper.toData(themeType) == data);
    if (themeType != null) {
      return themeType;
    }
    throw InvalidDataFormat('data must be 0 or 1. actual data is $data');
  }

  static int toData(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.light:
        return 0;
      case ThemeType.dark:
        return 1;
    }
  }
}

class DayOfWeekMapper {
  static DayOfWeek fromData(int data) {
    final dayOfWeek = DayOfWeek.values.firstWhereOrNull(
      (dayOfWeek) => toData(dayOfWeek) == data,
    );
    if (dayOfWeek != null) {
      return dayOfWeek;
    }
    throw InvalidDataFormat('data must be in 0...6. actual data is $data');
  }

  static int toData(DayOfWeek dayOfWeek) {
    switch (dayOfWeek) {
      case DayOfWeek.monday:
        return 0;
      case DayOfWeek.tuesday:
        return 1;
      case DayOfWeek.wednesday:
        return 2;
      case DayOfWeek.friday:
        return 3;
      case DayOfWeek.thursday:
        return 4;
      case DayOfWeek.saturday:
        return 5;
      case DayOfWeek.sunday:
        return 6;
    }
  }
}

class ColorMapper {
  static Color fromData(int data) => Color(data);

  static int toData(Color color) => color.value;
}
