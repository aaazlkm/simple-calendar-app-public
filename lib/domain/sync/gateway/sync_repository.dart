import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file_id.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_media.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account.dart';

abstract class SyncRepository {
  Future<SyncAccount?> get currentUser;

  Future<SyncAccount?> signIn();

  Future<SyncAccount?> signInSilently();

  Future<SyncAccount?> signOut();

  Future<BuiltList<BackupFile>> fetchAllBackupFiles({
    required Map<String, String> authHeaders,
  });

  Future<BackupFile?> uploadFile({
    required Map<String, String> authHeaders,
    required String fileName,
    required File uploadFile,
  });

  Future<BackupMedia> downloadFile({
    required Map<String, String> authHeaders,
    required BackupFileId backupFileId,
  });

  Future<void> deleteBackupFile({
    required Map<String, String> authHeaders,
    required BackupFileId backupFileId,
  });
}
