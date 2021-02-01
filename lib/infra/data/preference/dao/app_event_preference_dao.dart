import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_calendar_app/infra/data/preference/preference_key.dart';

class AppEventPreferenceDao {
  Future<SharedPreferences> get _preference => SharedPreferences.getInstance();

  Future<bool?> getIsFirstAppLaunchOrNull() async {
    final preference = await _preference;
    return preference.getBool(PreferenceKey.isFirstAppLaunch.name);
  }

  Future<void> setIsFirstAppLaunch({required bool isFirstAppLaunch}) async {
    final preference = await _preference;
    await preference.setBool(
      PreferenceKey.isFirstAppLaunch.name,
      isFirstAppLaunch,
    );
  }

  Future<bool?> getAlreadyReviewedAppOrNull() async {
    final preference = await _preference;
    return preference.getBool(PreferenceKey.alreadyReviewedApp.name);
  }

  Future<void> setAlreadyReviewedApp({required bool alreadyReviewedApp}) async {
    final preference = await _preference;
    await preference.setBool(
      PreferenceKey.alreadyReviewedApp.name,
      alreadyReviewedApp,
    );
  }

  Future<int?> getLastTimeDisplayedReviewDialogOrNull() async {
    final preference = await _preference;
    return preference.getInt(PreferenceKey.lastTimeDisplayedReviewDialog.name);
  }

  Future<void> setLastTimeDisplayedReviewDialog(int lastTimeDisplayedReviewDialog) async {
    final preference = await _preference;
    await preference.setInt(
      PreferenceKey.lastTimeDisplayedReviewDialog.name,
      lastTimeDisplayedReviewDialog,
    );
  }

  Future<int?> getReviewDialogDisplayCountOrNull() async {
    final preference = await _preference;
    return preference.getInt(PreferenceKey.reviewDialogDisplayCount.name);
  }

  Future<void> setReviewDialogDisplayCount(int displayCount) async {
    final preference = await _preference;
    await preference.setInt(
      PreferenceKey.reviewDialogDisplayCount.name,
      displayCount,
    );
  }
}
