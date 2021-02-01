import 'package:built_collection/built_collection.dart';
import 'package:result/result.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/event_history_repository.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history.dart';

class EventHistoryUseCase {
  EventHistoryUseCase({
    required this.eventHistoryRepository,
  });

  final EventHistoryRepository eventHistoryRepository;

  Future<Result<BuiltList<EventHistory>>> fetchEventHistories(CalendarId calendarId) => Future(() async {
        final calendarEventTables = await eventHistoryRepository.fetchEventHistories(calendarId: calendarId.value);
        return calendarEventTables.toBuiltList();
      }).toResult();

  Future<Result<Complete>> saveOrUpdateEventHistoryNameAsKey(EventHistory eventHistory) => _saveOrUpdateEventHistoryNameAsKey(eventHistory).toComplete();

  Future<Result<Complete>> saveOrUpdateEventHistoriesNameAsKey(BuiltList<EventHistory> eventHistories) => Future(() async {
        for (final eventHistory in eventHistories) {
          await _saveOrUpdateEventHistoryNameAsKey(eventHistory);
        }
      }).toComplete();

  Future<Result<Complete>> deleteEventHistory(EventHistory event) => Future(() async {
        await eventHistoryRepository.deleteEventHistories([event]);
      }).toComplete();

  Future<void> _saveOrUpdateEventHistoryNameAsKey(EventHistory eventHistory) => Future(() async {
        final eventHistories = await eventHistoryRepository.fetchEventHistories(calendarId: eventHistory.calendarId.value);
        final eventHistorySameNames = eventHistories.where((e) => e.name == eventHistory.name);
        if (eventHistorySameNames.isNotEmpty) {
          await eventHistoryRepository.deleteEventHistories(eventHistorySameNames.toList());
        }
        await eventHistoryRepository.saveOrUpdateEventHistories([eventHistory]);
      });
}
