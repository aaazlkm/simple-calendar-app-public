import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:simple_calendar_app/permission/simple_permission_status.dart';

class NotificationPermission {
  static Future<SimplePermissionStatus> simpleStatus() async {
    final status = await Permission.notification.status.then((value) => value.toSimpleStatus());
    // androidは notification の許可ダイアログが存在しない
    // そのため needPermission で帰ってきても needPermissionFromDeviceSetting として返す
    // より厳密に実装するにはパーミッションごとに状態を定義するのが良さそうだが、冗長に感じるためこの実装を許容する
    if (Platform.isAndroid) {
      switch (status) {
        case SimplePermissionStatus.granted:
          return SimplePermissionStatus.granted;
        case SimplePermissionStatus.needPermission:
        case SimplePermissionStatus.needPermissionFromDeviceSetting:
          return SimplePermissionStatus.needPermissionFromDeviceSetting;
      }
    }
    return status;
  }

  static Future<SimplePermissionStatus> request() async => Permission.notification.request().then((value) => value.toSimpleStatus());
}
