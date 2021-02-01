import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/reminder/reminder_id.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

part 'reminder.freezed.dart';

@freezed
abstract class Reminder implements _$Reminder {
  const factory Reminder({
    required final ReminderId id,
    required final int minutes,
  }) = _Reminder;

  const Reminder._();

  static Reminder constructor({
    required final int minutes,
  }) =>
      Reminder(
        id: ReminderId.constructor(),
        minutes: minutes,
      );
}
