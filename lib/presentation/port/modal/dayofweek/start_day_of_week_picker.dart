import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/presentation/port/modal/util/show_floating_modal.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

Future<DayOfWeek?> showDayOfWeekPicker(
  BuildContext context, {
  DayOfWeek? selectedDayOfWeek,
}) =>
    showFloatingModal<DayOfWeek>(
      context: context,
      expand: false,
      duration: const Duration(milliseconds: 250),
      animationCurve: Curves.easeOutSine,
      barrierColor: Colors.black.withOpacity(0.35),
      builder: (context) => DayOfWeekPicker(
        selectedDayOfWeek: selectedDayOfWeek,
      ),
    );

class DayOfWeekPicker extends StatelessWidget {
  const DayOfWeekPicker({
    this.selectedDayOfWeek,
    Key? key,
  }) : super(key: key);

  static List<DayOfWeek> dayOfWeeks = [
    DayOfWeek.saturday,
    DayOfWeek.sunday,
    DayOfWeek.monday,
  ];

  final DayOfWeek? selectedDayOfWeek;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _ModalTitle(),
          const Divider(height: 1),
          const SizedBox(height: Dimens.padding8),
          Column(
            children: dayOfWeeks
                .map(
                  (dayOfWeek) => _DayOfWeekItem(dayOfWeek: dayOfWeek, isSelected: dayOfWeek == selectedDayOfWeek),
                )
                .toList(),
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
                AppLocalizations.string(context).startDayOfWeek.title,
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

class _DayOfWeekItem extends StatelessWidget {
  const _DayOfWeekItem({
    required this.dayOfWeek,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  final DayOfWeek dayOfWeek;

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
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop(dayOfWeek);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  const SizedBox(width: Dimens.padding24),
                  Expanded(
                    child: Text(
                      AppLocalizations.string(context).setting.startDayOfWeekPickerItem(dayOfWeek),
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
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
