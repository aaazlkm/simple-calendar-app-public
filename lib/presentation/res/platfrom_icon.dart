import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';

class PlatformIcon {
  static IconData get dismiss => Platform.isIOS ? FluentIcons.chevron_left_20_regular : FluentIcons.dismiss_20_regular;
}
