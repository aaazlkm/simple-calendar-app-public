import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/pages/sync/model/sync_account_state.dart';
import 'package:simple_calendar_app/presentation/pages/sync/sync_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/sync/view/backup_list_view.dart';
import 'package:simple_calendar_app/presentation/pages/sync/view/sync_account_view.dart';

class SyncPageBodyView extends StatelessWidget {
  const SyncPageBodyView({Key? key}) : super(key: key);

  static double get horizontalPadding => Dimens.padding40;

  @override
  Widget build(BuildContext context) => StreamBuilder<SyncAccountState>(
        stream: SyncViewModel.of(context).userState,
        initialData: SyncViewModel.of(context).userStateValue,
        builder: (context, snapshot) => Column(
          children: [
            SyncAccountView(syncAccountState: snapshot.requireData),
            const Divider(height: 1),
            Expanded(
              child: AnimatedVisibility(
                visible: snapshot.requireData.isSignIn,
                duration: kThemeAnimationDuration,
                child: const BackupListView(),
              ),
            ),
          ],
        ),
      );
}
