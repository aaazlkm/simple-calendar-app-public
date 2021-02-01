import 'package:built_collection/built_collection.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/infra/device/notification/notification/notification.dart';
import 'package:simple_calendar_app/infra/device/notification/notification/notification_type.dart';
import 'package:timezone/timezone.dart';

class DailyRemindNotification extends ScheduledNotification {
  DailyRemindNotification(this._id, this._scheduledDate, this._events);

  final int _id;

  final TZDateTime _scheduledDate;

  final BuiltList<Event> _events;

  late final StyleInformation _styleInformation = _events.isEmpty
      ? const DefaultStyleInformation(true, true)
      : InboxStyleInformation(
          notificationText.dailyRemindMessageLines(_events.toList()),
        );

  @override
  int get id => _id;

  @override
  NotificationType get notificationType => NotificationType.dailyRemind;

  @override
  String get title => notificationText.dailyRemindTitle;

  @override
  String get message => notificationText.dailyRemindMessage(_events.toList());

  @override
  String? get payload => null;

  @override
  TZDateTime get scheduledDate => _scheduledDate;

  @override
  AndroidNotificationDetails get androidNotificationDetails => AndroidNotificationDetails(
        notificationType.androidChannelId,
        notificationText.dailyRemindAndroidChannelName,
        notificationText.dailyRemindAndroidChannelDescription,
        importance: Importance.max,
        priority: Priority.high,
        styleInformation: _styleInformation,
      );

  @override
  bool get androidAllowWhileIdle => true;

  @override
  DateTimeComponents? get matchDateTimeComponents => null;

  @override
  UILocalNotificationDateInterpretation get uILocalNotificationDateInterpretation => UILocalNotificationDateInterpretation.absoluteTime;
}
