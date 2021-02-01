import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:result/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/domain/setting/model/theme_type.dart';
import 'package:simple_calendar_app/domain/setting/usecase/setting_usecase.dart';

class SettingStore {
  SettingStore(this._settingUseCase) {
    getThemeType();
  }

  static SettingStore of(BuildContext context) => context.read<SettingStore>();

  final SettingUseCase _settingUseCase;

  final BehaviorSubject<ThemeType> _themeType = BehaviorSubject.seeded(Constant.defaultThemeType);

  Stream<ThemeType> get themeType => _themeType.stream;

  ThemeType get themeTypeValue => _themeType.value;

  void dispose() {
    _themeType.close();
  }

  /// lightとdartモードを切り替える
  /// fixme
  /// 将来的にもっとテーマが増えたら、このメソッドを削除する
  Future<Result<Complete>> toggleThemeType() async {
    var newThemeType = ThemeType.light;
    switch (themeTypeValue) {
      case ThemeType.light:
        newThemeType = ThemeType.dark;
        break;
      case ThemeType.dark:
        newThemeType = ThemeType.light;
        break;
    }
    return setThemeType(newThemeType);
  }

  Future<Result<Complete>> setThemeType(ThemeType themeType) async {
    final result = await _settingUseCase.setThemeType(themeType);
    result.ifSuccess((data) => _themeType.add(themeType));
    return result;
  }

  Future<Result<Complete>> getThemeType() async {
    final result = await _settingUseCase.getThemeType();
    result.ifSuccess(_themeType.add);
    return result.toComplete();
  }
}
