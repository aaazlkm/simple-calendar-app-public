import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/extensions/platform_ex.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_time.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_reminder_state.dart';
import 'package:simple_calendar_app/domain/setting/model/theme_type.dart';

class Constant {
  /// デフォルトのテーマタイプ
  static const ThemeType defaultThemeType = ThemeType.light;

  /// デフォルトの開始曜日
  static const DayOfWeek defaultStartDayOfWeek = DayOfWeek.sunday;

  /// デフォルトのカレンダー
  static Calendar defaultCalendar = Calendar(
    id: const CalendarId(value: '2cdc4826-3ff6-4a89-a4e0-4b3dfc32fc30'),
    name: PlatformEx.languageCode == 'ja' ? 'カレンダー' : 'Calendar',
  );

  /// デフォルトのデイリーリマインダーの状態
  static DailyReminderState dailyReminderState = DailyReminderState(
    enable: true,
    remindTime: DailyRemindTime.theDay(const TimeOfDay(hour: 7, minute: 00)),
  );

  /// デフォルトのアプリが初回起動かどうかのフラグ
  static bool isFirstAppLaunch = true;

  /// レビューダイアログを表示するためのイベント数の条件
  /// イベント数がこれより多い時、ダイアログを表示する
  static const int eventSizeTermsToReviewDialog = 5;

  /// レビューダイアログを表示するための間隔の条件
  /// 最後にレビューダイアログを表示してから以下の時間経過した時、ダイアログを表示する
  static const int intervalTermsToReviewDialog = 3 * Duration.millisecondsPerDay;

  /// レビューダイアログを表示するための回数の条件
  /// 表示回数がこれより小さい時、ダイアログを表示する
  static const int displayCountTermsToReviewDialog = 3;

  /// アプリの問い合わせページ(日本語)
  static const String appInquiryPageURLJa = 'https://forms.gle/3bXUEjggyx4yfCib7';

  /// アプリの問い合わせページ(英語)
  static const String appInquiryPageURLEn = 'https://forms.gle/ewJKnJ9QyaNj4EWK7';

  /// プラバシーポリシーページ
  static const String privacyPolicyURL = 'https://simple-calendar-app-67faa.web.app/privacy-policy.html';

  /// 利用規約ページ
  static const String termsAndConditionsURL = 'https://simple-calendar-app-67faa.web.app/terms-and-conditions.html';
}
