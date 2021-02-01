import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/widget/dialogs/dialogs.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

Future<void> showOkCancelAlertDialog({
  required BuildContext context,
  required String title,
  String? okText,
  String? cancelText,
  String? message,
  VoidCallback? onOkPressed,
  VoidCallback? onCancelPressed,
  TransitionBuilder? builder,
}) =>
    showAlertDialog(
      context: context,
      title: title,
      message: message,
      actions: [
        DialogAction.cancel(title: cancelText ?? AppLocalizations.string(context).alertDialogCancel, onPressed: onCancelPressed),
        DialogAction.ok(title: okText ?? AppLocalizations.string(context).alertDialogOk, onPressed: onOkPressed),
      ],
    );

Future<void> showDeleteCancelAlertDialog({
  required BuildContext context,
  required String title,
  String? deleteText,
  String? cancelText,
  String? message,
  VoidCallback? onDeletePressed,
  VoidCallback? onCancelPressed,
  TransitionBuilder? builder,
}) =>
    showAlertDialog(
      context: context,
      title: title,
      message: message,
      actions: [
        DialogAction.cancel(title: cancelText ?? AppLocalizations.string(context).alertDialogDeleteCancel, onPressed: onCancelPressed),
        DialogAction.delete(title: deleteText ?? AppLocalizations.string(context).alertDialogDelete, onPressed: onDeletePressed),
      ],
    );
