import 'dart:io';

import 'package:nifu_flutter_kit/extensions/platform_ex.dart';
import 'package:url_launcher/url_launcher.dart';

String get _howToRegisterDeviceCalendarPageUrlAndroid => PlatformEx.languageCode == 'ja' ? _howToRegisterDeviceCalendarPageUrlAndroidJa : _howToRegisterDeviceCalendarPageUrlAndroidEn;

String get _howToRegisterDeviceCalendarPageUrlIos => PlatformEx.languageCode == 'ja' ? _howToRegisterDeviceCalendarPageUrlIosJa : _howToRegisterDeviceCalendarPageUrlIosEn;

const String _howToRegisterDeviceCalendarPageUrlAndroidJa =
    'https://support.google.com/calendar/answer/6084659?co=GENIE.Platform%3DAndroid&hl=ja&oco=0#zippy=%2C%E5%9B%BD%E6%B0%91%E3%81%AE%E7%A5%9D%E6%97%A5%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%BE%E3%81%9F%E3%81%AF%E5%A4%89%E6%9B%B4%E3%81%99%E3%82%8B';

const String _howToRegisterDeviceCalendarPageUrlAndroidEn =
    'https://support.google.com/calendar/answer/6084659?co=GENIE.Platform%3DAndroid&hl=en&oco=0#zippy=%2C%E5%9B%BD%E6%B0%91%E3%81%AE%E7%A5%9D%E6%97%A5%E3%82%92%E8%BF%BD%E5%8A%A0%E3%81%BE%E3%81%9F%E3%81%AF%E5%A4%89%E6%9B%B4%E3%81%99%E3%82%8B%2Cadd-or-change-country-holidays';

const String _howToRegisterDeviceCalendarPageUrlIosJa =
    'https://support.apple.com/ja-jp/guide/iphone/iph3d1110d4/ios#:~:text=%E3%82%92%E7%85%A7%E4%BC%9A%E3%81%99%E3%82%8B-,%E3%80%8C%E8%A8%AD%E5%AE%9A%E3%80%8D%20%EF%BC%9E%E3%80%8C%E3%82%AB%E3%83%AC%E3%83%B3%E3%83%80%E3%83%BC%E3%80%8D%EF%BC%9E%E3%80%8C%E3%82%A2%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%80%8D%EF%BC%9E,%E6%83%85%E5%A0%B1%E3%82%92%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%BE%E3%81%99%E3%80%82';

const String _howToRegisterDeviceCalendarPageUrlIosEn = 'https://support.apple.com/guide/iphone/use-multiple-calendars-iph3d1110d4/14.0/ios/14.0';

Future<void> showHowToRegisterDeviceCalendarPage() async {
  if (Platform.isAndroid) {
    await launch(_howToRegisterDeviceCalendarPageUrlAndroid);
    return;
  }
  if (Platform.isIOS) {
    await launch(_howToRegisterDeviceCalendarPageUrlIos);
    return;
  }
  throw AssertionError('Unsupported Platform.');
}
