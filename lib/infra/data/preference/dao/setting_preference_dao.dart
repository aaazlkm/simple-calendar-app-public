import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_calendar_app/infra/data/preference/preference_key.dart';

class SettingPreferenceDao {
  Future<SharedPreferences> get _preference => SharedPreferences.getInstance();

  Future<int?> getThemeType() async {
    final preference = await _preference;
    return preference.getInt(PreferenceKey.themeType.name);
  }

  Future<void> setThemeType(int themeType) async {
    final preference = await _preference;
    await preference.setInt(
      PreferenceKey.themeType.name,
      themeType,
    );
  }

  Future<int?> getStartDayOfWeek() async {
    final preference = await _preference;
    return preference.getInt(PreferenceKey.startDayOfWeek.name);
  }

  Future<void> setStartDayOfWeek(int startDayOfWeek) async {
    final preference = await _preference;
    await preference.setInt(
      PreferenceKey.startDayOfWeek.name,
      startDayOfWeek,
    );
  }

  Future<int?> getPrevSelectedColor() async {
    final preference = await _preference;
    return preference.getInt(PreferenceKey.prevSelectedColor.name);
  }

  Future<void> setPrevSelectedColor(int color) async {
    final preference = await _preference;
    await preference.setInt(
      PreferenceKey.prevSelectedColor.name,
      color,
    );
  }
}
