import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simple_calendar_app/presentation/port/dialog/alert_dialog.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

Future<void> requestPermissionOfDeviceSetting(BuildContext context) async {
  await showOkCancelAlertDialog(
    context: context,
    title: AppLocalizations.string(context).deviceSettingDialog.title,
    okText: AppLocalizations.string(context).deviceSettingDialog.setting,
    cancelText: AppLocalizations.string(context).deviceSettingDialog.cancel,
    onOkPressed: openAppSettings,
  );
}
