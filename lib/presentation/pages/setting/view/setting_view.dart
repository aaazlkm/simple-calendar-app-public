import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_app_kit/simple_app_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_reminder_state.dart';
import 'package:simple_calendar_app/domain/setting/model/theme_type.dart';
import 'package:simple_calendar_app/presentation/pages/app/setting_store.dart';
import 'package:simple_calendar_app/presentation/pages/setting/setting_controller.dart';
import 'package:simple_calendar_app/presentation/pages/setting/setting_view_model.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';
import 'package:simple_calendar_app/presentation/res/platfrom_icon.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildAppBar(context),
        body: SafeArea(child: buildBody(context)),
      );

  AppBar _buildAppBar(BuildContext context) => AppBar(
        elevation: Dimens.elevation0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          padding: const EdgeInsets.only(left: Dimens.padding8),
          icon: Icon(PlatformIcon.dismiss),
          onPressed: () => SettingController.of(context).onCloseButtonTap(),
        ),
      );

  Widget buildBody(BuildContext context) => ScrollConfiguration(
        behavior: ScrollBehaviorForRemoveOverflowColor(),
        child: ListView(
          children: [
            const SizedBox(height: Dimens.padding16),
            SectionTitle(title: AppLocalizations.string(context).setting.title),
            const SizedBox(height: Dimens.padding32),
            SettingSectionCard(
              title: AppLocalizations.string(context).setting.sectionCalendar,
              children: [
                _buildThemeItem(context),
                _buildStartDayOfWeekItem(context),
                _buildNotificationItem(context),
                _buildHolidayItem(context),
                _buildSyncItem(context),
              ],
            ),
            const SizedBox(height: Dimens.padding24),
            SettingSectionCard(
              title: AppLocalizations.string(context).setting.sectionAboutApp,
              children: [
                _buildReviewItem(context),
                _buildInquiryItem(context),
                _buildLicenseItem(context),
                _buildTermsOfServiceItem(context),
                _buildPrivacyPolicyItem(context),
              ],
            ),
            const SizedBox(height: Dimens.padding64),
          ],
        ),
      );

  Widget _buildThemeItem(BuildContext context) => StreamBuilder<ThemeType>(
        stream: SettingStore.of(context).themeType,
        initialData: SettingStore.of(context).themeTypeValue,
        builder: (context, snapshot) => SectionItem(
          leading: Icon(
            FluentIcons.color_20_regular,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
          ),
          title: AppLocalizations.string(context).setting.itemTheme,
          onTap: () => SettingController.of(context).onThemeItemTap(),
          action: AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            firstChild: Icon(
              FluentIcons.weather_sunny_20_filled,
              color: Theme.of(context).colorScheme.secondary,
            ),
            secondChild: Icon(
              FluentIcons.weather_moon_20_filled,
              color: Theme.of(context).colorScheme.secondary,
            ),
            crossFadeState: snapshot.data == ThemeType.light ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ),
      );

  Widget _buildStartDayOfWeekItem(BuildContext context) => StreamBuilder<DayOfWeek>(
      stream: SettingViewModelData.of(context).startDayOfWeek,
      initialData: SettingViewModelData.of(context).startDayOfWeekValue,
      builder: (context, snapshot) => SectionItem(
            leading: Icon(
              FluentIcons.calendar_month_20_regular,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
            ),
            title: AppLocalizations.string(context).setting.itemStartDayOfWeek,
            action: Text(
              AppLocalizations.string(context).setting.itemStartDayOfWeekLabel(snapshot.requireData),
              style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisMedium)),
            ),
            onTap: () => SettingController.of(context).onStartDayOfWeekItemTap(),
          ));

  Widget _buildHolidayItem(BuildContext context) => SectionItem(
        leading: Icon(
          FluentIcons.calendar_add_20_regular,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
        ),
        title: AppLocalizations.string(context).setting.itemHoliday,
        onTap: () => SettingController.of(context).onHolidayItemTap(),
      );

  Widget _buildNotificationItem(BuildContext context) => SectionItem(
        leading: Icon(
          FluentIcons.alert_20_regular,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
        ),
        title: AppLocalizations.string(context).setting.itemNotification,
        onTap: () => SettingController.of(context).onNotificationItemTap(),
        action: StreamBuilder<bool>(
          stream: SettingViewModelData.of(context).dailyRemindTimeVisible,
          initialData: SettingViewModelData.of(context).dailyRemindTimeVisibleValue,
          builder: (context, snapshot) => Row(
            children: [
              Visibility(
                visible: snapshot.requireData,
                child: StreamBuilder<DailyReminderState>(
                  stream: SettingViewModelData.of(context).dailyReminderState,
                  initialData: SettingViewModelData.of(context).dailyReminderStateValue,
                  builder: (context, snapshot) => Text(
                    MaterialLocalizations.of(context).formatTimeOfDay(snapshot.requireData.remindTime.timeOfDay, alwaysUse24HourFormat: true),
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisMedium),
                        ),
                  ),
                ),
              ),
              Visibility(
                visible: !snapshot.requireData,
                child: Icon(
                  FluentIcons.chevron_right_12_regular,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisMedium),
                  size: Dimens.viewSize16,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildSyncItem(BuildContext context) => SectionItem(
        leading: Icon(
          FluentIcons.cloud_20_regular,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
        ),
        title: AppLocalizations.string(context).setting.itemSync,
        onTap: () => SettingController.of(context).onSyncItemTap(),
      );

  Widget _buildReviewItem(BuildContext context) => SectionItem(
        leading: Icon(
          FluentIcons.star_20_regular,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
        ),
        title: AppLocalizations.string(context).setting.itemReview,
        onTap: () => SettingController.of(context).onReviewItemTap(),
      );

  Widget _buildInquiryItem(BuildContext context) => SectionItem(
        leading: Icon(
          FluentIcons.mail_20_regular,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
        ),
        title: AppLocalizations.string(context).setting.itemInquiry,
        onTap: () => SettingController.of(context).onInquiryItem(),
      );

  Widget _buildLicenseItem(BuildContext context) => SectionItem(
        leading: Icon(
          FluentIcons.code_20_regular,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
        ),
        title: AppLocalizations.string(context).setting.itemLicense,
        onTap: () => SettingController.of(context).onLicenseItemTap(),
      );

  Widget _buildTermsOfServiceItem(BuildContext context) => SectionItem(
        leading: Icon(
          FluentIcons.text_description_20_regular,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
        ),
        title: AppLocalizations.string(context).setting.itemTermsAndConditions,
        onTap: () => SettingController.of(context).onTermsAndConditionsItemTap(),
      );

  Widget _buildPrivacyPolicyItem(BuildContext context) => SectionItem(
        leading: Icon(
          FluentIcons.lock_closed_20_regular,
          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
        ),
        title: AppLocalizations.string(context).setting.itemPrivacyPolicy,
        onTap: () => SettingController.of(context).onPrivacyPolicyItemTap(),
      );
}
