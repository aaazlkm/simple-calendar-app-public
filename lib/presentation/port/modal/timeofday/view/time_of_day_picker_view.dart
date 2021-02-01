import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_time.dart';
import 'package:simple_calendar_app/presentation/port/modal/timeofday/time_of_day_picker.dart';
import 'package:simple_calendar_app/presentation/port/modal/timeofday/time_of_day_view_model.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class TimeOfDayPickerView extends StatelessWidget {
  const TimeOfDayPickerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _ModalTitle(),
          const Divider(height: 1),
          const SizedBox(height: Dimens.padding8),
          StreamBuilder<DailyRemindTime?>(
            stream: TimeOfDayViewModel.of(context).selectedDailyRemindTime,
            builder: (context, snapshot) => Column(
              children: TimeOfDayViewModel.timeOfDays
                  .map(
                    (timeOfDay) => _TimeOfDayItem(
                      dailyRemindTime: timeOfDay,
                      isSelected: timeOfDay == snapshot.data,
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: Dimens.padding12),
        ],
      );
}

class _ModalTitle extends StatelessWidget {
  const _ModalTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: Dimens.padding8),
          Container(
            height: Dimens.viewSize4,
            width: Dimens.viewSize40,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
              borderRadius: BorderRadius.circular(Dimens.radius8),
            ),
          ),
          const SizedBox(height: Dimens.padding16),
          Row(
            children: [
              const SizedBox(width: Dimens.padding24),
              Text(
                AppLocalizations.string(context).timeOfDayModal.topControlTitle,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: Dimens.padding24),
            ],
          ),
          const SizedBox(height: Dimens.padding20),
        ],
      );
}

class _TimeOfDayItem extends StatelessWidget {
  const _TimeOfDayItem({
    required this.dailyRemindTime,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final DailyRemindTime dailyRemindTime;

  final bool isSelected;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: Dimens.padding8),
        child: Material(
          elevation: isSelected ? 1 : 0,
          shadowColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(Dimens.radius8),
          color: Color.alphaBlend(isSelected ? Theme.of(context).colorScheme.secondary.withOpacity(0.2) : Colors.transparent, Theme.of(context).colorScheme.surface),
          child: InkWell(
            splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
            highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(Dimens.radius8),
            onTap: () => TimeOfDayController.of(context).onTimeOfDayItemTap(dailyRemindTime),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const SizedBox(width: Dimens.padding24),
                  Expanded(
                    child: Text(
                      MaterialLocalizations.of(context).formatTimeOfDay(dailyRemindTime.timeOfDay, alwaysUse24HourFormat: true),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                    ),
                  ),
                  Visibility(
                    visible: isSelected,
                    child: Icon(
                      Octicons.check,
                      size: Dimens.viewSize16,
                      color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(width: Dimens.padding24),
                ],
              ),
            ),
          ),
        ),
      );
}
