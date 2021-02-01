import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:result/result.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/setting/gateway/setting_repository.dart';
import 'package:simple_calendar_app/domain/setting/model/theme_type.dart';

class SettingUseCase {
  SettingUseCase({required this.settingRepository});

  final SettingRepository settingRepository;

  Future<Result<ThemeType>> getThemeType() async => settingRepository
      .getThemeType()
      .then(
        (value) => value ?? Constant.defaultThemeType,
      )
      .toResult();

  Future<Result<Complete>> setThemeType(ThemeType themeType) => settingRepository.setThemeType(themeType).toComplete();

  Future<Result<DayOfWeek>> getStartDayOfWeek() => settingRepository
      .getStartDayOfWeek()
      .then(
        (value) => value ?? Constant.defaultStartDayOfWeek,
      )
      .toResult();

  Future<Result<Complete>> setStartDayOfWeek(DayOfWeek dayOfWeek) => settingRepository.setStartDayOfWeek(dayOfWeek).toComplete();

  Future<Result<Color?>> getPrevSelectedColor() => settingRepository.getPrevSelectedColor().toResult();

  Future<Result<Complete>> setPrevSelectedColor(Color color) => settingRepository.setPrevSelectedColor(color).toComplete();
}
