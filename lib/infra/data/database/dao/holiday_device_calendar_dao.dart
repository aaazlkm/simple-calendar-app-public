import 'package:built_collection/built_collection.dart';
import 'package:nifu_flutter_kit/extensions/list_ex.dart';
import 'package:sembast/sembast.dart';
import 'package:simple_calendar_app/infra/data/database/app_database.dart';
import 'package:simple_calendar_app/infra/data/database/table/holiday_device_calendar_table.dart';

class HolidayDeviceCalendarDao {
  HolidayDeviceCalendarDao();

  Database get _database => AppDatabase.instance.database;

  final _holidayDeviceCalendarStore = stringMapStoreFactory.store(
    HolidayDeviceCalendarTable.tableName,
  );

  Future<void> saveOrUpdateCalendars(BuiltList<HolidayDeviceCalendarTable> tables) async {
    final chunkTables = tables.toList().chunk(size: 100);
    for (final tables in chunkTables) {
      await _database.transaction((txn) async {
        for (final table in tables) {
          await _holidayDeviceCalendarStore.record(table.id).put(txn, table.toMap());
        }
      });
    }
  }

  Future<void> clearAllHolidayDeviceCalendarTables() async {
    await _holidayDeviceCalendarStore.delete(_database);
  }

  Future<BuiltList<HolidayDeviceCalendarTable>> fetchAllHolidayDeviceCalendars() async =>
      _holidayDeviceCalendarStore.find(_database, finder: Finder()).then((value) => value.map((e) => HolidayDeviceCalendarTable.fromMap(e.value)).toBuiltList());
}
