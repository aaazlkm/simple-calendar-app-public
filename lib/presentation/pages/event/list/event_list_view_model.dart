import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:provider/provider.dart';
import 'package:result/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/date_range.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/calendar_usecase.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/holiday_usecase.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/trade/event_list_argument.dart';

mixin EventListViewModelData {
  static EventListViewModelData of(BuildContext context) => context.read<EventListViewModelData>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  final PublishSubject<LoadResultFailure<Complete>> _failedToFetchEvent = PublishSubject();

  Stream<LoadResultFailure<Complete>> get failedToFetchEvent => _failedToFetchEvent.stream;

  /// setupで渡される
  final BehaviorSubject<Calendar> _calendar = BehaviorSubject();

  Stream<Calendar> get calendar => _calendar.stream.distinct();

  Calendar get calendarValue => _calendar.value;

  /// setupで渡される
  final BehaviorSubject<DateTime> _nowDay = BehaviorSubject();

  Stream<DateTime> get nowDay => _nowDay.stream.distinct();

  DateTime get nowDayValue => _nowDay.value;

  final BehaviorSubject<LoadResult<BuiltList<Event>>> _eventsResult = BehaviorSubject.seeded(const LoadResult.loading());

  Stream<LoadResult<BuiltList<Event>>> get eventsResult => _eventsResult.stream.distinct();

  LoadResult<BuiltList<Event>> get eventsResultValue => _eventsResult.value;

  final BehaviorSubject<BuiltMap<int, BuiltList<Holiday>>> _yearToHolidaysCache = BehaviorSubject.seeded(BuiltMap.of({}));

  Stream<BuiltMap<int, BuiltList<Holiday>>> get yearToHolidaysCache => _yearToHolidaysCache.stream.distinct();

  BuiltMap<int, BuiltList<Holiday>> get yearToHolidaysCacheValue => _yearToHolidaysCache.value;

  Stream<BuiltList<Holiday>> get holidays => yearToHolidaysCache.map((event) => event.values.fold(BuiltList.of([]), (previousValue, element) => previousValue + element));

  BuiltList<Holiday> get holidaysValue => yearToHolidaysCacheValue.values.fold(BuiltList.of([]), (previousValue, element) => previousValue + element);

  void dispose() {
    _failedToFetchEvent.close();
    _calendar.close();
    _nowDay.close();
    _eventsResult.close();
    _yearToHolidaysCache.close();
    _compositeSubscription.clear();
  }
}

class EventListViewModel with EventListViewModelData {
  EventListViewModel({
    required this.calendarUseCase,
    required this.holidayUseCase,
  }) {
    _fetchHolidaysAutomatically();
  }

  final CalendarUseCase calendarUseCase;

  final HolidayUseCase holidayUseCase;

  void setup(EventListArgument argument) {
    _calendar.addIfNotClosed(argument.calendar);
    _nowDay.addIfNotClosed(argument.day);
    fetchAllEvents();
  }

  Future<void> fetchAllEvents() async {
    calendarUseCase.fetchAllEvents(calendarValue.id).withLoad().listen((result) {
      _eventsResult.addIfNotClosed(result);
      result.ifFailure(_failedToFetchEvent.add);
    }).addTo(_compositeSubscription);
  }

  void updateNowDay(DateTime nowDay) {
    _nowDay.add(nowDay);
  }

  void _fetchHolidaysAutomatically() {
    _nowDay.map((year) => year.year).distinct().listen((year) {
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
      _yearToHolidaysCache.addIfNotClosed(yearToHolidaysCacheValue.rebuild((map) => map[year] = holidays));
    });
  }
}
