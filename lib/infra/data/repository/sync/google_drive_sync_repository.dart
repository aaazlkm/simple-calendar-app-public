import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:simple_calendar_app/domain/sync/gateway/sync_repository.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file_id.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_media.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account.dart';
import 'package:simple_calendar_app/infra/data/api/client/google_drive_api_client.dart';
import 'package:simple_calendar_app/infra/data/api/mapper/google_drive_file_mapper.dart';
import 'package:simple_calendar_app/infra/data/api/mapper/google_drive_media_mapper.dart';
import 'package:simple_calendar_app/infra/data/api/mapper/google_sign_in_account_mapper.dart';

class GoogleDriveSyncRepository implements SyncRepository {
  GoogleDriveSyncRepository(this._googleDriveApiClient);

  final GoogleDriveApiClient _googleDriveApiClient;

  @override
  Future<SyncAccount?> get currentUser async {
    final currentUser = _googleDriveApiClient.currentUser;
    return currentUser != null ? GoogleSignInAccountMapper.fromData(currentUser) : null;
  }

  @override
  Future<SyncAccount?> signIn() async {
    final account = await _googleDriveApiClient.signIn();
    return account != null ? GoogleSignInAccountMapper.fromData(account) : null;
  }

  @override
  Future<SyncAccount?> signInSilently() async {
    final account = await _googleDriveApiClient.signInSilently();
    return account != null ? GoogleSignInAccountMapper.fromData(account) : null;
  }

  @override
  Future<SyncAccount?> signOut() async {
    final account = await _googleDriveApiClient.signOut();
    return account != null ? GoogleSignInAccountMapper.fromData(account) : null;
  }

  @override
  Future<BuiltList<BackupFile>> fetchAllBackupFiles({
    required Map<String, String> authHeaders,
  }) =>
      _googleDriveApiClient
          .fetchAllFiles(
            authHeaders: authHeaders,
          )
          .then(
            (value) => value.files?.map(GoogleDriveFileMapper.fromDataOrNull).whereType<BackupFile>().toBuiltList() ?? BuiltList.of([]),
          );

  @override
  Future<BackupFile?> uploadFile({
    required Map<String, String> authHeaders,
    required String fileName,
    required File uploadFile,
  }) async =>
      _googleDriveApiClient
          .uploadFile(
            authHeaders: authHeaders,
            fileName: fileName,
            uploadFile: uploadFile,
          )
          .then(GoogleDriveFileMapper.fromDataOrNull);

  @override
  Future<BackupMedia> downloadFile({
    required Map<String, String> authHeaders,
    required BackupFileId backupFileId,
  }) =>
      _googleDriveApiClient
          .downloadFile(
            authHeaders: authHeaders,
            fileId: backupFileId.value,
          )
          .then(GoogleDriveMediaMapper.fromData);

  @override
  Future<void> deleteBackupFile({
    required Map<String, String> authHeaders,
    required BackupFileId backupFileId,
  }) =>
      _googleDriveApiClient.deleteFile(
        authHeaders: authHeaders,
        fileId: backupFileId.value,
      );
}
