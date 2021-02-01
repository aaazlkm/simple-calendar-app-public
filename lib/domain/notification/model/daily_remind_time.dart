import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_type.dart';

part 'daily_remind_time.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class DailyRemindTime with _$DailyRemindTime {
  const factory DailyRemindTime({
    required final DailyRemindType remindType,
    required final TimeOfDay timeOfDay,
  }) = _DailyRemindTime;

  const DailyRemindTime._();

  static DailyRemindTime theDay(TimeOfDay timeOfDay) => DailyRemindTime(remindType: DailyRemindType.theDay, timeOfDay: timeOfDay);

  static DailyRemindTime beforeTheDay(TimeOfDay timeOfDay) => DailyRemindTime(remindType: DailyRemindType.beforeTheDay, timeOfDay: timeOfDay);
}
