import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/gen/assets.gen.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class BackupListEmptyView extends StatelessWidget {
  const BackupListEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        alignment: const Alignment(0, -0.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Container(
                padding: const EdgeInsets.all(Dimens.padding16),
                color: Color.alphaBlend(Theme.of(context).colorScheme.surface.withOpacity(0.15), Colors.white),
                child: Assets.image.catBothering.image(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
            ),
            const SizedBox(height: Dimens.padding24),
            Text(
              AppLocalizations.string(context).syncBackupListEmptyTitle,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: Dimens.padding4),
            Text(
              AppLocalizations.string(context).syncBackupListEmptySubTitle,
              style: Theme.of(context).textTheme.caption?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                  ),
            ),
            const SizedBox(height: Dimens.padding96),
          ],
        ),
      );
}
