import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/navigator/app_navigator.dart';
import 'package:simple_calendar_app/presentation/pages/sync/sync_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/sync/view/sync_page_view.dart';
import 'package:simple_calendar_app/presentation/port/dialog/alert_dialog.dart';
import 'package:simple_calendar_app/presentation/port/toast.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class SyncPage extends StatefulWidget {
  const SyncPage({Key? key}) : super(key: key);

  @override
  _SyncPageState createState() => _SyncPageState();
}

class _SyncPageState extends State<SyncPage> with SyncController {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<SyncController>.value(value: this),
          Provider<SyncViewModel>.value(value: _viewModel),
        ],
        child: const SyncPageView(),
      );
}

mixin SyncController on State<SyncPage> {
  static SyncController of(BuildContext context) => context.read<SyncController>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  late final SyncViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<SyncViewModel>()..setup();
    _bindViewModelEvent();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _compositeSubscription.clear();
    super.dispose();
  }

  void _bindViewModelEvent() {
    _viewModel.signInFailure.listen((event) {
      showToast(message: AppLocalizations.string(context).syncFailedToSignIn);
    }).addTo(_compositeSubscription);

    _viewModel.fetchBackupFileResult.listen((result) {
      result.maybeWhen(
        failure: (e) {
          showToast(message: AppLocalizations.string(context).syncFailedToFetchBackupFile);
          logger.severe(e);
        },
        orElse: () {},
      );
    }).addTo(_compositeSubscription);

    _viewModel.backupFileResult.listen((result) {
      result?.maybeWhen(
        success: (_) => showToast(message: AppLocalizations.string(context).syncSuccessToBackup),
        failure: (e) {
          showToast(message: AppLocalizations.string(context).syncFailedToBackup);
          logger.severe(e);
        },
        orElse: () {},
      );
    }).addTo(_compositeSubscription);

    _viewModel.restoreFileResult.listen((result) {
      result?.maybeWhen(
        success: (_) => showToast(message: AppLocalizations.string(context).syncSuccessToRestore),
        failure: (e) {
          showToast(message: AppLocalizations.string(context).syncFailedToRestore);
          logger.severe(e);
        },
        orElse: () {},
      );
    }).addTo(_compositeSubscription);

    _viewModel.deleteBackupFileFailure.listen((result) {
      showToast(message: AppLocalizations.string(context).syncFailedToDeleteBackup);
      logger.severe(result);
    }).addTo(_compositeSubscription);
  }

  bool onWillPop() => !_viewModel.isLoadingValue;

  void onCloseButtonTap() {
    AppNavigator.of(context).popSyncPage(context);
  }

  void onSignInButtonTap() {
    _viewModel.sigIn();
  }

  void onSignOutButtonTap(SyncAccount syncAccount) {
    showOkCancelAlertDialog(
      context: context,
      title: AppLocalizations.string(context).syncSignOutConfirmationDialogTitle,
      message: syncAccount.displayName,
      onOkPressed: _viewModel.signOut,
    );
  }

  void onRetryButtonTap() {
    _viewModel.fetchBackupFilesIfSignIn();
  }

  void onBackupButtonTap() {
    HapticFeedback.lightImpact();
    showOkCancelAlertDialog(
      context: context,
      title: AppLocalizations.string(context).syncCreateBackupConfirmationDialogTitle,
      onOkPressed: _viewModel.backupFileIfSignIn,
    );
  }

  void onRestoreButtonTap(BackupFile backupFile) {
    HapticFeedback.lightImpact();
    showOkCancelAlertDialog(
      context: context,
      title: AppLocalizations.string(context).syncRestoreConfirmationDialogTitle,
      message: DateFormat.yMMMd().add_Hm().format(backupFile.modifiedTime),
      onOkPressed: () => _viewModel.restoreFileIfSignIn(backupFile),
    );
  }

  void onBackupDeleteButtonTap(BackupFile backupFile) {
    HapticFeedback.lightImpact();
    showOkCancelAlertDialog(
      context: context,
      title: AppLocalizations.string(context).syncDeleteConfirmationDialogTitle,
      message: DateFormat.yMMMd().add_Hm().format(backupFile.modifiedTime),
      onOkPressed: () => _viewModel.deleteBackupIfSignIn(backupFile),
    );
  }
}
