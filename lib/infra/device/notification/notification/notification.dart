import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_calendar_app/infra/device/notification/notification/notification_type.dart';
import 'package:simple_calendar_app/infra/device/notification/res/notification_text.dart';
import 'package:timezone/timezone.dart' as tz;

/// 通知
abstract class Notification {
  final notificationText = NotificationString.createOnLanguageCode();

  NotificationType get notificationType;

  int get id => notificationType.id;

  String get title;

  String get message;

  NotificationDetails get notificationDetails => NotificationDetails(
        android: androidNotificationDetails,
        iOS: iOSNotificationDetails,
      );

  AndroidNotificationDetails get androidNotificationDetails;

  IOSNotificationDetails get iOSNotificationDetails => const IOSNotificationDetails();

  String? get payload;
}

/// 繰り返し通知
abstract class ScheduledNotification extends Notification {
  UILocalNotificationDateInterpretation get uILocalNotificationDateInterpretation;

  bool get androidAllowWhileIdle;

  DateTimeComponents? get matchDateTimeComponents;

  tz.TZDateTime get scheduledDate;
}
