import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:result/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account.dart';
import 'package:simple_calendar_app/domain/sync/usecsae/sync_use_case.dart';
import 'package:simple_calendar_app/presentation/pages/sync/model/sync_account_state.dart';

class SyncViewModel with _BaseFeature, _AuthFeature, _SyncFeature, _ViewFeature {
  SyncViewModel(this._syncUseCase);

  static SyncViewModel of(BuildContext context) => context.read<SyncViewModel>();

  final SyncUseCase _syncUseCase;

  @override
  SyncUseCase get syncUseCase => _syncUseCase;

  void dispose() {
    _disposeBase();
    _disposeAuth();
    _disposeSync();
  }

  void setup() {
    _signInSilently();
    _setupAutoFetchingBackupFilesWhenSignIn();
  }
}

mixin _BaseFeature {
  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  void _disposeBase() {
    _compositeSubscription.clear();
  }
}

mixin _AuthFeature {
  SyncUseCase get syncUseCase;

  final PublishSubject<ResultFailure<Complete>> _signInFailure = PublishSubject();

  Stream<Result<Complete>> get signInFailure => _signInFailure.stream;

  final BehaviorSubject<SyncAccountState> _userState = BehaviorSubject.seeded(const SyncAccountState.signOut());

  Stream<SyncAccountState> get userState => _userState.stream.distinct();

  SyncAccountState get userStateValue => _userState.value;

  void _disposeAuth() {
    _signInFailure.close();
    _userState.close();
  }

  Future<void> sigIn() async {
    final result = await syncUseCase.signIn();
    result.when(
      success: (syncAccount) {
        if (syncAccount != null) {
          _userState.add(SyncAccountState.signIn(syncAccount));
        } else {
          _userState.add(const SyncAccountState.signOut());
        }
      },
      failure: (e) {
        logger.severe(e);
        _signInFailure.add(ResultFailure(e));
        _userState.add(const SyncAccountState.signOut());
      },
    );
  }

  Future<void> _signInSilently() async {
    final result = await syncUseCase.signInSilently();
    result.when(
      success: (syncAccount) {
        if (syncAccount != null) {
          _userState.add(SyncAccountState.signIn(syncAccount));
        } else {
          _userState.add(const SyncAccountState.signOut());
        }
      },
      failure: (e) {
        logger.severe(e);
        _userState.add(const SyncAccountState.signOut());
      },
    );
  }

  Future<void> signOut() async {
    final result = await syncUseCase.signOut();
    _userState.add(const SyncAccountState.signOut());
    result.ifFailure(logger.severe);
  }
}

mixin _SyncFeature on _BaseFeature, _AuthFeature {
  final BehaviorSubject<LoadResult<Complete>?> _backupFileResult = BehaviorSubject();

  Stream<LoadResult<Complete>?> get backupFileResult => _backupFileResult.stream;

  final BehaviorSubject<LoadResult<Complete>?> _restoreFileResult = BehaviorSubject();

  Stream<LoadResult<Complete>?> get restoreFileResult => _restoreFileResult.stream;

  final PublishSubject<ResultFailure<Complete>> _deleteBackupFileFailure = PublishSubject();

  Stream<ResultFailure<Complete>> get deleteBackupFileFailure => _deleteBackupFileFailure.stream;

  final BehaviorSubject<LoadResult<BuiltList<BackupFile>>> _fetchBackupFileResult = BehaviorSubject.seeded(const LoadResult.loading());

  Stream<LoadResult<BuiltList<BackupFile>>> get fetchBackupFileResult => _fetchBackupFileResult.stream.distinct().pairwise().map((prevToNew) {
        final prevResult = prevToNew.toList()[0];
        final newResult = prevToNew.toList()[1];
        if (newResult.isLoading && prevResult.isSuccess) {
          // 前回の値が成功してる場合はローディングを流さないようにする
          return prevResult;
        }
        return newResult;
      });

  LoadResult<BuiltList<BackupFile>> get fetchBackupFileResultValue => _fetchBackupFileResult.value;

  void _disposeSync() {
    _compositeSubscription.clear();
    _backupFileResult.close();
    _restoreFileResult.close();
    _deleteBackupFileFailure.close();
    _fetchBackupFileResult.close();
  }

  void fetchBackupFilesIfSignIn() {
    final syncAccount = userStateValue.syncAccountOrNull;
    if (syncAccount == null) {
      return;
    }
    _fetchBackupFiles(syncAccount);
  }

  Future<void> backupFileIfSignIn() async {
    final syncAccount = userStateValue.syncAccountOrNull;
    if (syncAccount == null) {
      return;
    }

    syncUseCase.backupFile(syncAccount).withLoad().listen((loadResult) {
      _backupFileResult.add(loadResult);
      loadResult.ifSuccess((_) => _fetchBackupFiles(syncAccount));
    }).addTo(_compositeSubscription);
  }

  Future<void> restoreFileIfSignIn(BackupFile backupFile) async {
    final syncAccount = userStateValue.syncAccountOrNull;
    if (syncAccount == null) {
      return;
    }

    syncUseCase
        .restoreFile(syncAccount, backupFile)
        .withLoad()
        .listen(
          _restoreFileResult.add,
        )
        .addTo(_compositeSubscription);
  }

  Future<void> deleteBackupIfSignIn(BackupFile backupFile) async {
    final syncAccount = userStateValue.syncAccountOrNull;
    if (syncAccount == null) {
      return;
    }

    final nowBackupFiles = fetchBackupFileResultValue.dataOrNull;
    if (nowBackupFiles == null) {
      return;
    }

    final newBackupFiles = nowBackupFiles.where((e) => e.id != backupFile.id).toBuiltList();
    _fetchBackupFileResult.add(LoadResult.success(newBackupFiles));

    final result = await syncUseCase.deleteBackupFile(syncAccount, backupFile.id);
    result.ifFailure((resultFailure) {
      _deleteBackupFileFailure.add(resultFailure);
      _fetchBackupFileResult.add(LoadResult.success(nowBackupFiles));
    });
  }

  void _setupAutoFetchingBackupFilesWhenSignIn() {
    _userState.listen((userState) {
      userState.maybeWhen(
        signIn: _fetchBackupFiles,
        orElse: () {},
      );
    }).addTo(_compositeSubscription);
  }

  Future<void> _fetchBackupFiles(SyncAccount syncAccount) async {
    syncUseCase
        .fetchBackupFiles(syncAccount)
        .withLoad()
        .listen(
          _fetchBackupFileResult.add,
        )
        .addTo(_compositeSubscription);
  }
}

mixin _ViewFeature on _SyncFeature {
  Stream<bool> get backupButtonVisible => Rx.combineLatest<bool, bool>(
        [
          userState.map((event) => event.isSignIn),
          _fetchBackupFileResult.map((event) => event.isSuccess),
        ],
        (list) => list[0] && list[1],
      );

  bool get backupButtonVisibleValue => userStateValue.isSignIn;

  Stream<bool> get isLoading => Rx.merge([
        _backupFileResult.map((event) => event?.isLoading ?? false),
        _restoreFileResult.map((event) => event?.isLoading ?? false),
      ]);

  bool get isLoadingValue => (_backupFileResult.valueOrNull?.isLoading ?? false) || (_restoreFileResult.valueOrNull?.isLoading ?? false);
}
