import 'dart:math';

import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';

abstract class NotificationString {
  static NotificationString createOnLanguageCode() {
    final languageCode = PlatformEx.languageCode;
    switch (languageCode) {
      case 'en':
        return NotificationStringEn();
      case 'ja':
        return NotificationStringJa();
    }
    return NotificationStringEn();
  }

  List<String> dailyRemindMessageLines(List<Event> events) => events.sublist(0, min(events.length, 8)).map((e) => '・ ${e.name}').toList();

  String dailyRemindMessageWhenNotEmpty(List<Event> events) => dailyRemindMessageLines(events).fold('', (prev, line) => '$prev$line');

  String get dailyRemindTitle;

  String dailyRemindMessage(List<Event> events);

  String get dailyRemindAndroidChannelName;

  String get dailyRemindAndroidChannelDescription;
}

class NotificationStringEn extends NotificationString {
  @override
  String get dailyRemindTitle => "Today's events";

  @override
  String dailyRemindMessage(List<Event> events) {
    if (events.isEmpty) {
      return 'There are no events.';
    } else {
      return dailyRemindMessageWhenNotEmpty(events);
    }
  }

  @override
  String get dailyRemindAndroidChannelName => 'Daily events notification';

  @override
  String get dailyRemindAndroidChannelDescription => "Notify the day's events at the specified time every day";
}

class NotificationStringJa extends NotificationString {
  @override
  String get dailyRemindTitle => '今日の予定';

  @override
  String dailyRemindMessage(List<Event> events) {
    if (events.isEmpty) {
      return '予定はありません。';
    } else {
      return dailyRemindMessageWhenNotEmpty(events);
    }
  }

  @override
  String get dailyRemindAndroidChannelName => '一日の予定通知';

  @override
  String get dailyRemindAndroidChannelDescription => '毎日指定した時間に一日の予定を通知します';
}
