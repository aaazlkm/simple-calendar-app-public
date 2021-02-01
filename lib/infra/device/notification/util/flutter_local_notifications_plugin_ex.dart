import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_calendar_app/infra/device/notification/notification/notification.dart' as simple_calendar;
import 'package:simple_calendar_app/infra/device/notification/notification/notification_type.dart';

extension FlutterLocalNotificationsPluginEx on FlutterLocalNotificationsPlugin {
  Future<void> showNotification({required simple_calendar.Notification notification}) async {
    await show(
      notification.id,
      notification.title,
      notification.message,
      notification.notificationDetails,
      payload: notification.payload,
    );
  }

  Future<void> zonedScheduleOfNotification({required simple_calendar.ScheduledNotification notification}) async {
    await zonedSchedule(
      notification.id,
      notification.title,
      notification.message,
      notification.scheduledDate,
      notification.notificationDetails,
      payload: notification.payload,
      androidAllowWhileIdle: notification.androidAllowWhileIdle,
      uiLocalNotificationDateInterpretation: notification.uILocalNotificationDateInterpretation,
      matchDateTimeComponents: notification.matchDateTimeComponents,
    );
  }

  Future<void> clearNotification(NotificationType notificationType) async {
    await cancel(notificationType.id);
  }
}
