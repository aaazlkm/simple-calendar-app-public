import 'dart:io';

import 'package:path/path.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/exception/sync_exception.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_media.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';
import 'package:simple_calendar_app/infra/data/database/app_database.dart';
import 'package:simple_calendar_app/infra/data/file/archive/zip.dart';

class SyncFileStorage {
  Future<File> createCompressedDataFile() async {
    final dataDirectory = await _createBackupDirectory();
    final backupFilePath = await _createBackupFilePath();
    final zippedFile = await zipDirectory(dataDirectory, toFilePath: backupFilePath);
    return zippedFile;
  }

  /// databseを含んだdirectoryを作成する
  Future<Directory> _createBackupDirectory() async {
    final dataDirectory = await Directory.systemTemp.createTemp();
    final databaseFile = await AppDatabase.databaseFile;
    await databaseFile.copy(join(dataDirectory.path, AppDatabase.databaseFileName));
    await _logDirectoryFiles(dataDirectory);
    return dataDirectory;
  }

  Future<String> _createBackupFilePath() async {
    final tempDirectory = await Directory.systemTemp.createTemp();
    final backupFileName = 'simple-calendar_${DateTime.now().toIso8601String()}.zip';
    return join(tempDirectory.path, backupFileName);
  }

  Future<void> restoreBackup(BackupFile backupFile, BackupMedia backupMedia) async {
    final file = await _saveBackupFileInTemp(backupFile, backupMedia);
    final unzippedData = await unzipFile(file);
    final databaseFile = File(join(unzippedData.path, AppDatabase.databaseFileName));
    if (!databaseFile.existsSync()) {
      throw NotExistsDatabaseFileException();
    }

    await _replaceByBackupData(databaseFile);
  }

  Future<File> _saveBackupFileInTemp(BackupFile backupFile, BackupMedia backupMedia) async {
    final tempDirectory = await Directory.systemTemp.createTemp();
    final file = File(join(tempDirectory.path, backupFile.name));
    final sink = file.openWrite(mode: FileMode.append);
    await backupMedia.stream.listen(sink.add).asFuture<void>();
    await sink.flush();
    await sink.close();
    return file;
  }

  Future<void> _replaceByBackupData(File newDatabaseFile) async {
    final tempDirectory = await Directory.systemTemp.createTemp();
    final nowDatabaseFile = await AppDatabase.databaseFile;
    // 復元失敗した時temp dirに取っておく
    final tempDatabaseFile = await nowDatabaseFile.copy(join(tempDirectory.path, basename(nowDatabaseFile.path)));

    try {
      await newDatabaseFile.rename(nowDatabaseFile.path);
    } on Exception catch (_) {
      // backup data renameに失敗したら復元する
      await nowDatabaseFile.delete(recursive: true);
      await tempDatabaseFile.rename(nowDatabaseFile.path);
      rethrow;
    }
  }

  /// for debug
  Future<void> _logDirectoryFiles(Directory directory) async {
    if (!directory.existsSync()) {
      return;
    }
    final list = directory.listSync();
    for (final a in list) {
      if (a is Directory) {}
      logger.info('file: ${basename(a.path)}');
    }
  }
}
