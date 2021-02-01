import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:result/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_time.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_reminder_state.dart';
import 'package:simple_calendar_app/domain/notification/usecase/notification_use_case.dart';
import 'package:simple_calendar_app/permission/notification_permission.dart';
import 'package:simple_calendar_app/permission/simple_permission_status.dart';

class NotificationViewModel {
  NotificationViewModel(this._notificationUseCase) {
    fetchNotificationPermissionStatus();
    fetchDailyReminderState();
  }

  static NotificationViewModel of(BuildContext context) => context.read<NotificationViewModel>();

  final NotificationUseCase _notificationUseCase;

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  final PublishSubject<ResultFailure<Complete>> _updateDailyReminderStateFailure = PublishSubject();

  Stream<ResultFailure<Complete>> get updateDailyReminderStateFailure => _updateDailyReminderStateFailure.stream;

  final BehaviorSubject<SimplePermissionStatus> _notificationPermissionStatus = BehaviorSubject.seeded(SimplePermissionStatus.needPermission);

  Stream<SimplePermissionStatus> get notificationPermissionStatus => _notificationPermissionStatus.stream.distinct();

  SimplePermissionStatus get notificationPermissionStatusValue => _notificationPermissionStatus.value;

  final BehaviorSubject<DailyReminderState> _dailyReminderState = BehaviorSubject.seeded(Constant.dailyReminderState.copyWith(enable: false)); // defaultはfalseにしておく

  Stream<DailyReminderState> get dailyReminderState => _dailyReminderState.stream.distinct();

  DailyReminderState get dailyReminderStateValue => _dailyReminderState.value;

  Stream<bool> get dailyRemindSwitchState => Rx.combineLatest2<SimplePermissionStatus, DailyReminderState, bool>(
        _notificationPermissionStatus,
        _dailyReminderState,
        (permissionStatus, reminderState) => permissionStatus.isGranted && reminderState.enable,
      );

  bool get dailyRemindSwitchStateValue => notificationPermissionStatusValue.isGranted && dailyReminderStateValue.enable;

  void dispose() {
    _updateDailyReminderStateFailure.close();
    _dailyReminderState.close();
    _notificationPermissionStatus.close();
    _compositeSubscription.clear();
  }

  Future<void> fetchNotificationPermissionStatus() async {
    final status = await NotificationPermission.simpleStatus();
    _notificationPermissionStatus.add(status);
  }

  Future<void> fetchDailyReminderState() async {
    final result = await _notificationUseCase.fetchDailyReminderState();
    result.when(
      success: _dailyReminderState.add,
      failure: logger.severe,
    );
  }

  Future<void> updateAndSaveDailyReminderState({bool? enable, DailyRemindTime? remindTime}) async {
    final oldState = dailyReminderStateValue;
    final newState = oldState.copyWith(
      enable: enable ?? oldState.enable,
      remindTime: remindTime ?? oldState.remindTime,
    );

    final result = await _notificationUseCase.saveAndScheduleDailyReminderState(newState);
    result.when(
      success: (_) => _dailyReminderState.add(newState),
      failure: (e) {
        _dailyReminderState.add(oldState);
        _updateDailyReminderStateFailure.add(ResultFailure(e));
      },
    );
  }
}
