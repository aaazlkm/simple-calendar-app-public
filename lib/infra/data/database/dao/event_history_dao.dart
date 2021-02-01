import 'package:nifu_flutter_kit/extensions/list_ex.dart';
import 'package:sembast/sembast.dart';
import 'package:simple_calendar_app/infra/data/database/app_database.dart';
import 'package:simple_calendar_app/infra/data/database/table/event_history_table.dart';

class EventHistoryDao {
  EventHistoryDao();

  Database get _database => AppDatabase.instance.database;

  final _eventHistoryStore = stringMapStoreFactory.store(
    EventHistoryTable.tableName,
  );

  Future<void> saveOrUpdateEventHistories(List<EventHistoryTable> tables) async {
    final chunkTables = tables.chunk(size: 100);
    for (final tables in chunkTables) {
      await _database.transaction((txn) async {
        for (final table in tables) {
          await _eventHistoryStore.record(table.id).put(txn, table.toMap());
        }
      });
    }
  }

  Future<void> deleteEventHistories(List<EventHistoryTable> tables) async {
    final chunkIds = tables.map((e) => e.id).toList().chunk(size: 100);
    for (final ids in chunkIds) {
      await _database.transaction((txn) async {
        for (final id in ids) {
          final finder = Finder(filter: Filter.byKey(id));
          await _eventHistoryStore.delete(txn, finder: finder);
        }
      });
    }
  }

  Future<List<EventHistoryTable>> fetchEventHistories({required String calendarId}) async {
    final tableSnapshots = await _eventHistoryStore.find(
      _database,
      finder: Finder(filter: Filter.equals(EventHistoryTable.columnNameCalendarId, calendarId)),
    );
    return tableSnapshots
        .map(
          (snapshot) => EventHistoryTable.fromMap(snapshot.value),
        )
        .toList();
  }
}
