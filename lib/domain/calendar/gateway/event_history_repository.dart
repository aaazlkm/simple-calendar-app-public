import 'package:simple_calendar_app/domain/calendar/model/history/event_history.dart';

abstract class EventHistoryRepository {
  Future<void> saveOrUpdateEventHistories(List<EventHistory> tables);

  Future<void> deleteEventHistories(List<EventHistory> tables);

  Future<List<EventHistory>> fetchEventHistories({required String calendarId});
}
