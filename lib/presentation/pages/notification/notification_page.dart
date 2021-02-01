import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/permission/notification_permission.dart';
import 'package:simple_calendar_app/permission/simple_permission_status.dart';
import 'package:simple_calendar_app/presentation/pages/notification/notification_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/notification/view/notification_page_view.dart';
import 'package:simple_calendar_app/presentation/port/dialog/alert_dialog.dart';
import 'package:simple_calendar_app/presentation/port/modal/timeofday/time_of_day_picker.dart';
import 'package:simple_calendar_app/presentation/port/toast.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> with NotificationController {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<NotificationController>.value(value: this),
          Provider<NotificationViewModel>.value(value: _viewModel),
        ],
        child: const NotificationView(),
      );
}

mixin NotificationController on State<NotificationPage> {
  static NotificationController of(BuildContext context) => context.read<NotificationController>();

  final CompositeSubscription compositeSubscription = CompositeSubscription();
  late final NotificationViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<NotificationViewModel>();
    _bindViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    compositeSubscription.clear();
    super.dispose();
  }

  void _bindViewModel() {
    _viewModel.updateDailyReminderStateFailure.listen((event) {
      showToast(message: AppLocalizations.string(context).notification.updateDailyRemindStateFailed);
    }).addTo(compositeSubscription);
  }

  void onDairyRemindTap() {
    _changeDailyRemindState(enable: !_viewModel.dailyRemindSwitchStateValue);
  }

  void onDailyRemindEnableChanged({required bool enable}) {
    _changeDailyRemindState(enable: enable);
  }

  Future<void> onDailyRemindTimeTap() async {
    await HapticFeedback.lightImpact();
    if (!mounted) {
      return;
    }
    final remindTime = await showTimeOfDayPicker(
      context,
      selectedDailyRemindTime: _viewModel.dailyReminderStateValue.remindTime,
    );
    if (remindTime != null) {
      await _viewModel.updateAndSaveDailyReminderState(remindTime: remindTime);
    }
  }

  Future<void> _changeDailyRemindState({required bool enable}) async {
    if (enable) {
      await _viewModel.fetchNotificationPermissionStatus();
      _viewModel.notificationPermissionStatusValue.when(
        granted: () => _viewModel.updateAndSaveDailyReminderState(enable: true),
        needPermission: () async {
          await NotificationPermission.request();
          await _viewModel.fetchNotificationPermissionStatus();
          if (_viewModel.notificationPermissionStatusValue.isGranted) {
            await _viewModel.updateAndSaveDailyReminderState(enable: true);
          }
        },
        needPermissionFromDeviceSetting: _requestNotificationPermissionDialog,
      );
    } else {
      await _viewModel.updateAndSaveDailyReminderState(enable: false);
    }
  }

  Future<void> _requestNotificationPermissionDialog() async {
    await showOkCancelAlertDialog(
      context: context,
      title: AppLocalizations.string(context).notification.requestPermissionDialogTitle,
      message: AppLocalizations.string(context).notification.requestPermissionDialogMessage,
      onOkPressed: openAppSettings,
    );
  }
}
