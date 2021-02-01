import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_app_kit/simple_app_kit.dart';
import 'package:simple_calendar_app/presentation/navigator/app_navigator.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: ScrollBehaviorForRemoveOverflowColor(),
        child: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const SizedBox(height: Dimens.padding52),
                      _buildDivider(context),
                      _buildSettingItem(context),
                      _buildDivider(context),
                    ],
                  ),
                ),
                SimpleAppIntroductionInDrawer(
                  locale: Localizations.localeOf(context),
                  introductionTextDelegate: AppLocalizations.string(context).introductionTextDelegate,
                  excludeApps: const [SimpleAppType.calendar],
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildDivider(BuildContext context) => Divider(
        height: Dimens.viewSize24,
        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
      );

  Widget _buildSettingItem(BuildContext context) => ListTile(
        title: Text(AppLocalizations.string(context).drawerItemSetting),
        leading: Icon(
          FluentIcons.settings_20_regular,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        onTap: () async {
          await AppNavigator.of(context).pushSettingPage(context);
        },
      );
}
