// @dart=2.9

import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:device_calendar/device_calendar.dart' as device_calendar;
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:result/result.dart';
import 'package:simple_calendar_app/domain/calendar/converter/device_calendar_converter.dart';
import 'package:simple_calendar_app/domain/calendar/converter/holiday_converter.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/holiday_device_calendar_repository.dart';
import 'package:simple_calendar_app/domain/calendar/model/date_range.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/device_calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday_device_calendar_list.dart';

// TODO(futoshi): device calendarを抽象化して使用するようにする
class HolidayUseCase {
  HolidayUseCase({
    @required this.holidayDeviceCalendarRepository,
  });

  final HolidayDeviceCalendarRepository holidayDeviceCalendarRepository;

  final device_calendar.DeviceCalendarPlugin _deviceCalendarPlugin = device_calendar.DeviceCalendarPlugin();

  ///　permissionが存在しない場合、空の配列を返す
  Future<Result<BuiltList<DeviceCalendar>>> fetchAllDeviceCalendarsIfPermitted() => _fetchAllDeviceCalendarsIfPermitted().toResult();

  /// permissionが存在しない場合、空の配列を返す
  Future<Result<BuiltList<Holiday>>> fetchHolidaysIfPermitted({@required DateRange dateRange}) => Future(() async {
        final deviceCalendars = await _fetchAllDeviceCalendarsIfPermitted();
        final holidayDeviceCalendarList = await _fetchHolidayDeviceCalendarList();
        final holidayDeviceCalendars = deviceCalendars.where((deviceCalendar) => holidayDeviceCalendarList.contains(deviceCalendar.id)).toBuiltList();
        final holidayFutures = holidayDeviceCalendars.map((deviceCalendar) => _fetchHolidaysIfPermitted(deviceCalendar: deviceCalendar, dateRange: dateRange));
        final nestedHolidays = await Future.wait(holidayFutures);
        return nestedHolidays.fold<BuiltList<Holiday>>(
          BuiltList.of([]),
          (previousValue, element) => previousValue + element,
        );
      }).toResult();

  Future<Result<HolidayDeviceCalendarList>> fetchHolidayDeviceCalendarList() => _fetchHolidayDeviceCalendarList().toResult();

  Future<Result<Complete>> resetHolidayDeviceCalendarList(HolidayDeviceCalendarList holidayDeviceCalendarList) => Future(() async {
        await holidayDeviceCalendarRepository.clearAllHolidayDeviceCalendarList();
        await holidayDeviceCalendarRepository.saveOrUpdateHolidayDeviceCalendars(holidayDeviceCalendarList);
      }).toComplete();

  /// permissionを持っていない状態で、[deviceCalendarPlugin.retrieveCalendars]を呼ぶと勝手にパーミッションダイアログが表示される
  /// したがってダイアログが勝手に表示されないように、permissionがある時だけ[deviceCalendarPlugin.retrieveCalendars]を呼ぶようにする
  Future<BuiltList<DeviceCalendar>> _fetchAllDeviceCalendarsIfPermitted() async {
    final permissionStatus = await Permission.calendar.status;
    switch (permissionStatus) {
      case PermissionStatus.granted:
        final calendarsResult = await _deviceCalendarPlugin.retrieveCalendars();
        return calendarsResult?.data?.map(DeviceCalendarConverter.fromPluginOrNull)?.where((element) => element != null)?.toSet()?.toBuiltList() ?? BuiltList.of([]);
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        return BuiltList.of([]);
    }
    throw AssertionError('unknown this type: $permissionStatus');
  }

  /// permissionが存在しない場合、空の配列を返す
  Future<BuiltList<Holiday>> _fetchHolidaysIfPermitted({@required DeviceCalendar deviceCalendar, @required DateRange dateRange}) async {
    final eventsResult = await _deviceCalendarPlugin.retrieveEvents(deviceCalendar.id.value, device_calendar.RetrieveEventsParams(startDate: dateRange.start, endDate: dateRange.end));
    return eventsResult?.data
            ?.map(
              (deviceEvent) => HolidayConverter.fromDeviceEventOrNull(deviceCalendar, deviceEvent),
            )
            ?.where((element) => element != null)
            ?.map(_adjustHolidayFormat)
            ?.toBuiltList() ??
        BuiltList.of([]);
  }

  Future<HolidayDeviceCalendarList> _fetchHolidayDeviceCalendarList() => holidayDeviceCalendarRepository.fetchHolidayDeviceCalendars();

  Holiday _adjustHolidayFormat(Holiday holiday) {
    /// androidでは2つの問題がある
    /// 1 祝日の日付がUTC基準で表現されている
    /// そのため祝日の日付をそのままDateTime(local)で表すと、TimeZoneが考慮されて+09:00分足された日になってしまう
    /// したがって、ここでは祝日の日付を一度UTCに変換し、それをDateTime(local)に変換する処理を行ってる
    /// 2 endの日付が翌日を指してる
    /// 祝日の日付が 00:00:00 ~ 00:00:00 のように表現されていることから、同じ日付にも関わらずendが翌日判定されてしまい表示がおかしくなってしまう
    /// したがってここでは、microseconds-1して同じ日付になるようにしている
    if (Platform.isAndroid) {
      final startUTC = holiday.dateRange.start.toUtc(); // solution for problem1
      final endUTC = holiday.dateRange.end.toUtc(); // solution for problem1
      final startDate = DateTime(startUTC.year, startUTC.month, startUTC.day, startUTC.hour, startUTC.minute, startUTC.second, startUTC.millisecond, startUTC.microsecond);
      final endDate = DateTime(endUTC.year, endUTC.month, endUTC.day, endUTC.hour, endUTC.minute, endUTC.second, endUTC.millisecond, endUTC.microsecond);
      return holiday.copyWith(
        dateRange: DateRange(
          start: startDate,
          end: endDate.add(const Duration(microseconds: -1)), // solution for problem2
        ),
      );
    }
    return holiday;
  }
}
