import 'package:built_collection/built_collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nifu_flutter_kit/extensions/extensions.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:nifu_flutter_kit/widget/widgets.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/calendar_page.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/calendar_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/controller/year_month_picker_controller.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/model/year_month_picker_state.dart';

class YearMonthPickerBuilder extends StatelessWidget {
  const YearMonthPickerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<YearMonthPickerState>(
        stream: CalendarViewModelData.of(context).yearMonthPickerState,
        initialData: CalendarViewModelData.of(context).yearMonthPickerStateValue,
        builder: (context, snapshot) => YearMonthPicker(yearMonthPickerState: snapshot.requireData),
      );
}

class YearMonthPicker extends StatelessWidget {
  const YearMonthPicker({
    required this.yearMonthPickerState,
    Key? key,
  }) : super(key: key);

  final YearMonthPickerState yearMonthPickerState;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned.fill(
            child: AnimatedVisibility(
              visible: yearMonthPickerState.visible,
              duration: kThemeAnimationDuration,
              curve: yearMonthPickerState.visible ? Curves.easeOutSine : Curves.easeInSine,
              child: GestureDetector(
                onTap: () => CalendarController.of(context).onYearMothPickerOverlayTap(),
                child: const ColoredBox(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                AnimatedExpansion(
                  isExpanded: yearMonthPickerState.visible,
                  duration: kThemeAnimationDuration,
                  curve: yearMonthPickerState.visible ? Curves.easeOutSine : Curves.easeInSine,
                  maintainState: true,
                  maintainAnimation: true,
                  child: _YearMonthPickerView(year: yearMonthPickerState.year),
                ),
                const Expanded(child: Center())
              ],
            ),
          ),
        ],
      );
}

class _YearMonthPickerView extends StatelessWidget {
  const _YearMonthPickerView({
    required this.year,
    Key? key,
  }) : super(key: key);

  final DateTime year;

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).colorScheme.background,
        child: SizedBox(
          height: Dimens.viewSize192,
          child: Column(
            children: [
              const Divider(height: Dimens.viewSize1, thickness: 0.5),
              const SizedBox(height: Dimens.padding8),
              _YearMonthPickerToolbar(year: year),
              Expanded(
                child: _YearMonthPager(
                  yearBuilder: (_, year) => _MonthOfYearsGridView(year: year),
                  onYearChanged: (year) => CalendarController.of(context).onYearMonthPickerYearChanged(year),
                ),
              ),
              const SizedBox(height: Dimens.padding16),
            ],
          ),
        ),
      );
}

class _YearMonthPickerToolbar extends StatelessWidget {
  const _YearMonthPickerToolbar({
    required this.year,
    Key? key,
  }) : super(key: key);

  final DateTime year;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius16)),
            onTap: () => CalendarController.of(context).onYearMonthPickerPrevButtonTap(),
            child: Padding(
              padding: const EdgeInsets.all(Dimens.padding8),
              child: Icon(
                FluentIcons.chevron_left_24_filled,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                size: Dimens.viewSize20,
              ),
            ),
          ),
          Text(
            DateFormat.y().format(year),
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
          ),
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius16)),
            onTap: () => CalendarController.of(context).onYearMonthPickerNextButtonTap(),
            child: Padding(
              padding: const EdgeInsets.all(Dimens.padding8),
              child: Icon(
                FluentIcons.chevron_right_24_filled,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                size: Dimens.viewSize20,
              ),
            ),
          ),
        ],
      );
}

class _YearMonthPager extends StatelessWidget {
  const _YearMonthPager({
    required this.yearBuilder,
    required this.onYearChanged,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, DateTime yearMonth) yearBuilder;

  final ValueChanged<DateTime> onYearChanged;

  @override
  Widget build(BuildContext context) => PageView.builder(
        controller: YearMonthPickerController.of(context).pageController,
        onPageChanged: (pageIndex) => onYearChanged(YearMonthPickerController.calculateYearFromPageIndex(pageIndex)),
        itemCount: YearMonthPickerController.pageCount,
        itemBuilder: (context, index) => yearBuilder(context, YearMonthPickerController.calculateYearFromPageIndex(index)),
      );
}

class _MonthOfYearsGridView extends StatelessWidget {
  const _MonthOfYearsGridView({
    required this.year,
    Key? key,
  }) : super(key: key);

  final DateTime year;

  BuiltList<DateTime> createMonthOfYears(DateTime year) => [
        DateTime.january,
        DateTime.february,
        DateTime.march,
        DateTime.april,
        DateTime.may,
        DateTime.june,
        DateTime.july,
        DateTime.august,
        DateTime.september,
        DateTime.october,
        DateTime.november,
        DateTime.december,
      ].map((month) => year.copyWith(month: month)).toBuiltList();

  @override
  Widget build(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding16),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: DateTime.monthsPerYear ~/ 2,
            mainAxisSpacing: Dimens.padding20,
            crossAxisSpacing: Dimens.padding20,
            children: createMonthOfYears(year)
                .map(
                  (yearMonth) => _MonthOfYearView(yearMonth: yearMonth),
                )
                .toList(),
          ),
        ),
      );
}

class _MonthOfYearView extends StatelessWidget {
  const _MonthOfYearView({
    required this.yearMonth,
    Key? key,
  }) : super(key: key);

  final DateTime yearMonth;

  Color _backgroundColor(BuildContext context, DateTime calendarYearMonth) => yearMonth.isSameMonth(calendarYearMonth)
      ? Theme.of(context).colorScheme.secondary.withOpacity(Dimens.emphasisHigh)
      : yearMonth.isSameMonth(DateTime.now())
          ? Theme.of(context).colorScheme.onBackground.withOpacity(0.08)
          : Colors.transparent;

  Color _textColor(BuildContext context, DateTime calendarYearMonth) =>
      yearMonth.isSameMonth(calendarYearMonth) ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onBackground;

  @override
  Widget build(BuildContext context) => StreamBuilder<DateTime>(
        stream: CalendarViewModelData.of(context).yearMonth,
        initialData: CalendarViewModelData.of(context).yearMonthValue,
        builder: (context, snapshot) => Material(
          borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius32)),
          color: _backgroundColor(context, snapshot.requireData),
          child: InkWell(
            onTap: () => CalendarController.of(context).onYearMonthPicked(yearMonth),
            borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius32)),
            child: Center(
              child: Text(
                DateFormat.MMM().format(yearMonth),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: _textColor(context, snapshot.requireData),
                      fontSize: Dimens.fontSize12,
                      fontWeight: yearMonth.isSameMonth(snapshot.requireData) ? FontWeight.bold : FontWeight.normal,
                    ),
              ),
            ),
          ),
        ),
      );
}
