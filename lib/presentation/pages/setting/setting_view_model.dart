import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_reminder_state.dart';
import 'package:simple_calendar_app/domain/notification/usecase/notification_use_case.dart';
import 'package:simple_calendar_app/domain/setting/usecase/setting_usecase.dart';
import 'package:simple_calendar_app/permission/notification_permission.dart';
import 'package:simple_calendar_app/permission/simple_permission_status.dart';

mixin SettingViewModelData {
  static SettingViewModelData of(BuildContext context) => context.read<SettingViewModelData>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  final BehaviorSubject<DayOfWeek> _startDayOfWeek = BehaviorSubject.seeded(Constant.defaultStartDayOfWeek);

  Stream<DayOfWeek> get startDayOfWeek => _startDayOfWeek.stream.distinct();

  DayOfWeek get startDayOfWeekValue => _startDayOfWeek.value;

  final BehaviorSubject<SimplePermissionStatus> _notificationPermissionStatus = BehaviorSubject.seeded(SimplePermissionStatus.needPermission);

  Stream<SimplePermissionStatus> get notificationPermissionStatus => _notificationPermissionStatus.stream.distinct();

  SimplePermissionStatus get notificationPermissionStatusValue => _notificationPermissionStatus.value;

  final BehaviorSubject<DailyReminderState> _dailyReminderState = BehaviorSubject.seeded(Constant.dailyReminderState);

  Stream<DailyReminderState> get dailyReminderState => _dailyReminderState.stream.distinct();

  DailyReminderState get dailyReminderStateValue => _dailyReminderState.value;

  Stream<bool> get dailyRemindTimeVisible => Rx.combineLatest2<SimplePermissionStatus, DailyReminderState, bool>(
        _notificationPermissionStatus,
        _dailyReminderState,
        (permissionStatus, reminderState) => permissionStatus.isGranted && reminderState.enable,
      );

  bool get dailyRemindTimeVisibleValue => notificationPermissionStatusValue.isGranted && dailyReminderStateValue.enable;

  void dispose() {
    _startDayOfWeek.close();
    _notificationPermissionStatus.close();
    _dailyReminderState.close();
    _compositeSubscription.clear();
  }
}

class SettingViewModel with SettingViewModelData {
  SettingViewModel({required this.settingUseCase, required this.notificationUseCase}) {
    fetchAllData();
  }

  final SettingUseCase settingUseCase;

  final NotificationUseCase notificationUseCase;

  void fetchAllData() {
    _fetchStartDayOfWeek();
    _fetchNotificationPermissionStatus();
    _fetchDailyReminderState();
  }

  Future<void> _fetchStartDayOfWeek() async {
    final result = await settingUseCase.getStartDayOfWeek();
    result.when(
      success: _startDayOfWeek.add,
      failure: logger.severe,
    );
  }

  Future<void> _fetchNotificationPermissionStatus() async {
    final status = await NotificationPermission.simpleStatus();
    _notificationPermissionStatus.add(status);
  }

  Future<void> _fetchDailyReminderState() async {
    final result = await notificationUseCase.fetchDailyReminderState();
    result.when(
      success: _dailyReminderState.add,
      failure: logger.severe,
    );
  }

  Future<void> changeStartDayOfWeek(DayOfWeek dayOfWeek) async {
    final prevDayOfWeek = startDayOfWeekValue;
    _startDayOfWeek.add(dayOfWeek);
    final result = await settingUseCase.setStartDayOfWeek(dayOfWeek);
    result.ifFailure((_) => _startDayOfWeek.add(prevDayOfWeek));
  }
}
