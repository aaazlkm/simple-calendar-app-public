import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_time.dart';

part 'daily_reminder_state.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class DailyReminderState with _$DailyReminderState {
  const factory DailyReminderState({
    required final bool enable,
    required final DailyRemindTime remindTime,
  }) = _DailyReminderState;

  const DailyReminderState._();
}
