import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations_delegate.dart';
import 'package:simple_calendar_app/presentation/res/localizations/string/app_string.dart';
import 'package:simple_calendar_app/presentation/res/localizations/string/app_string_en.dart';
import 'package:simple_calendar_app/presentation/res/localizations/string/app_string_ja.dart';

class AppLocalizations {
  AppLocalizations(Locale locale) : _appString = _createAppString(locale);

  static const LocalizationsDelegate<AppLocalizations> delegate = AppLocalizationsDelegate();

  static const supportedLocales = [
    Locale(AppStringEn.languageCode, ''),
    Locale(AppStringJa.languageCode, ''),
  ];

  static Future<AppLocalizations> load(Locale locale) async {
    final countryCode = locale.countryCode;
    final name = countryCode == null || countryCode.isEmpty ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    Intl.defaultLocale = localeName;
    return AppLocalizations(locale);
  }

  static AppString _createAppString(Locale locale) {
    switch (locale.languageCode) {
      case AppStringEn.languageCode:
        return AppStringEn();
      case AppStringJa.languageCode:
        return AppStringJa();
      default:
        return AppStringEn();
    }
  }

  static AppString string(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations)!._appString;

  final AppString _appString;
}
