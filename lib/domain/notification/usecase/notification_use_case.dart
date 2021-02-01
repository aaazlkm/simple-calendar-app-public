import 'package:built_collection/built_collection.dart';
import 'package:result/result.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/core/ex/tz_date_time_ex.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/calendar_repository.dart';
import 'package:simple_calendar_app/domain/notification/gateway/notification_gateway.dart';
import 'package:simple_calendar_app/domain/notification/gateway/notification_setting_repository.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_time.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_reminder_state.dart';
import 'package:timezone/timezone.dart';

class NotificationUseCase {
  NotificationUseCase(
    this._notificationGateway,
    this._notificationSettingRepository,
    this._calendarRepository,
  );

  final NotificationGateway _notificationGateway;

  final NotificationSettingRepository _notificationSettingRepository;

  final CalendarRepository _calendarRepository;

  Future<Result<Complete>> setupSettingForFirstLaunch() => Future(() async {
        final completedSettingForFirstLaunch = await _notificationSettingRepository.checkCompletedSettingForFirstLaunch() ?? false;
        if (!completedSettingForFirstLaunch) {
          final result = await saveAndScheduleDailyReminderState(Constant.dailyReminderState);
          result.throwIfFailure();
          await _notificationSettingRepository.saveCompletedSettingForFirstLaunch(completedSettingForFirstLaunch: true);
        }
      }).toComplete();

  Future<Result<DailyReminderState>> fetchDailyReminderState() => _fetchDailyReminderState().toResult();

  Future<Result<Complete>> saveAndScheduleDailyReminderState(DailyReminderState dailyReminderState) => Future(() async {
        await _notificationSettingRepository.saveDailyReminderState(dailyReminderState);
        if (dailyReminderState.enable) {
          await _scheduleDailyRemindInWeek(dailyReminderState.remindTime);
        } else {
          await _cancelPrevScheduledDailyReminds();
        }
      }).toComplete();

  Future<Result<Complete>> scheduleDailyRemindInWeekIfEnabled() => Future(() async {
        final dailyReminderState = await _fetchDailyReminderState();
        if (!dailyReminderState.enable) {
          return;
        }
        await _scheduleDailyRemindInWeek(dailyReminderState.remindTime);
      }).toComplete();

  Future<DailyReminderState> _fetchDailyReminderState() => _notificationSettingRepository.fetchDailyReminderState().then(
        (value) => value ?? Constant.dailyReminderState,
      );

  /// 一週間分のリマンドを設定する
  Future<void> _scheduleDailyRemindInWeek(DailyRemindTime dailyRemindTime) async {
    /// clear prev scheduled daily remind
    await _cancelPrevScheduledDailyReminds();

    /// schedule reminder
    final timeOfDay = dailyRemindTime.timeOfDay;
    final now = TZDateTime.now(local);
    final baseScheduleDate = now.copyWith(hour: timeOfDay.hour, minute: timeOfDay.minute);
    final week = List.generate(7, (dayToAdd) => baseScheduleDate.add(Duration(days: dayToAdd))).where((day) => day.isAfter(now));
    final events = await _calendarRepository.fetchAllEvents();
    final dailyRemindsInWeek = week.map((day) => DailyRemind(scheduledDate: day, events: events.where((event) => event.eventDate.isIn(day)).toBuiltList())).toList();
    for (final dailyRemind in dailyRemindsInWeek) {
      await _notificationGateway.scheduleDailyRemind(dailyRemind);
    }

    /// save remind id
    final dailyRemindIds = dailyRemindsInWeek.map((e) => e.id).toList();
    await _notificationSettingRepository.putScheduledDailyRemindIds(dailyRemindIds);
  }

  /// 前回設定したリマンドをキャンセルする
  Future<void> _cancelPrevScheduledDailyReminds() async {
    final prevScheduledIds = await _notificationSettingRepository.fetchScheduledDailyRemindIds();
    prevScheduledIds?.forEach(_notificationGateway.cancelDailyRemind);
    await _notificationSettingRepository.clearAllScheduledDailyRemindIds();
  }
}
