import 'package:simple_calendar_app/domain/notification/model/daily_remind_id.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_reminder_state.dart';

abstract class NotificationSettingRepository {
  Future<bool?> checkCompletedSettingForFirstLaunch();

  Future<void> saveCompletedSettingForFirstLaunch({required bool completedSettingForFirstLaunch});

  Future<DailyReminderState?> fetchDailyReminderState();

  Future<void> saveDailyReminderState(DailyReminderState dailyReminderState);

  Future<List<DailyRemindId>?> fetchScheduledDailyRemindIds();

  Future<void> putScheduledDailyRemindIds(List<DailyRemindId> scheduledDailyRemindIds);

  Future<void> clearAllScheduledDailyRemindIds();
}
