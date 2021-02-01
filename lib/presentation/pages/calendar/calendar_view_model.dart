import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:result/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/appevent/usecase/app_event_usecase.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/calendar/model/date_range.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/calendar_usecase.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/holiday_usecase.dart';
import 'package:simple_calendar_app/domain/setting/usecase/setting_usecase.dart';
import 'package:simple_calendar_app/presentation/lifecycle/store_lifecycle.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/model/year_month_picker_state.dart';

mixin CalendarViewModelData {
  static CalendarViewModelData of(BuildContext context) => context.read<CalendarViewModelData>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  final PublishSubject<Result<Complete>> _fetchingEventResult = PublishSubject();

  Stream<Result<Complete>> get fetchingEventResult => _fetchingEventResult.stream;

  final PublishSubject<Complete> _reviewDialogDisplayEvent = PublishSubject();

  Stream<Complete> get reviewDialogDisplayEvent => _reviewDialogDisplayEvent.stream;

  Calendar get calendar => Constant.defaultCalendar;

  final BehaviorSubject<DateTime> _yearMonth = BehaviorSubject.seeded(DateTime.now());

  Stream<DateTime> get yearMonth => _yearMonth.stream.distinct();

  DateTime get yearMonthValue => _yearMonth.value;

  final BehaviorSubject<BuiltList<Event>> _events = BehaviorSubject.seeded(BuiltList.of([]));

  Stream<BuiltList<Event>> get events => _events.stream.distinct();

  BuiltList<Event> get eventsValue => _events.value;

  final BehaviorSubject<DayOfWeek> _startDayOfWeek = BehaviorSubject.seeded(Constant.defaultStartDayOfWeek);

  Stream<DayOfWeek> get startDayOfWeek => _startDayOfWeek.stream.distinct();

  DayOfWeek get startDayOfWeekValue => _startDayOfWeek.value;

  final BehaviorSubject<bool> _isPageOpened = BehaviorSubject.seeded(true);

  ValueStream<bool> get isPageOpened => _isPageOpened;

  final BehaviorSubject<bool> _isCalendarPagerScrolling = BehaviorSubject.seeded(false);

  Stream<bool> get isCalendarPagerScrolling => _isCalendarPagerScrolling.stream.distinct();

  bool get isCalendarPagerScrollingValue => _isCalendarPagerScrolling.value;

  final BehaviorSubject<BuiltMap<int, BuiltList<Holiday>>> _yearToHolidaysCache = BehaviorSubject.seeded(BuiltMap.of({}));

  Stream<BuiltMap<int, BuiltList<Holiday>>> get yearToHolidaysCache => _yearToHolidaysCache.stream.distinct();

  BuiltMap<int, BuiltList<Holiday>> get yearToHolidaysCacheValue => _yearToHolidaysCache.value;

  Stream<BuiltList<Holiday>> get holidays => yearToHolidaysCache.map((event) => event.values.fold(BuiltList.of([]), (previousValue, element) => previousValue + element));

  BuiltList<Holiday> get holidaysValue => yearToHolidaysCacheValue.values.fold(BuiltList.of([]), (previousValue, element) => previousValue + element);

  final BehaviorSubject<YearMonthPickerState> _yearMonthPickerState = BehaviorSubject.seeded(YearMonthPickerState(year: DateTime.now(), visible: false));

  Stream<YearMonthPickerState> get yearMonthPickerState => _yearMonthPickerState.stream.distinct();

  YearMonthPickerState get yearMonthPickerStateValue => _yearMonthPickerState.value;

  Stream<bool> get floatingActionButtonVisible => Rx.combineLatest2<bool, bool, bool>(
        isCalendarPagerScrolling,
        yearMonthPickerState.map((state) => state.visible),
        (a, b) => !(a || b),
      );

  bool get floatingActionButtonVisibleValue => !(isCalendarPagerScrollingValue || yearMonthPickerStateValue.visible);

  void dispose() {
    _fetchingEventResult.close();
    _reviewDialogDisplayEvent.close();
    _yearMonth.close();
    _events.close();
    _startDayOfWeek.close();
    _isPageOpened.close();
    _isCalendarPagerScrolling.close();
    _yearToHolidaysCache.close();
    _yearMonthPickerState.close();
    _compositeSubscription.clear();
  }
}

