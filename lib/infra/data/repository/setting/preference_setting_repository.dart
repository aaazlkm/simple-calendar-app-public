import 'dart:ui';

import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/setting/model/theme_type.dart';
import 'package:simple_calendar_app/domain/setting/gateway/setting_repository.dart';
import 'package:simple_calendar_app/infra/data/preference/dao/setting_preference_dao.dart';
import 'package:simple_calendar_app/infra/data/preference/mapper/setting_mapper.dart';

class PreferenceSettingRepository implements SettingRepository {
  PreferenceSettingRepository(this._settingPreferenceDao);

  final SettingPreferenceDao _settingPreferenceDao;

  @override
  Future<ThemeType?> getThemeType() async => _settingPreferenceDao.getThemeType().then(
        (value) => value != null ? ThemeTypeMapper.fromData(value) : null,
      );

  @override
  Future<void> setThemeType(ThemeType themeType) async => _settingPreferenceDao.setThemeType(ThemeTypeMapper.toData(themeType));

  @override
  Future<DayOfWeek?> getStartDayOfWeek() async => _settingPreferenceDao.getStartDayOfWeek().then(
        (value) => value != null ? DayOfWeekMapper.fromData(value) : null,
      );

  @override
  Future<void> setStartDayOfWeek(DayOfWeek startDayOfWeek) async => _settingPreferenceDao.setStartDayOfWeek(DayOfWeekMapper.toData(startDayOfWeek));

  @override
  Future<Color?> getPrevSelectedColor() => _settingPreferenceDao.getPrevSelectedColor().then(
        (value) => value != null ? ColorMapper.fromData(value) : null,
      );

  @override
  Future<void> setPrevSelectedColor(Color color) => _settingPreferenceDao.setPrevSelectedColor(ColorMapper.toData(color));
}
