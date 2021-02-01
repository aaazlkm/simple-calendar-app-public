import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_time.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/port/modal/timeofday/time_of_day_view_model.dart';
import 'package:simple_calendar_app/presentation/port/modal/timeofday/view/time_of_day_picker_view.dart';
import 'package:simple_calendar_app/presentation/port/modal/util/show_floating_modal.dart';

Future<DailyRemindTime?> showTimeOfDayPicker(
  BuildContext context, {
  DailyRemindTime? selectedDailyRemindTime,
}) =>
    showFloatingModal<DailyRemindTime>(
      context: context,
      expand: false,
      duration: const Duration(milliseconds: 250),
      animationCurve: Curves.easeOutSine,
      barrierColor: Colors.black.withOpacity(0.35),
      builder: (context) => TimeOfDayPicker(selectedDailyRemindTime: selectedDailyRemindTime),
    );

class TimeOfDayPicker extends StatefulWidget {
  const TimeOfDayPicker({
    this.selectedDailyRemindTime,
    Key? key,
  }) : super(key: key);

  final DailyRemindTime? selectedDailyRemindTime;

  @override
  _TimeOfDayPickerState createState() => _TimeOfDayPickerState();
}

class _TimeOfDayPickerState extends State<TimeOfDayPicker> with TimeOfDayController {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<TimeOfDayController>.value(value: this),
          Provider<TimeOfDayViewModel>.value(value: _viewModel),
        ],
        child: const TimeOfDayPickerView(),
      );
}

mixin TimeOfDayController on State<TimeOfDayPicker> {
  static TimeOfDayController of(BuildContext context) => context.read<TimeOfDayController>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  late final TimeOfDayViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<TimeOfDayViewModel>()..setup(widget.selectedDailyRemindTime);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _compositeSubscription.clear();
    super.dispose();
  }

  void onTimeOfDayItemTap(DailyRemindTime dailyRemindTime) {
    HapticFeedback.lightImpact();
    Navigator.of(context).pop(dailyRemindTime);
  }
}
