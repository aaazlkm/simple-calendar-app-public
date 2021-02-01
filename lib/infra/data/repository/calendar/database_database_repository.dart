import 'package:simple_calendar_app/domain/calendar/gateway/database_repository.dart';
import 'package:simple_calendar_app/infra/data/database/app_database.dart';

class DatabaseDatabaseRepository extends DatabaseRepository {
  @override
  Future openDatabase() async {
    await AppDatabase.instance.openDatabase();
  }
}
