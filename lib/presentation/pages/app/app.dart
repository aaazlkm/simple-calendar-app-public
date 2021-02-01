import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/appevent/usecase/app_event_usecase.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/calendar_usecase.dart';
import 'package:simple_calendar_app/domain/notification/usecase/notification_use_case.dart';
import 'package:simple_calendar_app/domain/setting/model/theme_type.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/permission/notification_permission.dart';
import 'package:simple_calendar_app/presentation/navigator/app_navigator.dart';
import 'package:simple_calendar_app/presentation/pages/app/setting_store.dart';
import 'package:simple_calendar_app/presentation/res/app_theme.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

final RouteObserver<ModalRoute> appRouteObserver = RouteObserver<ModalRoute>();

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State createState() => _AppState();
}

class _AppState extends State<App> {
  late final SettingStore settingStore;

  /// todo 初回設定フローを追加した時にこのメソッドを削除すること
  Future<void> _recordAppHasLaunched() async {
    final result = await locator.get<AppEventUseCase>().recordAppHasLaunched();
    result.ifFailure((resultFailure) => logger.severe('recordAppHasLaunched.failed: $resultFailure'));
  }

  Future<void> _setupRemindNotification() async {
    final notificationUseCase = locator.get<NotificationUseCase>();
    await NotificationPermission.request();
    await notificationUseCase.setupSettingForFirstLaunch();
  }

  Future<void> _scheduleDailyRemind() async {
    final result = await locator.get<NotificationUseCase>().scheduleDailyRemindInWeekIfEnabled();
    result.ifFailure((resultFailure) => logger.severe(resultFailure.e));
  }

  void _makeSureDefaultCalendarSaved() {
    locator.get<CalendarUseCase>().makeSureDefaultCalendarSaved();
  }

  void _onForegroundLost() {
    _scheduleDailyRemind();
  }

  @override
  void initState() {
    super.initState();
    settingStore = locator.get<SettingStore>();

    _recordAppHasLaunched();
    _setupRemindNotification();
    _scheduleDailyRemind();
    _makeSureDefaultCalendarSaved();
  }

  @override
  void dispose() {
    settingStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FocusDetector(
        onForegroundLost: _onForegroundLost,
        child: MultiProvider(
          providers: [
            Provider<AppNavigator>(create: (context) => AppNavigator()),
            Provider<SettingStore>.value(value: settingStore),
          ],
          child: Builder(
            builder: (context) => StreamBuilder<ThemeType>(
              stream: SettingStore.of(context).themeType,
              initialData: SettingStore.of(context).themeTypeValue,
              builder: (context, snapshot) => MaterialApp(
                title: 'Simple Calendar',
                navigatorObservers: [appRouteObserver],

                /// こちらでLocaleの解決はする
                localeResolutionCallback: (locale, supportedLocales) => locale,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                theme: AppTheme.getTheme(snapshot.requireData),
                home: AppNavigator.launcher,
              ),
            ),
          ),
        ),
      );
}
