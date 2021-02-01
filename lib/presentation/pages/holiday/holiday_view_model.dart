import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:result/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/calendar_permission_status.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday_device_calendar_list.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/holiday_usecase.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/model/calendar_list_item.dart';

mixin HolidayViewModelData {
  static HolidayViewModelData of(BuildContext context) => context.read<HolidayViewModelData>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  final PublishSubject<Result<Complete>> _failureOfFetchingDeviceCalendars = PublishSubject();

  Stream<Result<Complete>> get failureOfFetchingDeviceCalendars => _failureOfFetchingDeviceCalendars.stream;

  final PublishSubject<Result<Complete>> _failureOfFetchingHolidayDeviceCalendarId = PublishSubject();

  Stream<Result<Complete>> get failureOfFetchingHolidayDeviceCalendarId => _failureOfFetchingHolidayDeviceCalendarId.stream;

  final BehaviorSubject<CalendarPermissionStatus> _calendarPermissionStatus = BehaviorSubject.seeded(CalendarPermissionStatus.needPermissionFromDeviceSetting);

  Stream<CalendarPermissionStatus> get calendarPermissionStatus => _calendarPermissionStatus.stream.distinct();

  CalendarPermissionStatus get calendarPermissionStatusValue => _calendarPermissionStatus.value;

  final BehaviorSubject<BuiltList<DeviceCalendar>> _deviceCalendars = BehaviorSubject.seeded(BuiltList.of([]));

  Stream<BuiltList<DeviceCalendar>> get deviceCalendars => _deviceCalendars.stream.distinct();

  BuiltList<DeviceCalendar> get deviceCalendarsValue => _deviceCalendars.value;

  final _holidayDeviceCalenderList = BehaviorSubject.seeded(HolidayDeviceCalendarList.empty());

  Stream<HolidayDeviceCalendarList> get holidayDeviceCalenderList => _holidayDeviceCalenderList.stream.distinct();

  HolidayDeviceCalendarList get holidayDeviceCalenderListValue => _holidayDeviceCalenderList.value;

  Stream<BuiltList<CalendarListItem>> get calendarListItems => Rx.combineLatest2<BuiltList<DeviceCalendar>, HolidayDeviceCalendarList, BuiltList<CalendarListItem>>(
        deviceCalendars,
        holidayDeviceCalenderList,
        _convertToCalendarListItems,
      ).map(_sortCalendarListItems);

  BuiltList<CalendarListItem> get calendarListItemsValue => _sortCalendarListItems(_convertToCalendarListItems(deviceCalendarsValue, holidayDeviceCalenderListValue));

  void dispose() {
    _failureOfFetchingDeviceCalendars.close();
    _failureOfFetchingHolidayDeviceCalendarId.close();
    _calendarPermissionStatus.close();
    _deviceCalendars.close();
    _holidayDeviceCalenderList.close();
    _compositeSubscription.clear();
  }

  BuiltList<CalendarListItem> _convertToCalendarListItems(BuiltList<DeviceCalendar> deviceCalendars, HolidayDeviceCalendarList holidayDeviceCalendarIds) =>
      deviceCalendars.map((calendar) => CalendarListItem(deviceCalendar: calendar, isSelected: holidayDeviceCalendarIds.contains(calendar.id))).toBuiltList();

  BuiltList<CalendarListItem> _sortCalendarListItems(BuiltList<CalendarListItem> deviceCalendars) => sortByChecked(_sortByAlphabetical(_distinctByName(deviceCalendars)));

  BuiltList<CalendarListItem> _distinctByName(BuiltList<CalendarListItem> deviceCalendars) {
    final names = deviceCalendars.map((e) => e.deviceCalendar.name).toSet();
    return deviceCalendars.rebuild((list) => list.retainWhere((x) => names.remove(x.deviceCalendar.name)));
  }

  BuiltList<CalendarListItem> _sortByAlphabetical(BuiltList<CalendarListItem> deviceCalendars) =>
      deviceCalendars.rebuild((list) => list..sort((a, b) => a.deviceCalendar.name.toLowerCase().compareTo(b.deviceCalendar.name.toLowerCase())));

  BuiltList<CalendarListItem> sortByChecked(BuiltList<CalendarListItem> deviceCalendars) => [
        ...deviceCalendars.where((item) => item.isSelected),
        ...deviceCalendars.where((item) => !item.isSelected).toBuiltList(),
      ].build();
}

class HolidayViewModel with HolidayViewModelData {
  HolidayViewModel({
    required this.holidayUseCase,
  }) {
    fetchCalendarPermissionStatus();
    fetchDeviceCalendars();
    fetchHolidayDeviceCalendarIds();

    _fetchDeviceCalendarsWhenPermissionGranted();
    _setupSavingCalendarIdsAutomatically();
  }

  final HolidayUseCase holidayUseCase;

  Future<void> fetchCalendarPermissionStatus() async {
    final permissionStatus = await Permission.calendar.status;
    final calendarPermissionStatus = CalendarPermissionStatusEx.from(permissionStatus: permissionStatus);
    _calendarPermissionStatus.add(calendarPermissionStatus);
  }

  Future<void> fetchDeviceCalendars() async {
    final result = await holidayUseCase.fetchAllDeviceCalendarsIfPermitted();
    result
      ..ifSuccess(_deviceCalendars.add)
      ..ifFailure((_) => _failureOfFetchingDeviceCalendars.add(result.toComplete()));
  }

  Future<void> fetchHolidayDeviceCalendarIds() async {
    final result = await holidayUseCase.fetchHolidayDeviceCalendarList();
    result
      ..ifSuccess(_holidayDeviceCalenderList.add)
      ..ifFailure((_) => _failureOfFetchingDeviceCalendars.add(result.toComplete()));
  }

  void useDeviceCalendarAsHolidayOrNot(DeviceCalendar deviceCalendar) {
    if (holidayDeviceCalenderListValue.contains(deviceCalendar.id)) {
      _holidayDeviceCalenderList.add(holidayDeviceCalenderListValue.remove(deviceCalendar.id));
    } else {
      _holidayDeviceCalenderList.add(holidayDeviceCalenderListValue.add(deviceCalendar.id));
    }
  }

  void _fetchDeviceCalendarsWhenPermissionGranted() {
    calendarPermissionStatus.listen((calendarPermissionStatus) {
      if (calendarPermissionStatus == CalendarPermissionStatus.granted) {
        fetchDeviceCalendars();
      }
    }).addTo(_compositeSubscription);
  }

  void _setupSavingCalendarIdsAutomatically() {
    holidayDeviceCalenderList
        .debounceTime(
          const Duration(milliseconds: 500),
        )
        .listen(holidayUseCase.resetHolidayDeviceCalendarList)
        .addTo(_compositeSubscription);
  }
}
