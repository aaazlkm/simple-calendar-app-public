import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_calendar_app/infra/data/preference/model/daily_reminder_state_data.dart';
import 'package:simple_calendar_app/infra/data/preference/preference_key.dart';

class NotificationPreferenceDao {
  Future<SharedPreferences> get _preference => SharedPreferences.getInstance();

  Future<bool?> get completedSettingForFirstLaunch async {
    final preference = await _preference;
    return preference.getBool(PreferenceKey.completedSettingForFirstLaunch.name);
  }

  Future<void> setCompletedSettingForFirstLaunch({required bool completedSettingForFirstLaunch}) async {
    final preference = await _preference;
    await preference.setBool(
      PreferenceKey.completedSettingForFirstLaunch.name,
      completedSettingForFirstLaunch,
    );
  }

  Future<DailyReminderStateData?> get dailyReminderState async {
    final preference = await _preference;
    final mapString = preference.getString(PreferenceKey.dailyReminderState.name);
    if (mapString == null) {
      return null;
    }
    final map = jsonDecode(mapString) as Map<String, dynamic>;
    return DailyReminderStateData.fromJson(map);
  }

  Future<void> setDailyReminderState(DailyReminderStateData dailyReminderStateData) async {
    final preference = await _preference;
    final json = jsonEncode(dailyReminderStateData);
    await preference.setString(PreferenceKey.dailyReminderState.name, json);
  }

  Future<List<int>?> get scheduledDailyRemindIds async {
    final preference = await _preference;
    return preference.getStringList(PreferenceKey.scheduledDailyRemindIds.name)?.map(int.parse).toList();
  }

  Future<void> putScheduledDailyRemindIds(List<int> scheduledDailyRemindIds) async {
    final preference = await _preference;
    await preference.setStringList(PreferenceKey.scheduledDailyRemindIds.name, scheduledDailyRemindIds.map((e) => e.toString()).toList());
  }

  Future<void> clearAllScheduledDailyRemindIds() async {
    final preference = await _preference;
    await preference.setStringList(PreferenceKey.scheduledDailyRemindIds.name, []);
  }
}
