import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/lifecycle/state_lifecycle.dart';
import 'package:simple_calendar_app/presentation/navigator/app_navigator.dart';
import 'package:simple_calendar_app/presentation/pages/app/app.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/calendar_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/controller/calendar_pager_controller.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/controller/year_month_picker_controller.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/view/calendar_page_view.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/trade/event_edit_argument.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/trade/event_list_argument.dart';
import 'package:simple_calendar_app/presentation/port/review.dart';
import 'package:simple_calendar_app/presentation/port/toast.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> with RouteAware, StateLifecycle<CalendarPage>, CalendarController {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<CalendarController>.value(value: this),
          Provider<CalendarViewModelData>.value(value: _viewModel),
          Provider<CalendarPagerController>.value(value: _calendarPagerController),
          Provider<YearMonthPickerController>.value(value: _yearMonthPickerController),
        ],
        child: const CalendarPageView(),
      );
}

mixin CalendarController on State<CalendarPage>, StateLifecycle<CalendarPage> {
  static CalendarController of(BuildContext context) => context.read<CalendarController>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  late final CalendarViewModel _viewModel;
  late final CalendarPagerController _calendarPagerController;
  late final YearMonthPickerController _yearMonthPickerController;

  @override
  RouteObserver<ModalRoute> get routeObserver => appRouteObserver;

  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<CalendarViewModel>();
    _calendarPagerController = CalendarPagerController(initialYearMonth: _viewModel.yearMonthValue);
    _yearMonthPickerController = YearMonthPickerController(initialYear: _viewModel.yearMonthPickerStateValue.year);
    _bindViewModelEvent();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _calendarPagerController.dispose();
    _yearMonthPickerController.dispose();
    _compositeSubscription.clear();
    super.dispose();
  }

  @override
  void onOpened() {
    _viewModel
      ..updateIsPageOpened(isPageOpened: true)
      ..fetchAllData()
      ..reloadHolidays();
  }

  @override
  void onClosed() {
    _viewModel.updateIsPageOpened(isPageOpened: false);
  }

  void _bindViewModelEvent() {
    _viewModel.fetchingEventResult.listen((result) {
      result.ifFailure((_) => showToast(message: AppLocalizations.string(context).calendarFailedToFetchEvents));
    }).addTo(_compositeSubscription);

    _viewModel.reviewDialogDisplayEvent.listen((_) {
      _viewModel.recordReviewDialogDisplayed();
      requestReviewInAppOrStore(
        context,
        onStoreReviewed: _viewModel.recordUserReviewedApp,
      );
    }).addTo(_compositeSubscription);
  }

  void onTitleTap() {
    HapticFeedback.lightImpact();
    _viewModel.toggleYearMonthPickerVisible();
  }

  void onCalendarYearMonthChanged(DateTime yearMonth) {
    _viewModel.updateYearMonth(yearMonth);
  }

  Future<void> onCalendarCellTaped(DateTime dateTime) async {
    await AppNavigator.of(context).pushEventListPage(
      context: context,
      argument: EventListArgument(
        calendar: _viewModel.calendar,
        day: dateTime,
      ),
    );
  }

  Future<void> onCalendarCellLongPress(DateTime dateTime) async {
    await HapticFeedback.lightImpact();
    await _pushToEventEditScreen(dateTime: dateTime);
  }

  Future<void> onFloatingActionButtonTap() async {
    final now = DateTime.now();
    final yearMonth = _viewModel.yearMonthValue.copyWith(day: 1);
    await _pushToEventEditScreen(dateTime: yearMonth.isSameMonth(now) ? now : yearMonth);
  }

  void onCalendarPagerStartScroll() {
    _viewModel.updateCalendarPagerScrollingState(isScrolling: true);
  }

  void onCalendarPagerEndScroll() {
    _viewModel.updateCalendarPagerScrollingState(isScrolling: false);
  }

  void onYearMonthPicked(DateTime yearMonth) {
    HapticFeedback.lightImpact();
    _calendarPagerController.jumpToYearMonthPageIfNeeded(yearMonth);
    _viewModel
      ..updateYearMonth(yearMonth)
      ..updateYearMonthPickerStateOfVisible(visible: false);
  }

  void onYearMonthPickerYearChanged(DateTime year) {
    _viewModel.updateYearMonthPickerStateOfYear(year);
  }

  void onYearMothPickerOverlayTap() {
    _viewModel.updateYearMonthPickerStateOfVisible(visible: false);
  }

  void onYearMonthPickerNextButtonTap() {
    HapticFeedback.lightImpact();
    _yearMonthPickerController.nextPageWithAnimation();
  }

  void onYearMonthPickerPrevButtonTap() {
    HapticFeedback.lightImpact();
    _yearMonthPickerController.previousPageWithAnimation();
  }

  Future<void> _pushToEventEditScreen({required DateTime dateTime}) async {
    await AppNavigator.of(context).pushEventEditPage(
      context: context,
      argument: EventEditArgument.newItem(
        calendar: _viewModel.calendar,
        dateTime: dateTime,
      ),
    );
    await _viewModel.checkNeedToDisplayReviewDialog();
  }
}
