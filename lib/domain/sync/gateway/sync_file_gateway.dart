import 'dart:io';

import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_media.dart';

abstract class SyncFileGateway {
  Future<File> createCompressedBackupFile();

  Future<void> restoreBackupFile(BackupFile backupFile, BackupMedia backupMedia);
}
