import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DeviceNotificationDefinition {
  static InitializationSettings get initializationSettings => InitializationSettings(
        android: _androidInitializationSettings,
        iOS: _iOSInitializationSettings,
      );

  static AndroidInitializationSettings get _androidInitializationSettings => const AndroidInitializationSettings(
        'ic_notification',
      );

  static IOSInitializationSettings get _iOSInitializationSettings => const IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      );
}
