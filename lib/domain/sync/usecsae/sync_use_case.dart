import 'package:built_collection/built_collection.dart';
import 'package:path/path.dart';
import 'package:result/result.dart';
import 'package:simple_calendar_app/domain/calendar/gateway/calendar_repository.dart';
import 'package:simple_calendar_app/domain/notification/usecase/notification_use_case.dart';
import 'package:simple_calendar_app/domain/sync/gateway/sync_file_gateway.dart';
import 'package:simple_calendar_app/domain/sync/gateway/sync_repository.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file_id.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account.dart';

class SyncUseCase {
  SyncUseCase(
    this._syncRepository,
    this._syncFileGateway,
    this._calendarRepository,
    this._notificationUseCase,
  );

  final SyncRepository _syncRepository;

  final SyncFileGateway _syncFileGateway;

  final CalendarRepository _calendarRepository;

  final NotificationUseCase _notificationUseCase;

  Future<Result<SyncAccount?>> signIn() => Future(() async {
        var user = await _syncRepository.currentUser;
        user ??= await _syncRepository.signInSilently();
        user ??= await _syncRepository.signIn();
        return user;
      }).toResult();

  Future<Result<SyncAccount?>> signInSilently() => Future(() async {
        var user = await _syncRepository.currentUser;
        return user ??= await _syncRepository.signInSilently();
      }).toResult();

  Future<Result<SyncAccount?>> signOut() => _syncRepository.signOut().toResult();

  Future<Result<BuiltList<BackupFile>>> fetchBackupFiles(SyncAccount syncAccount) => _syncRepository
      .fetchAllBackupFiles(
        authHeaders: syncAccount.authHeaders,
      )
      .toResult();

  Future<Result<Complete>> deleteBackupFile(SyncAccount syncAccount, BackupFileId backupFileId) => _syncRepository
      .deleteBackupFile(
        authHeaders: syncAccount.authHeaders,
        backupFileId: backupFileId,
      )
      .toComplete();

  Future<Result<Complete>> backupFile(SyncAccount syncAccount) => Future(
        () async {
          await _calendarRepository.closeDataSource();
          final compressedBackupFile = await _syncFileGateway.createCompressedBackupFile();
          await _syncRepository.uploadFile(
            authHeaders: syncAccount.authHeaders,
            fileName: basename(compressedBackupFile.path),
            uploadFile: compressedBackupFile,
          );
        },
      ).whenComplete(_calendarRepository.openDataSource).toComplete();

  Future<Result<Complete>> restoreFile(SyncAccount syncAccount, BackupFile backupFile) => Future(
        () async {
          final backupMedia = await _syncRepository.downloadFile(
            authHeaders: syncAccount.authHeaders,
            backupFileId: backupFile.id,
          );
          await _syncFileGateway.restoreBackupFile(backupFile, backupMedia);
          await _calendarRepository.reloadDataSource();
          await _notificationUseCase.scheduleDailyRemindInWeekIfEnabled();
        },
      ).toComplete();
}
