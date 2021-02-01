import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:package_info/package_info.dart';
import 'package:simple_calendar_app/gen/assets.gen.dart';

Future<void> showAppLicensePage({required BuildContext context}) async {
  final packageInfo = await PackageInfo.fromPlatform();

  /// LicensePageが、ロード中は背景色がscaffoldBackgroundColorなのに、ロード後cardColorになる
  /// 表示がおかしいのでここでは、Themeを上書きして背景色をscaffoldBackgroundColorに固定している
  await Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (context) => Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Theme.of(context).scaffoldBackgroundColor,
          cardColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: LicensePage(
          applicationName: packageInfo.appName,
          applicationVersion: packageInfo.version,
          applicationIcon: Padding(
            padding: const EdgeInsets.all(Dimens.padding16),
            child: Assets.image.icLauncherLicense.image(
              width: Dimens.viewSize96,
              height: Dimens.viewSize96,
            ),
          ),
        ),
      ),
    ),
  );
}
