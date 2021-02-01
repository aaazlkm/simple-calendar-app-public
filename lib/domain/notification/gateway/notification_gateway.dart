import 'package:simple_calendar_app/domain/notification/model/daily_remind.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_id.dart';

abstract class NotificationGateway {
  Future<void> scheduleDailyRemind(DailyRemind dailyRemind);

  Future<void> cancelDailyRemind(DailyRemindId dailyRemindId);

  Future<void> showDebugNotification(int id, String title, String message);
}
