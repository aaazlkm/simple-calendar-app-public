import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_calendar_app/domain/notification/gateway/notification_gateway.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_id.dart';
import 'package:simple_calendar_app/infra/device/notification/device_notification_definition.dart';
import 'package:simple_calendar_app/infra/device/notification/notification/impl/daily_remind_notification.dart';
import 'package:simple_calendar_app/infra/device/notification/util/flutter_local_notifications_plugin_ex.dart';

class DeviceNotificationGateWay implements NotificationGateway {
  DeviceNotificationGateWay()
      : flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin()
          ..initialize(
            DeviceNotificationDefinition.initializationSettings,
          );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  Future<void> scheduleDailyRemind(DailyRemind dailyRemind) async {
    final notification = DailyRemindNotification(dailyRemind.id.value, dailyRemind.scheduledDate, dailyRemind.events);
    await flutterLocalNotificationsPlugin.zonedScheduleOfNotification(notification: notification);
  }

  @override
  Future<void> cancelDailyRemind(DailyRemindId dailyRemindId) async {
    await flutterLocalNotificationsPlugin.cancel(dailyRemindId.value);
  }

  @override
  Future<void> showDebugNotification(int id, String title, String message) async {
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      message,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'debug channel id',
          'debug channel name',
          'debug channel description',
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
        ),
      ),
      payload: 'item x',
    );
  }
}
