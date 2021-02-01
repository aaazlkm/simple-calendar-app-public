import 'package:simple_calendar_app/domain/calendar/gateway/event_history_repository.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history.dart';
import 'package:simple_calendar_app/infra/data/database/dao/event_history_dao.dart';
import 'package:simple_calendar_app/infra/data/database/mapper/event_history_mapper.dart';

class DatabaseEventHistoryRepository implements EventHistoryRepository {
  DatabaseEventHistoryRepository({
    required this.eventHistoryDao,
  });

  final EventHistoryDao eventHistoryDao;

  @override
  Future<void> saveOrUpdateEventHistories(List<EventHistory> eventHistories) => eventHistoryDao.saveOrUpdateEventHistories(
        eventHistories.map(EventHistoryMapper.toTable).toList(),
      );

  @override
  Future<void> deleteEventHistories(List<EventHistory> eventHistories) => eventHistoryDao.deleteEventHistories(
        eventHistories.map(EventHistoryMapper.toTable).toList(),
      );

  @override
  Future<List<EventHistory>> fetchEventHistories({required String calendarId}) => eventHistoryDao.fetchEventHistories(calendarId: calendarId).then(
        (value) => value.map(EventHistoryMapper.fromTable).toList(),
      );
}
