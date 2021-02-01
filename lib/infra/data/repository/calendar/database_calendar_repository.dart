import 'package:simple_calendar_app/domain/calendar/gateway/calendar_repository.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/infra/data/database/app_database.dart';
import 'package:simple_calendar_app/infra/data/database/dao/calendar_dao.dart';
import 'package:simple_calendar_app/infra/data/database/mapper/calendar_mapper.dart';
import 'package:simple_calendar_app/infra/data/database/mapper/event_mapper.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl({
    required this.calendarDao,
  });

  final CalendarDao calendarDao;

  @override
  Future<void> openDataSource() => AppDatabase.instance.openDatabase();

  @override
  Future<void> closeDataSource() => AppDatabase.instance.closeDatabase();

  @override
  Future<void> reloadDataSource() => AppDatabase.instance.reloadDatabase();

  @override
  Future<void> saveOrUpdateCalendars(List<Calendar> calendars) => calendarDao.saveOrUpdateCalendars(calendars.map(CalendarMapper.toTable).toList());

  @override
  Future<void> deleteCalendars(List<Calendar> calendars) => calendarDao.deleteCalendars(calendars.map(CalendarMapper.toTable).toList());

  @override
  Future<List<Calendar>> fetchAllCalendars() => calendarDao.fetchAllCalendars().then((value) => value.map(CalendarMapper.fromTable).toList());

  @override
  Future<void> saveOrUpdateEvents(List<Event> events) => calendarDao.saveOrUpdateEvents(events.map(EventMapper.toTable).toList());

  @override
  Future<void> deleteEvents(List<Event> events) => calendarDao.deleteEvents(events.map(EventMapper.toTable).toList());

  @override
  Future<List<Event>> fetchAllEvents() => calendarDao.fetchAllEvents().then((value) => value.map(EventMapper.fromTable).toList());

  @override
  Future<List<Event>> fetchCalendarEvents({required String calendarId}) => calendarDao.fetchCalendarEvents(calendarId: calendarId).then((value) => value.map(EventMapper.fromTable).toList());
}
