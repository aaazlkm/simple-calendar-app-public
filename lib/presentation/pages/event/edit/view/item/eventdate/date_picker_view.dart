import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/controller/date_picker_page_controller.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/date_picker_state.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';
import 'package:simple_calendar_app/presentation/widget/calendar_view.dart';

class DatePickerView extends StatelessWidget {
  const DatePickerView({
    required this.datePickerState,
    required this.startDayOfWeek,
    Key? key,
  }) : super(key: key);

  final DatePickerState datePickerState;

  final DayOfWeek startDayOfWeek;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          _DayOfPickerToolbar(
            datePickerState: datePickerState,
          ),
          DayOfWeeksView(
            startDayOfWeek: startDayOfWeek,
            dayOfWeekTextBuilder: (context, dayOfWeek) => Text(
              AppLocalizations.string(context).eventEdit.datePickerDayOfWeek(dayOfWeek),
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisLow),
                  ),
            ),
          ),
          Expanded(
            child: _CalendarPager(
              onYearMonthChanged: EventEditController.of(context).onDatePickerYearMonthChanged,
              calendarBuilder: (context, yearMonth) => CalendarMonthView(
                yearMonth: yearMonth,
                startDayOfWeek: startDayOfWeek,
                calendarDividerBuilder: (_) => const SizedBox.shrink(),
                dayBuilder: (context, day) => _DayView(
                  datePickerState: datePickerState,
                  thisMonth: yearMonth,
                  day: day,
                ),
              ),
            ),
          )
        ],
      );
}

class _DayOfPickerToolbar extends StatelessWidget {
  const _DayOfPickerToolbar({
    required this.datePickerState,
    Key? key,
  }) : super(key: key);

  final DatePickerState datePickerState;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(width: Dimens.padding16),
          Expanded(
            child: Text(
              datePickerState.yearMonth.isSameYear(DateTime.now()) ? DateFormat.MMM().format(datePickerState.yearMonth) : DateFormat.yMMM().format(datePickerState.yearMonth),
              style: Theme.of(context).textTheme.subtitle2?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
          IconButton(
            icon: const Icon(FluentIcons.chevron_left_20_regular),
            iconSize: Dimens.viewSize20,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisHigh),
            onPressed: () => EventEditController.of(context).onDatePickerPrevMonthTap(),
          ),
          IconButton(
            icon: const Icon(FluentIcons.chevron_right_20_regular),
            iconSize: Dimens.viewSize20,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisHigh),
            onPressed: () => EventEditController.of(context).onDatePickerNextMonthTap(),
          ),
          const SizedBox(width: Dimens.padding4),
        ],
      );
}

class _CalendarPager extends StatelessWidget {
  const _CalendarPager({
    required this.calendarBuilder,
    required this.onYearMonthChanged,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, DateTime yearMonth) calendarBuilder;

  final ValueChanged<DateTime> onYearMonthChanged;

  @override
  Widget build(BuildContext context) => PageView.builder(
        controller: DatePickerPageController.of(context).pageController,
        onPageChanged: (pageIndex) => onYearMonthChanged(DatePickerPageController.calculateYearMonthFromPageIndex(pageIndex)),
        itemCount: DatePickerPageController.pageCount,
        itemBuilder: (context, index) => calendarBuilder(context, DatePickerPageController.calculateYearMonthFromPageIndex(index)),
      );
}

class _DayView extends StatelessWidget {
  const _DayView({
    required this.datePickerState,
    required this.thisMonth,
    required this.day,
    Key? key,
  }) : super(key: key);

  final DatePickerState datePickerState;

  final DateTime thisMonth;

  final DateTime day;

  Color _backgroundColor(BuildContext context) => datePickerState.isSelected(day)
      ? Theme.of(context).colorScheme.secondary.withOpacity(Dimens.emphasisHigh)
      : datePickerState.prevDateRange.isIn(day)
          ? Theme.of(context).colorScheme.secondary.withOpacity(0.15)
          : day.isSameDay(DateTime.now())
              ? Theme.of(context).colorScheme.onSurface.withOpacity(0.05)
              : Colors.transparent;

  Color _textColor(BuildContext context) => datePickerState.isSelected(day)
      ? Theme.of(context).colorScheme.onSecondary.withOpacity(
            Dimens.emphasisHigh,
          )
      : Theme.of(context).colorScheme.onSurface;

  @override
  Widget build(BuildContext context) => day.isSameMonth(thisMonth)
      ? InkWell(
          splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.03),
          overlayColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary.withOpacity(0.03)),
          hoverColor: Theme.of(context).colorScheme.secondary.withOpacity(0.03),
          focusColor: Theme.of(context).colorScheme.secondary.withOpacity(0.03),
          highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.03),
          onTap: () => EventEditController.of(context).onDatePickerDaySelected(day),
          child: ColoredBox(
            color: _backgroundColor(context),
            child: Center(
              child: Text(
                day.day.toString(),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: _textColor(context),
                      fontWeight: datePickerState.isSelected(day) ? FontWeight.bold : FontWeight.normal,
                      fontSize: Dimens.fontSize11,
                    ),
              ),
            ),
          ),
        )
      : InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () {},
          child: const Center(),
        ); // 表示されていない時にタップされても、date pickerが閉じないようにする
}
