import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_app_kit/simple_app_kit.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_reminder_state.dart';
import 'package:simple_calendar_app/presentation/pages/notification/notification_page.dart';
import 'package:simple_calendar_app/presentation/pages/notification/notification_view_model.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class NotificationBodyView extends StatelessWidget {
  const NotificationBodyView({Key? key}) : super(key: key);

  static const double _horizontalPadding = Dimens.padding28;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: Dimens.padding16),
          _buildRemindNotificationItem(context),
          _buildRemindTimeOfDayItem(context),
        ],
      );

  InkWell _buildRemindNotificationItem(BuildContext context) => InkWell(
        onTap: () => NotificationController.of(context).onDairyRemindTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.padding8),
          child: Row(
            children: [
              const SizedBox(width: _horizontalPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.string(context).notification.dailyRemindTitle,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.8),
                          ),
                    ),
                    const SizedBox(height: Dimens.padding2),
                    Text(
                      AppLocalizations.string(context).notification.dailyRemindDescription,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisMedium),
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Dimens.padding16),
              StreamBuilder<bool>(
                stream: NotificationViewModel.of(context).dailyRemindSwitchState,
                initialData: NotificationViewModel.of(context).dailyRemindSwitchStateValue,
                builder: (context, snapshot) => SimpleAppSwitch(
                  value: snapshot.requireData,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  onChanged: (enable) => NotificationController.of(context).onDailyRemindEnableChanged(enable: enable),
                ),
              ),
              const SizedBox(width: _horizontalPadding - Dimens.padding4),
            ],
          ),
        ),
      );

  StreamBuilder<bool> _buildRemindTimeOfDayItem(BuildContext context) => StreamBuilder<bool>(
        stream: NotificationViewModel.of(context).dailyRemindSwitchState,
        initialData: NotificationViewModel.of(context).dailyRemindSwitchStateValue,
        builder: (context, snapshot) => AnimatedVisibility(
          visible: snapshot.requireData,
          duration: kThemeAnimationDuration,
          child: InkWell(
            onTap: () => NotificationController.of(context).onDailyRemindTimeTap(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.padding8),
              child: Row(
                children: [
                  const SizedBox(width: _horizontalPadding),
                  Expanded(
                    child: Text(
                      AppLocalizations.string(context).notification.dailyRemindTimeTitle,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
                          ),
                    ),
                  ),
                  const SizedBox(width: Dimens.padding16),
                  StreamBuilder<DailyReminderState>(
                    stream: NotificationViewModel.of(context).dailyReminderState,
                    initialData: NotificationViewModel.of(context).dailyReminderStateValue,
                    builder: (context, snapshot) => snapshot.requireData.enable
                        ? Text(
                            MaterialLocalizations.of(context).formatTimeOfDay(snapshot.requireData.remindTime.timeOfDay, alwaysUse24HourFormat: true),
                            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
                                ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(width: _horizontalPadding),
                ],
              ),
            ),
          ),
        ),
      );
}
