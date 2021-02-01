import 'dart:io';

import 'package:simple_calendar_app/domain/sync/gateway/sync_file_gateway.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_media.dart';
import 'package:simple_calendar_app/infra/data/file/storage/sync_file_storage.dart';

class SyncFileGatewayImpl extends SyncFileGateway {
  SyncFileGatewayImpl(this._syncFileStorage);

  final SyncFileStorage _syncFileStorage;

  @override
  Future<File> createCompressedBackupFile() => _syncFileStorage.createCompressedDataFile();

  @override
  Future<void> restoreBackupFile(BackupFile backupFile, BackupMedia backupMedia) => _syncFileStorage.restoreBackup(backupFile, backupMedia);
}
