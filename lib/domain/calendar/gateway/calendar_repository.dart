import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';

abstract class CalendarRepository {
  Future<void> openDataSource();

  Future<void> closeDataSource();

  Future<void> reloadDataSource();

  Future<void> saveOrUpdateCalendars(List<Calendar> tables);

  Future<void> deleteCalendars(List<Calendar> tables);

  Future<List<Calendar>> fetchAllCalendars();

  Future<void> saveOrUpdateEvents(List<Event> tables);

  Future<void> deleteEvents(List<Event> tables);

  Future<List<Event>> fetchAllEvents();

  Future<List<Event>> fetchCalendarEvents({required String calendarId});
}
