import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/navigator/app_navigator.dart';
import 'package:simple_calendar_app/presentation/pages/app/setting_store.dart';
import 'package:simple_calendar_app/presentation/pages/setting/setting_page.dart';
import 'package:simple_calendar_app/presentation/pages/setting/setting_view_model.dart';
import 'package:simple_calendar_app/presentation/port/inquery.dart';
import 'package:simple_calendar_app/presentation/port/license.dart';
import 'package:simple_calendar_app/presentation/port/modal/dayofweek/start_day_of_week_picker.dart';
import 'package:simple_calendar_app/presentation/port/privacy_policy.dart';
import 'package:simple_calendar_app/presentation/port/review.dart';
import 'package:simple_calendar_app/presentation/port/terms_and_conditions.dart';

mixin SettingController on State<SettingPage> {
  static SettingController of(BuildContext context) => context.read<SettingController>();

  late final SettingViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = locator.get<SettingViewModel>();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  void onCloseButtonTap() {
    AppNavigator.of(context).popSettingPage(context);
  }

  Future<void> onThemeItemTap() async {
    await HapticFeedback.lightImpact();
    if (!mounted) {
      return;
    }
    // エラー表示してもユーザはどうしようもないので、無視
    final result = await SettingStore.of(context).toggleThemeType();
    result.ifFailure((e) {
      logger.info('Failed to toggle theme type');
    });
  }

  Future<void> onStartDayOfWeekItemTap() async {
    final dayOfWeekOrNull = await showDayOfWeekPicker(context, selectedDayOfWeek: viewModel.startDayOfWeekValue);
    if (dayOfWeekOrNull != null) {
      await viewModel.changeStartDayOfWeek(dayOfWeekOrNull);
    }
  }

  void onHolidayItemTap() {
    AppNavigator.of(context).pushHolidayPage(context);
  }

  Future<void> onNotificationItemTap() async {
    await AppNavigator.of(context).pushNotificationPage(context);
    viewModel.fetchAllData();
  }

  void onSyncItemTap() {
    AppNavigator.of(context).pushSyncPage(context);
  }

  void onReviewItemTap() {
    requestStoreReview();
  }

  void onInquiryItem() {
    showInquiryPage();
  }

  void onLicenseItemTap() {
    showAppLicensePage(context: context);
  }

  void onTermsAndConditionsItemTap() {
    showTermsAndConditionsPage();
  }

  void onPrivacyPolicyItemTap() {
    showPrivacyPolicyPage();
  }
}
