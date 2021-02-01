import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:nifu_flutter_kit/util/focus.dart';
import 'package:nifu_flutter_kit/widget/pageroutes/shared_axis_page_route.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar_app/presentation/navigator/app_routes.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/calendar_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/trade/event_edit_argument.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/event_list_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/trade/event_list_argument.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_page.dart';
import 'package:simple_calendar_app/presentation/pages/notification/notification_page.dart';
import 'package:simple_calendar_app/presentation/pages/setting/setting_page.dart';
import 'package:simple_calendar_app/presentation/pages/sync/sync_page.dart';

class AppNavigator {
  static Widget get launcher => const CalendarPage();

  static AppNavigator of(BuildContext context) => context.read<AppNavigator>();

  //region calendar navigation methods
  Future<void> pushCalendarPage(BuildContext context) => Navigator.of(context).push(
        createMobilePageRoute(
          context: context,
          builder: (_) => const CalendarPage(),
          settings: RouteSettings(name: AppRoutes.calendar.name),
          androidPageRoute: (builder, settings) => SharedAxisPageRoute<void>(builder: builder, settings: settings),
          iosPageRoute: (builder, settings) => CupertinoPageRoute<void>(builder: builder, settings: settings),
        ),
      );

  void popCalendarPage(BuildContext context) {
    _pop(context);
  }

  //endregion

  //region event list navigation methods
  Future<void> pushEventListPage({required BuildContext context, required EventListArgument argument}) => Navigator.of(context).push(
        PageRouteBuilder(
          settings: RouteSettings(name: AppRoutes.eventList.name),
          pageBuilder: (_, __, ___) => EventListPage(argument: argument),
          transitionsBuilder: (
            context,
            primaryAnimation,
            secondaryAnimation,
            child,
          ) =>
              FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            fillColor: Colors.transparent,
            child: child,
          ),
          opaque: false,
          barrierColor: Colors.black38,
        ),
      );

  void popEventListPage(BuildContext context) {
    _pop(context);
  }

  //endregion

  //region event edit navigation methods
  Future<void> pushEventEditPage({required BuildContext context, required EventEditArgument argument}) => showBarModalBottomSheet(
        context: context,
        // expand: true,
        topControl: const SizedBox.shrink(), // remove bar
        barrierColor: Colors.black.withOpacity(Dimens.emphasisMedium),
        duration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeOut,
        builder: (context) => EventEditPage(argument: argument),
      );

  void popEventEditPage(BuildContext context) {
    _pop(context);
  }

  //endregion

  //region setting navigation methods
  Future<void> pushSettingPage(BuildContext context) => Navigator.of(context).push(
        createMobilePageRoute(
          context: context,
          builder: (_) => const SettingPage(),
          settings: RouteSettings(name: AppRoutes.setting.name),
          androidPageRoute: (builder, settings) => SharedAxisPageRoute<void>(builder: builder, settings: settings),
          iosPageRoute: (builder, settings) => CupertinoPageRoute<void>(builder: builder, settings: settings),
        ),
      );

  void popSettingPage(BuildContext context) {
    _pop(context);
  }

  //endregion

  //region notification navigation methods
  Future<void> pushNotificationPage(BuildContext context) => showBarModalBottomSheet(
        context: context,
        // expand: true,
        topControl: const SizedBox.shrink(), // remove bar
        barrierColor: Colors.black.withOpacity(Dimens.emphasisMedium),
        duration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeOutQuint,
        builder: (context) => const NotificationPage(),
      );

  void popNotificationPage(BuildContext context) {
    _pop(context);
  }

  //endregion

  //region sync navigation methods
  Future<void> pushSyncPage(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => const SyncPage(),
          settings: RouteSettings(name: AppRoutes.sync.name),
        ),
      );

  void popSyncPage(BuildContext context) {
    _pop(context);
  }

  //endregion

  //region holiday navigation methods
  Future<void> pushHolidayPage(BuildContext context) => showBarModalBottomSheet(
        context: context,
        expand: true,
        topControl: const SizedBox.shrink(), // remove bar
        barrierColor: Colors.grey[900]!.withOpacity(Dimens.emphasisMedium),
        duration: const Duration(milliseconds: 300),
        animationCurve: Curves.easeOutQuint,
        builder: (context) => const HolidayPage(),
      );

  void popHolidayPage(BuildContext context) {
    _pop(context);
  }

  //endregion

  void _pop<T extends Object>(BuildContext context, [T? result]) {
    clearFocus();
    Navigator.pop(context, result);
  }

  Route<T> createMobilePageRoute<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    required RouteSettings settings,
    required Route<T> Function(WidgetBuilder, RouteSettings) androidPageRoute,
    required Route<T> Function(WidgetBuilder, RouteSettings) iosPageRoute,
    Route<T> Function(WidgetBuilder, RouteSettings)? otherPageRoute,
  }) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
        return androidPageRoute(builder, settings);
      case TargetPlatform.iOS:
        return iosPageRoute(builder, settings);
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return otherPageRoute?.call(builder, settings) ?? MaterialPageRoute(builder: builder, settings: settings);
    }
  }
}
