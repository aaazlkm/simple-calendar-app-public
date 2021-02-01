import 'package:nifu_flutter_kit/extensions/list_ex.dart';
import 'package:sembast/sembast.dart';
import 'package:simple_calendar_app/infra/data/database/app_database.dart';
import 'package:simple_calendar_app/infra/data/database/table/calendar_table.dart';
import 'package:simple_calendar_app/infra/data/database/table/event_table.dart';

class CalendarDao {
  CalendarDao();

  Database get _database => AppDatabase.instance.database;

  final _calendarStore = stringMapStoreFactory.store(
    CalendarTable.tableName,
  );

  final _eventStore = stringMapStoreFactory.store(
    EventTable.tableName,
  );

  Future<void> saveOrUpdateCalendars(List<CalendarTable> tables) async {
    final chunkTables = tables.chunk(size: 100);
    for (final tables in chunkTables) {
      await _database.transaction((txn) async {
        for (final table in tables) {
          await _calendarStore.record(table.id).put(txn, table.toMap());
        }
      });
    }
  }

  Future<void> deleteCalendars(List<CalendarTable> tables) async {
    final chunkIds = tables.map((e) => e.id).toList().chunk(size: 100);
    for (final ids in chunkIds) {
      await _database.transaction((txn) async {
        for (final id in ids) {
          final finder = Finder(filter: Filter.byKey(id));
          await _calendarStore.delete(txn, finder: finder);
        }
      });
    }
  }

  Future<List<CalendarTable>> fetchAllCalendars() async {
    final tableSnapshots = await _calendarStore.find(
      _database,
      finder: Finder(),
    );
    return tableSnapshots
        .map(
          (snapshot) => CalendarTable.fromMap(snapshot.value),
        )
        .toList();
  }

  Future<void> saveOrUpdateEvents(List<EventTable> tables) async {
    final chunkTables = tables.chunk(size: 100);
    for (final tables in chunkTables) {
      await _database.transaction((txn) async {
        for (final table in tables) {
          await _eventStore.record(table.id).put(txn, table.toMap());
        }
      });
    }
  }

  Future<void> deleteEvents(List<EventTable> tables) async {
    final chunkIds = tables.map((e) => e.id).toList().chunk(size: 100);
    for (final ids in chunkIds) {
      await _database.transaction((txn) async {
        for (final id in ids) {
          final finder = Finder(filter: Filter.byKey(id));
          await _eventStore.delete(txn, finder: finder);
        }
      });
    }
  }

  Future<List<EventTable>> fetchAllEvents() async {
    final tableSnapshots = await _eventStore.find(
      _database,
      finder: Finder(),
    );
    return tableSnapshots
        .map(
          (snapshot) => EventTable.fromMap(snapshot.value),
        )
        .toList();
  }

  Future<List<EventTable>> fetchCalendarEvents({required String calendarId}) async {
    final tableSnapshots = await _eventStore.find(
      _database,
      finder: Finder(filter: Filter.equals(EventTable.columnNameCalendarId, calendarId)),
    );
    return tableSnapshots
        .map(
          (snapshot) => EventTable.fromMap(snapshot.value),
        )
        .toList();
  }
}
