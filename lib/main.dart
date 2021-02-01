import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:simple_calendar_app/core/ex/location_database_ex.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/database_usecase.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/pages/app/app.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupApp();
  runApp(const App());
}

Future<void> _setupApp() async {
  setupLocator();
  await Future.wait([
    Firebase.initializeApp(),
    _setupTimezones(),
    _setupDatabase(),
  ]);
  _setupRecordingFlutterError();
}

Future<void> _setupTimezones() async {
  tz.initializeTimeZones();
  final locationName = await FlutterNativeTimezone.getLocalTimezone();
  // databaseに登録されていない場合、UTCを返す
  final location = tz.timeZoneDatabase.getLocationOrNull(locationName) ?? tz.UTC;
  tz.setLocalLocation(location);
}

Future<void> _setupDatabase() async {
  final databaseUseCase = locator.get<DatabaseUseCase>();
  await databaseUseCase.openDatabase();
}

void _setupRecordingFlutterError() {
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}
