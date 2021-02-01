import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/item_select_state.dart';

const double _elevation = 1;

class TimeOfDaysView extends StatelessWidget {
  const TimeOfDaysView({
    required this.eventDate,
    required this.itemSelectState,
    Key? key,
  }) : super(key: key);

  final EventDate eventDate;

  final ItemSelectState itemSelectState;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: AnimatedVisibility(
                visible: eventDate.isAllDay,
                curve: Curves.easeOutCubic,
                duration: kThemeAnimationDuration,
                child: const _TimeOfDayEnableButton(),
              ),
            ),
          ),
          AnimatedVisibility(
            visible: !eventDate.isAllDay,
            curve: Curves.easeOutCubic,
            duration: kThemeAnimationDuration,
            child: _TimeOfDaysView(eventDate: eventDate, itemSelectState: itemSelectState),
          ),
        ],
      );
}

class _TimeOfDayEnableButton extends StatelessWidget {
  const _TimeOfDayEnableButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius16)),
        elevation: _elevation,
        color: Theme.of(context).colorScheme.background,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius16)),
          onTap: () => EventEditController.of(context).onEnableTimeOfDayButton(),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.padding6),
            child: Icon(
              FluentIcons.timer_20_regular,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisMedium),
              size: Dimens.viewSize24,
            ),
          ),
        ),
      );
}

class _TimeOfDaysView extends StatelessWidget {
  const _TimeOfDaysView({
    required this.eventDate,
    required this.itemSelectState,
    Key? key,
  }) : super(key: key);

  final EventDate eventDate;
  final ItemSelectState itemSelectState;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Column(
            children: [
              StreamBuilder<bool>(
                stream: EventEditViewModelData.of(context).isValidEventDate,
                initialData: EventEditViewModelData.of(context).isValidEventDateValue,
                builder: (context, snapshot) => _TimeOfDayText(
                  dateTime: eventDate.start,
                  isSelected: itemSelectState == ItemSelectState.timeOfDay,
                  isValidTimeOfDay: snapshot.requireData,
                  onTap: () => EventEditController.of(context).onTimeOfDayStartTap(),
                ),
              ),
              _TimeOfDayText(
                dateTime: eventDate.end,
                isSelected: itemSelectState == ItemSelectState.timeOfDay,
                isValidTimeOfDay: true,
                onTap: () => EventEditController.of(context).onTimeOfDayEndTap(),
              ),
            ],
          ),
          TweenAnimationBuilder<double>(
            duration: kThemeAnimationDuration,
            curve: Curves.easeOutSine,
            tween: Tween(begin: 0, end: itemSelectState == ItemSelectState.timeOfDay ? 1 : 0),
            builder: (context, value, child) => ClipOval(
              child: Align(
                heightFactor: value,
                widthFactor: value,
                child: child,
              ),
            ),
            child: AnimatedOpacity(
              opacity: itemSelectState == ItemSelectState.timeOfDay ? 1 : 0,
              duration: kThemeAnimationDuration,
              curve: Curves.easeInCubic,
              child: const _TimeOfDayDisableButton(),
            ),
          ),
        ],
      );
}

class _TimeOfDayText extends StatelessWidget {
  const _TimeOfDayText({
    required this.dateTime,
    required this.isSelected,
    required this.isValidTimeOfDay,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final DateTime dateTime;
  final bool isSelected;
  final bool isValidTimeOfDay;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius4)),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding6, vertical: Dimens.padding1),
          child: TweenAnimationBuilder<double>(
            duration: kThemeAnimationDuration,
            curve: Curves.easeInCubic,
            tween: Tween(begin: 0, end: isSelected ? _elevation : 0),
            builder: (context, elevation, child) => Material(
              elevation: elevation,
              type: isSelected ? MaterialType.card : MaterialType.transparency,
              color: isSelected ? Theme.of(context).colorScheme.background : Colors.transparent,
              borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius4)),
              child: child,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding8, vertical: Dimens.padding1),
              child: AnimatedDefaultTextStyle(
                style: (isSelected
                        ? Theme.of(context).textTheme.subtitle2?.copyWith(
                              fontSize: Dimens.fontSize16,
                              color: isValidTimeOfDay ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.error,
                            )
                        : Theme.of(context).textTheme.subtitle2?.copyWith(
                              fontSize: Dimens.fontSize14,
                              color: isValidTimeOfDay ? Theme.of(context).colorScheme.onBackground : Theme.of(context).colorScheme.error,
                            )) ??
                    DefaultTextStyle.of(context).style,
                duration: kThemeAnimationDuration,
                curve: Curves.easeInOutSine,
                child: Text(
                  '${NumberFormat('00').format(dateTime.hour)}:${NumberFormat('00').format(dateTime.minute)}',
                ),
              ),
            ),
          ),
        ),
      );
}

class _TimeOfDayDisableButton extends StatelessWidget {
  const _TimeOfDayDisableButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius16)),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () => EventEditController.of(context).onDisableTimeOfDayButton(),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.padding2),
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius16)),
            elevation: _elevation,
            color: Theme.of(context).colorScheme.background,
            child: const Padding(
              padding: EdgeInsets.all(Dimens.padding6),
              child: Icon(
                FluentIcons.dismiss_24_filled,
                size: Dimens.fontSize14,
              ),
            ),
          ),
        ),
      );
}
