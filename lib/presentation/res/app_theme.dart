import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_calendar_app/domain/setting/model/theme_type.dart';
import 'package:simple_calendar_app/presentation/res/app_color.dart';

class AppTheme {
  static ThemeData getTheme(ThemeType themeType) {
    final appColor = getAppColor(themeType);
    final textTheme = getTextTheme(themeType);
    return ThemeData(
      colorScheme: appColor.colorScheme,
      textTheme: textTheme,
      primaryColor: appColor.colorScheme.primary,
      accentColor: appColor.colorScheme.secondary,
      scaffoldBackgroundColor: appColor.colorScheme.background,
      canvasColor: appColor.colorScheme.surface,
      splashFactory: InkRipple.splashFactory,
      cursorColor: appColor.cursorColor,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: appColor.cursorColor,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: appColor.cursorColor,
      ),
    );
  }

  static AppColor getAppColor(ThemeType themeType) {
    switch (themeType) {
      case ThemeType.light:
        return AppColor.light();
      case ThemeType.dark:
        return AppColor.dark();
    }
  }

  static TextTheme getTextTheme(ThemeType themeType) {
    final appColor = getAppColor(themeType);
    switch (appColor.colorScheme.brightness) {
      case Brightness.dark:
        return Typography.material2018().white.apply(
              fontFamily: GoogleFonts.notoSans().fontFamily,
              displayColor: appColor.textColor,
              bodyColor: appColor.textColor,
            );
      case Brightness.light:
        return Typography.material2018().black.apply(
              fontFamily: GoogleFonts.notoSans().fontFamily,
              displayColor: appColor.textColor,
              bodyColor: appColor.textColor,
            );
    }
  }
}
