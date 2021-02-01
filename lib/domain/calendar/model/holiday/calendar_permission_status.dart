import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

/// [PermissionStatus]をラップしたもの
enum CalendarPermissionStatus {
  /// パーミッション取得済み
  /// android: granted
  /// ios: granted
  granted,

  /// パーミッション取得する必要がある
  /// android: undetermined, denied
  /// ios: undetermined
  needPermission,

  /// デバイスの設定画面からパーミッション取得する必要がある
  /// android: permanentlyDenied, restricted, limited
  /// ios: denied, permanentlyDenied, restricted, limited
  needPermissionFromDeviceSetting,
}

extension CalendarPermissionStatusEx on CalendarPermissionStatus {
  static CalendarPermissionStatus from({required PermissionStatus permissionStatus}) {
    switch (permissionStatus) {
      case PermissionStatus.granted:
        return CalendarPermissionStatus.granted;
      case PermissionStatus.denied:
        return CalendarPermissionStatus.needPermission;
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        return CalendarPermissionStatus.needPermissionFromDeviceSetting;
    }
    throw AssertionError('unsupported Platform');
  }

  static Future<void> requestPermission() async {
    await Permission.calendar.request();
  }

  static Future<void> requestPermissionOfDeviceSetting() async {
    await openAppSettings();
  }
}
