import 'package:result/result.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/database_repository.dart';

class DatabaseUseCase {
  DatabaseUseCase({
    required this.databaseRepository,
  });

  final DatabaseRepository databaseRepository;

  Future<Result<Complete>> openDatabase() => databaseRepository.openDatabase().toComplete();
}
