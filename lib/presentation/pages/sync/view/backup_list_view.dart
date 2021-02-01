import 'package:built_collection/built_collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';
import 'package:intl/intl.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:result/result.dart';
import 'package:simple_calendar_app/domain/sync/model/backup_file.dart';
import 'package:simple_calendar_app/presentation/pages/sync/sync_page.dart';
import 'package:simple_calendar_app/presentation/pages/sync/sync_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/sync/view/backup_list_empty_view.dart';
import 'package:simple_calendar_app/presentation/pages/sync/view/sync_page_body_view.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class BackupListView extends StatelessWidget {
  const BackupListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          StreamBuilder<LoadResult<BuiltList<BackupFile>>>(
            stream: SyncViewModel.of(context).fetchBackupFileResult,
            initialData: SyncViewModel.of(context).fetchBackupFileResultValue,
            builder: (context, snapshot) => snapshot.requireData.map(
              loading: (_) => Align(
                alignment: const Alignment(0, -0.7),
                child: _buildWhenLoading(context),
              ),
              success: (backupFiles) => _buildWhenSuccess(context, backupFiles),
              failure: (_) => Align(
                alignment: const Alignment(0, -0.3),
                child: _buildWhenFailure(context),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: _buildBackupButton(context),
            ),
          )
        ],
      );

  SizedBox _buildWhenLoading(BuildContext context) => SizedBox.fromSize(
        size: const Size.square(Dimens.viewSize28),
        child: CircularProgressIndicator(
          strokeWidth: 1.5,
          valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.onBackground),
        ),
      );

  Stack _buildWhenSuccess(BuildContext context, LoadResultSuccess<BuiltList<BackupFile>> success) => Stack(
        children: [
          AnimatedVisibility(
            visible: success.value.isEmpty,
            duration: kThemeAnimationDuration,
            child: const BackupListEmptyView(),
          ),
          AnimatedVisibility(
            visible: success.value.isNotEmpty,
            duration: kThemeAnimationDuration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimens.padding20),
                _buildBackupDataCaption(context),
                const SizedBox(height: Dimens.padding4),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollBehaviorForRemoveOverflowColor(),
                    child: ImplicitlyAnimatedList<BackupFile>(
                      items: success.value.toList(),
                      areItemsTheSame: (a, b) => a.id == b.id,
                      insertDuration: kThemeAnimationDuration,
                      updateDuration: kThemeAnimationDuration,
                      removeDuration: kThemeAnimationDuration,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, animation, item, index) => SizeFadeTransition(
                        sizeFraction: 0.7,
                        curve: Curves.easeInOut,
                        animation: animation,
                        child: _BackupFileItem(backupFile: item),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Column _buildWhenFailure(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppLocalizations.string(context).syncBackupListFailedToFetchMessage,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
                ),
          ),
          const SizedBox(height: Dimens.padding16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
            ),
            onPressed: () => SyncController.of(context).onRetryButtonTap(),
            child: Text(AppLocalizations.string(context).syncBackupListRetryFetch),
          ),
        ],
      );

  Padding _buildBackupDataCaption(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: SyncPageBodyView.horizontalPadding),
        child: Text(
          AppLocalizations.string(context).syncBackupListCaption,
          style: Theme.of(context).textTheme.caption?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );

  StreamBuilder<bool> _buildBackupButton(BuildContext context) => StreamBuilder<bool>(
        stream: SyncViewModel.of(context).backupButtonVisible,
        initialData: SyncViewModel.of(context).backupButtonVisibleValue,
        builder: (context, snapshot) => AnimatedVisibility(
          visible: snapshot.requireData,
          duration: kThemeAnimationDuration,
          child: Padding(
            padding: EdgeInsets.all(SyncPageBodyView.horizontalPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(horizontal: Dimens.padding40, vertical: Dimens.padding12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.radius16)),
                  ),
                  onPressed: () => SyncController.of(context).onBackupButtonTap(),
                  icon: Icon(
                    FluentIcons.cloud_backup_24_regular,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  label: Text(
                    AppLocalizations.string(context).syncBackupListCreateBackup,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary.withOpacity(Dimens.emphasisHigh),
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _BackupFileItem extends StatelessWidget {
  const _BackupFileItem({
    required this.backupFile,
    Key? key,
  }) : super(key: key);

  final BackupFile backupFile;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => SyncController.of(context).onRestoreButtonTap(backupFile),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SyncPageBodyView.horizontalPadding, vertical: Dimens.padding12),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  DateFormat.yMMMd().add_Hm().format(backupFile.modifiedTime),
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisMedium),
                      ),
                ),
              ),
              InkResponse(
                onTap: () => SyncController.of(context).onBackupDeleteButtonTap(backupFile),
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.viewSize1),
                  child: Icon(
                    FluentIcons.delete_20_regular,
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                    size: Dimens.viewSize20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
