import 'dart:ui';

import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/setting/model/theme_type.dart';

abstract class SettingRepository {
  Future<ThemeType?> getThemeType();

  Future<void> setThemeType(ThemeType themeType);

  Future<DayOfWeek?> getStartDayOfWeek();

  Future<void> setStartDayOfWeek(DayOfWeek startDayOfWeek);

  Future<Color?> getPrevSelectedColor();

  Future<void> setPrevSelectedColor(Color color);
}
