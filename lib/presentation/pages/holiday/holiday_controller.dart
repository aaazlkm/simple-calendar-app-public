import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/calendar_permission_status.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/navigator/app_navigator.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_page.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_view_model.dart';
import 'package:simple_calendar_app/presentation/port/how_to_register_device_calendar.dart';
import 'package:simple_calendar_app/presentation/port/toast.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

mixin HolidayController on State<HolidayPage> {
  static HolidayController of(BuildContext context) => context.read<HolidayController>();

  final CompositeSubscription compositeSubscription = CompositeSubscription();
  late final HolidayViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = locator.get<HolidayViewModel>();
    _bindViewModelEvent();
  }

  @override
  void dispose() {
    viewModel.dispose();
    compositeSubscription.clear();
    super.dispose();
  }

  void _bindViewModelEvent() {
    viewModel.failureOfFetchingDeviceCalendars.listen((event) {
      showToast(message: AppLocalizations.string(context).holidayFailedToFetchDeviceCalendar);
    }).addTo(compositeSubscription);

    viewModel.failureOfFetchingHolidayDeviceCalendarId.listen((event) {
      showToast(message: AppLocalizations.string(context).holidayFailedToFetchHolidayDeviceCalendarId);
    }).addTo(compositeSubscription);
  }

  void onForegroundGained() {
    viewModel.fetchCalendarPermissionStatus();
  }

  void onCloseButtonTap() {
    AppNavigator.of(context).popHolidayPage(context);
  }

  void onDeviceCalendarTap(DeviceCalendar deviceCalendar) {
    _useDeviceCalendarAsHolidayOrNot(deviceCalendar);
  }

  void onCheckBoxTap(DeviceCalendar deviceCalendar) {
    _useDeviceCalendarAsHolidayOrNot(deviceCalendar);
  }

  Future<void> onPermissionRequestButtonTap(CalendarPermissionStatus permissionStatus) async {
    switch (permissionStatus) {
      case CalendarPermissionStatus.needPermission:
        await CalendarPermissionStatusEx.requestPermission();
        break;
      case CalendarPermissionStatus.needPermissionFromDeviceSetting:
        await CalendarPermissionStatusEx.requestPermissionOfDeviceSetting();
        break;
      case CalendarPermissionStatus.granted:
        break;
    }
    await viewModel.fetchCalendarPermissionStatus();
  }

  void onHowToRegisterButtonOnEmptyTap() {
    _showHowToRegisterDeviceCalendarPage();
  }

  void onHowToRegisterButtonOnListTap() {
    _showHowToRegisterDeviceCalendarPage();
  }

  void _useDeviceCalendarAsHolidayOrNot(DeviceCalendar deviceCalendar) {
    HapticFeedback.lightImpact();
    viewModel.useDeviceCalendarAsHolidayOrNot(deviceCalendar);
  }

  void _showHowToRegisterDeviceCalendarPage() {
    showHowToRegisterDeviceCalendarPage();
  }
}
