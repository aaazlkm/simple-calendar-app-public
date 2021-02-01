import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({
  required String message,
  ToastGravity gravity = ToastGravity.CENTER,
  Toast toastLength = Toast.LENGTH_SHORT,
}) {
  Fluttertoast.showToast(
    msg: message,
    gravity: gravity,
    toastLength: toastLength,
  );
}
