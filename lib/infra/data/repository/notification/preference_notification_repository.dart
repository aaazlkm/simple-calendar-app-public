import 'package:simple_calendar_app/domain/notification/gateway/notification_setting_repository.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_id.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_reminder_state.dart';
import 'package:simple_calendar_app/infra/data/preference/dao/notification_preference_dao.dart';
import 'package:simple_calendar_app/infra/data/preference/mapper/notification_mapper.dart';

class PreferenceNotificationSettingRepository implements NotificationSettingRepository {
  PreferenceNotificationSettingRepository(this._notificationPreferenceDao);

  final NotificationPreferenceDao _notificationPreferenceDao;

  @override
  Future<bool?> checkCompletedSettingForFirstLaunch() => _notificationPreferenceDao.completedSettingForFirstLaunch;

  @override
  Future<void> saveCompletedSettingForFirstLaunch({required bool completedSettingForFirstLaunch}) => _notificationPreferenceDao.setCompletedSettingForFirstLaunch(
        completedSettingForFirstLaunch: completedSettingForFirstLaunch,
      );

  @override
  Future<DailyReminderState?> fetchDailyReminderState() => _notificationPreferenceDao.dailyReminderState.then(
        (data) => data != null ? DailyReminderStateMapper.fromData(data) : null,
      );

  @override
  Future<void> saveDailyReminderState(DailyReminderState dailyReminderState) => _notificationPreferenceDao.setDailyReminderState(
        DailyReminderStateMapper.toData(dailyReminderState),
      );

  @override
  Future<List<DailyRemindId>?> fetchScheduledDailyRemindIds() => _notificationPreferenceDao.scheduledDailyRemindIds.then((value) => value
      ?.map(
        DailyRemindIdMapper.fromData,
      )
      .toList());

  @override
  Future<void> putScheduledDailyRemindIds(List<DailyRemindId> scheduledDailyRemindIds) => _notificationPreferenceDao.putScheduledDailyRemindIds(
        scheduledDailyRemindIds.map(DailyRemindIdMapper.toData).toList(),
      );

  @override
  Future<void> clearAllScheduledDailyRemindIds() => _notificationPreferenceDao.clearAllScheduledDailyRemindIds();
}
