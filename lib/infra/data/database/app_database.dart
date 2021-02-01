import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  AppDatabase._();

  static final _instance = AppDatabase._();

  static AppDatabase get instance => _instance;

  static const databaseFileName = 'app_database.db';

  static const databaseVersion = 1;

  static Future<File> get databaseFile async => databaseFilePath.then((value) => File(value));

  static Future<String> get databaseFilePath async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    return join(appDocumentDir.path, databaseFileName);
  }

  late Database _database;

  Database get database => _database;

  /// アプリ起動時に必ず呼ぶこと
  Future openDatabase({FutureOr Function(Database)? onPreloadData}) async {
    final databaseFilePath = await AppDatabase.databaseFilePath;
    final database = await databaseFactoryIo.openDatabase(
      databaseFilePath,
      version: databaseVersion,
      onVersionChanged: (db, oldVersion, newVersion) async {
        if (oldVersion == 0) {
          await onPreloadData?.call(db);
        }
      },
    );
    _database = database;
  }

  Future<void> closeDatabase() async {
    await _database.close();
  }

  Future<void> reloadDatabase() async {
    await closeDatabase();
    await openDatabase();
  }
}
