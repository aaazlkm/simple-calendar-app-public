import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/controller/calendar_pager_controller.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/multi_date_view_model.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/trade/multi_date_argument.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/trade/multi_date_return.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/view/multi_date_picker_view.dart';

Future<MultiDateReturn?> showMultiDatePicker(
  BuildContext context, {
  required MultiDateArgument argument,
}) =>
    showCupertinoModalBottomSheet<MultiDateReturn>(
      context: context,
      barrierColor: Colors.black.withOpacity(0.35),
      duration: const Duration(milliseconds: 250),
      animationCurve: Curves.easeOutSine,
      builder: (context) => MultiDatePicker(argument: argument),
    );

class MultiDatePicker extends StatefulWidget {
  const MultiDatePicker({required this.argument, Key? key}) : super(key: key);

  final MultiDateArgument argument;

  @override
  _MultiDatePickerState createState() => _MultiDatePickerState();
}

class _MultiDatePickerState extends State<MultiDatePicker> with MultiDateController {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<MultiDateController>.value(value: this),
          Provider<MultiDateViewModel>.value(value: _viewModel),
          Provider<CalendarPagerController>.value(value: _calendarPagerController),
        ],
        child: const MultiDatePickerView(),
      );
}

mixin MultiDateController on State<MultiDatePicker> {
  static MultiDateController of(BuildContext context) => context.read<MultiDateController>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  late final MultiDateViewModel _viewModel;
  late final CalendarPagerController _calendarPagerController;

  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<MultiDateViewModel>()..setup(widget.argument);
    _calendarPagerController = CalendarPagerController(initialYearMonth: _viewModel.yearMonth.value);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _calendarPagerController.dispose();
    _compositeSubscription.clear();
    super.dispose();
  }

  void onCalendarYearMonthChanged(DateTime yearMonth) {
    HapticFeedback.lightImpact();
    _viewModel.updateYearMonth(yearMonth);
  }

  Future<void> onCalendarCellTaped(DateTime dateTime) async {
    await HapticFeedback.lightImpact();
    _viewModel.selectDay(dateTime);
  }

  Future<void> onSelectButtonTap() async {
    await HapticFeedback.lightImpact();
    Navigator.pop(context, MultiDateReturn(_viewModel.selectedState.value.selectedDays));
  }

  Future<void> onCancelButtonTap() async {
    await HapticFeedback.lightImpact();
    Navigator.pop(context);
  }
}
