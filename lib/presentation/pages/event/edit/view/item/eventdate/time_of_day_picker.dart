import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/item_select_state.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

const double _labelHeight = Dimens.viewSize20;

const double _pickerWidth = Dimens.viewSize56;

const double _pickerItemHeight = Dimens.viewSize56;

TextStyle? _getPickerTextStyle(BuildContext context) => Theme.of(context).textTheme.subtitle1?.copyWith(
      color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
      fontWeight: FontWeight.bold,
    );

TextStyle? _getPickerSelectedTextStyle(BuildContext context) => Theme.of(context).textTheme.subtitle1?.copyWith(
      color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
      fontWeight: FontWeight.bold,
    );

class TimeOfDayPickerView extends StatefulWidget {
  const TimeOfDayPickerView({
    required this.eventDate,
    required this.itemSelectState,
    Key? key,
  }) : super(key: key);

  final EventDate eventDate;

  final ItemSelectState itemSelectState;

  @override
  _TimeOfDayPickerViewState createState() => _TimeOfDayPickerViewState();
}

class _TimeOfDayPickerViewState extends State<TimeOfDayPickerView> {
  UniqueKey pickerKey = UniqueKey();

  @override
  void didUpdateWidget(TimeOfDayPickerView oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// pickerを外から変更する方法が存在しないため、初期値をpickerに設定することができない
    /// そのためここではTimeOfDayが選択されるたびに、Keyを変更してWidgetを再構築することで、初期値を読み取るようにする
    /// 処理としてうまくないので、いい方法を考えついたら変更すること
    if (oldWidget.itemSelectState != ItemSelectState.timeOfDay && widget.itemSelectState == ItemSelectState.timeOfDay) {
      pickerKey = UniqueKey();
    }
  }

  @override
  Widget build(BuildContext context) => Padding(
        key: pickerKey,
        padding: const EdgeInsets.only(top: Dimens.padding16, left: Dimens.padding24),
        child: Row(
          children: [
            const Spacer(),
            Center(
              child: _HourMinutePicker(
                labelText: AppLocalizations.string(context).eventEdit.timePickerStartCaption,
                initialHour: widget.eventDate.start.hour,
                initialMinute: widget.eventDate.start.minute,
                onHourChanged: (hour) => EventEditController.of(context).onTimeOfDayChanged(startHour: hour.toInt()),
                onMinuteChanged: (minute) => EventEditController.of(context).onTimeOfDayChanged(startMinute: minute.toInt()),
              ),
            ),
            const SizedBox(width: Dimens.padding12),
            buildTilde(context),
            const SizedBox(width: Dimens.padding12),
            Center(
              child: _HourMinutePicker(
                labelText: AppLocalizations.string(context).eventEdit.timePickerEndCaption,
                initialHour: widget.eventDate.end.hour,
                initialMinute: widget.eventDate.end.minute,
                onHourChanged: (hour) => EventEditController.of(context).onTimeOfDayChanged(endHour: hour.toInt()),
                onMinuteChanged: (minute) => EventEditController.of(context).onTimeOfDayChanged(endMinute: minute.toInt()),
              ),
            ),
            const Spacer(),
          ],
        ),
      );

  Widget buildTilde(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: _labelHeight - Dimens.padding4), // pickerのテキストと揃っていないので調整
        child: Text(
          '~',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
              ),
        ),
      );
}

class _HourMinutePicker extends StatelessWidget {
  const _HourMinutePicker({
    required this.labelText,
    required this.initialHour,
    required this.initialMinute,
    required this.onHourChanged,
    required this.onMinuteChanged,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final int initialHour;
  final int initialMinute;
  final ValueChanged<num> onHourChanged;
  final ValueChanged<num> onMinuteChanged;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding16),
              child: SizedBox(
                height: _labelHeight,
                child: Text(
                  labelText,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                      ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _HourPicker(
                  value: initialHour,
                  onChanged: onHourChanged,
                ),
                buildColon(context),
                _MinutePicker(
                  value: initialMinute,
                  onChanged: onMinuteChanged,
                ),
              ],
            ),
          ),
        ],
      );

  Widget buildColon(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: Dimens.padding4), // pickerのテキストと揃っていないので調整
        child: Text(
          ':',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
              ),
        ),
      );
}

class _HourPicker extends StatelessWidget {
  const _HourPicker({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final int value;
  final ValueChanged<num> onChanged;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: ScrollBehaviorForRemoveOverflowColor(),
        child: NumberPicker(
          value: value,
          onChanged: onChanged,
          minValue: 0,
          maxValue: TimeOfDay.hoursPerDay - 1,
          textMapper: (numberText) => NumberFormat('00').format(int.parse(numberText)),
          infiniteLoop: true,
          itemHeight: _pickerItemHeight,
          itemWidth: _pickerWidth,
          textStyle: _getPickerTextStyle(context),
          selectedTextStyle: _getPickerSelectedTextStyle(context),
        ),
      );
}

class _MinutePicker extends StatelessWidget {
  const _MinutePicker({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final int value;
  final ValueChanged<num> onChanged;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: ScrollBehaviorForRemoveOverflowColor(),
        child: NumberPicker(
          value: value,
          onChanged: onChanged,
          minValue: 0,
          maxValue: TimeOfDay.minutesPerHour - 1,
          textMapper: (numberText) => NumberFormat('00').format(int.parse(numberText)),
          infiniteLoop: true,
          itemHeight: _pickerItemHeight,
          itemWidth: _pickerWidth,
          textStyle: _getPickerTextStyle(context),
          selectedTextStyle: _getPickerSelectedTextStyle(context),
          step: 5,
        ),
      );
}
