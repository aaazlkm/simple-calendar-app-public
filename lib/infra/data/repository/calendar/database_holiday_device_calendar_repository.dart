import 'package:simple_calendar_app/domain/calendar/gateway/holiday_device_calendar_repository.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday_device_calendar_list.dart';
import 'package:simple_calendar_app/infra/data/database/dao/holiday_device_calendar_dao.dart';
import 'package:simple_calendar_app/infra/data/database/mapper/holiday_device_calendar_list_mapper.dart';

class DatabaseHolidayDeviceCalendarRepository implements HolidayDeviceCalendarRepository {
  DatabaseHolidayDeviceCalendarRepository({
    required this.holidayDeviceCalendarDao,
  });

  final HolidayDeviceCalendarDao holidayDeviceCalendarDao;

  @override
  Future<void> saveOrUpdateHolidayDeviceCalendars(HolidayDeviceCalendarList holidayDeviceCalendarList) => holidayDeviceCalendarDao.saveOrUpdateCalendars(
        HolidayDeviceCalendarListMapper.toTable(holidayDeviceCalendarList),
      );

  @override
  Future<void> clearAllHolidayDeviceCalendarList() => holidayDeviceCalendarDao.clearAllHolidayDeviceCalendarTables();

  @override
  Future<HolidayDeviceCalendarList> fetchHolidayDeviceCalendars() => holidayDeviceCalendarDao.fetchAllHolidayDeviceCalendars().then(
        HolidayDeviceCalendarListMapper.fromTable,
      );
}
