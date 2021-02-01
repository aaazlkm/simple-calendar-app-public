import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/pages/sync/model/sync_account_state.dart';
import 'package:simple_calendar_app/presentation/pages/sync/sync_page.dart';
import 'package:simple_calendar_app/presentation/pages/sync/view/sync_page_body_view.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class SyncAccountView extends StatelessWidget {
  const SyncAccountView({
    required this.syncAccountState,
    Key? key,
  }) : super(key: key);

  final SyncAccountState syncAccountState;

  @override
  Widget build(BuildContext context) => syncAccountState.map(
        signIn: (signIn) => _buildWhenSignIn(signIn, context),
        signOut: (signOut) => _buildWhenSignOut(context),
      );

  Padding _buildWhenSignIn(SyncAccountStateSignIn signIn, BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.padding32),
        child: Center(
          child: Row(
            children: [
              SizedBox(width: SyncPageBodyView.horizontalPadding),
              ClipRRect(
                borderRadius: BorderRadius.circular(300),
                child: Image.network(
                  signIn.syncAccount.photoUrl ?? '',
                  width: Dimens.viewSize56,
                  height: Dimens.viewSize56,
                ),
              ),
              const SizedBox(width: Dimens.padding16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      signIn.syncAccount.displayName ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: Dimens.fontSize14,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
                          ),
                    ),
                    const SizedBox(height: Dimens.padding2),
                    Text(
                      signIn.syncAccount.email,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: Dimens.fontSize14,
                            color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: Dimens.padding16),
              InkResponse(
                onTap: () => SyncController.of(context).onSignOutButtonTap(signIn.syncAccount),
                child: Text(
                  AppLocalizations.string(context).syncAccountLogout,
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Theme.of(context).colorScheme.error.withOpacity(Dimens.emphasisMedium),
                      ),
                ),
              ),
              SizedBox(width: SyncPageBodyView.horizontalPadding),
            ],
          ),
        ),
      );

  InkWell _buildWhenSignOut(BuildContext context) => InkWell(
        onTap: () => SyncController.of(context).onSignInButtonTap(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimens.padding32),
          child: Center(
            child: Row(
              children: [
                SizedBox(width: SyncPageBodyView.horizontalPadding),
                ClipRRect(
                  borderRadius: BorderRadius.circular(300),
                  child: Material(
                    color: Theme.of(context).colorScheme.surface,
                    child: SizedBox.fromSize(
                      size: const Size.square(Dimens.viewSize56),
                      child: Center(
                        child: Text(
                          'G',
                          style: GoogleFonts.poppins(
                            fontSize: Dimens.viewSize24,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisHigh),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: SyncPageBodyView.horizontalPadding / Dimens.goldenRatio),
                Expanded(
                  child: Text(
                    AppLocalizations.string(context).syncAccountLoginToMakeBackup,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisHigh),
                        ),
                  ),
                ),
                SizedBox(width: SyncPageBodyView.horizontalPadding),
              ],
            ),
          ),
        ),
      );
}
