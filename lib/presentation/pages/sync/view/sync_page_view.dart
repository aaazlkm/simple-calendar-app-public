import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/presentation/pages/sync/sync_page.dart';
import 'package:simple_calendar_app/presentation/pages/sync/sync_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/sync/view/sync_page_body_view.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';
import 'package:simple_calendar_app/presentation/res/platfrom_icon.dart';

class SyncPageView extends StatelessWidget {
  const SyncPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => SyncController.of(context).onWillPop(),
        child: Stack(
          children: [
            Scaffold(
              appBar: buildAppBar(context),
              body: const SafeArea(child: SyncPageBodyView()),
            ),
            Positioned.fill(
              child: buildLoadingIndicator(context),
            )
          ],
        ),
      );

  AppBar buildAppBar(BuildContext context) => AppBar(
        elevation: 1,
        shadowColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text(
          AppLocalizations.string(context).syncPageTitle,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        leading: IconButton(
          icon: Icon(PlatformIcon.dismiss),
          onPressed: () => SyncController.of(context).onCloseButtonTap(),
        ),
      );

  StreamBuilder<bool> buildLoadingIndicator(BuildContext context) => StreamBuilder<bool>(
        stream: SyncViewModel.of(context).isLoading,
        initialData: SyncViewModel.of(context).isLoadingValue,
        builder: (context, snapshot) => AnimatedVisibility(
          visible: snapshot.requireData,
          duration: kThemeAnimationDuration,
          child: Material(
            color: Colors.black.withOpacity(0.6),
            child: Center(
              child: SizedBox.fromSize(
                size: const Size.square(Dimens.viewSize40),
                child: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 1.5,
                ),
              ),
            ),
          ),
        ),
      );
}