class CalendarViewModel with StoreLifecycle, CalendarViewModelData {
  CalendarViewModel({
    required this.calendarUseCase,
    required this.holidayUseCase,
    required this.settingUseCase,
    required this.appEventUseCase,
  }) {
    fetchAllData();
    _fetchHolidaysAutomatically();
  }

  final CalendarUseCase calendarUseCase;

  final HolidayUseCase holidayUseCase;

  final SettingUseCase settingUseCase;

  final AppEventUseCase appEventUseCase;

  void updateYearMonth(DateTime yearMonth) {
    _yearMonth.add(yearMonth);
  }

  void fetchAllData() {
    fetchAllEvents();
    getStartDayOfWeek();
  }

  Future<void> fetchAllEvents() async {
    final result = await calendarUseCase.fetchAllEvents(calendar.id);
    result.ifSuccess(_events.add);
    _fetchingEventResult.add(result.toComplete());
  }

  Future<void> getStartDayOfWeek() async {
    final result = await settingUseCase.getStartDayOfWeek();
    result.when(
      success: _startDayOfWeek.add,
      failure: logger.severe,
    );
  }

  void updateCalendarPagerScrollingState({required bool isScrolling}) {
    _isCalendarPagerScrolling.add(isScrolling);
  }

  /// 権限取得、拒否、祝日カレンダーの変更に対応するために、画面表示契機でキャッシュをクリアし再度ロードする
  void reloadHolidays() {
    // 年末年始の祝日も表示するために、表示してる月の年 + 周りの年 の祝日を取得してる
    _fetchYearHolidays(yearMonthValue.year - 1);
    _fetchYearHolidays(yearMonthValue.year);
    _fetchYearHolidays(yearMonthValue.year + 1);
  }

  void toggleYearMonthPickerVisible() {
    updateYearMonthPickerStateOfVisible(visible: !yearMonthPickerStateValue.visible);
  }

  void updateYearMonthPickerStateOfVisible({required bool visible}) {
    _yearMonthPickerState.add(yearMonthPickerStateValue.copyWith(visible: visible));
  }

  void updateYearMonthPickerStateOfYear(DateTime year) {
    _yearMonthPickerState.add(yearMonthPickerStateValue.copyWith(year: year));
  }

  void updateIsPageOpened({required bool isPageOpened}) {
    _isPageOpened.add(isPageOpened);
  }

  //region review dialog methods
  Future<void> checkNeedToDisplayReviewDialog() async {
    final needToDisplayReviewDialog = await appEventUseCase.needToDisplayReviewDialog().then((value) => value.dataOrNull ?? false);
    if (needToDisplayReviewDialog) {
      _reviewDialogDisplayEvent.add(Complete());
    }
  }

  void recordReviewDialogDisplayed() {
    appEventUseCase.recordReviewDialogDisplayed();
  }

  void recordUserReviewedApp() {
    appEventUseCase.recordUserReviewedApp();
  }

//endregion

  void _fetchHolidaysAutomatically() {
    yearMonth.map((year) => year.year).distinct().listen((year) {
      _fetchYearHolidaysIfNoCache(year - 1);
      _fetchYearHolidaysIfNoCache(year);
      _fetchYearHolidaysIfNoCache(year + 1);
    }).addTo(_compositeSubscription);
  }

  void _fetchYearHolidaysIfNoCache(int year) {
    if (yearToHolidaysCacheValue[year] == null) {
      _fetchYearHolidays(year);
    }
  }

  Future<void> _fetchYearHolidays(int year) async {
    final holidaysResult = await holidayUseCase.fetchHolidaysIfPermitted(dateRange: DateRange(start: DateTime(year), end: DateTime(year, DateTime.december)));
    holidaysResult.ifSuccess((holidays) {
      _yearToHolidaysCache.add(yearToHolidaysCacheValue.rebuild((map) => map[year] = holidays));
    });
  }
}
