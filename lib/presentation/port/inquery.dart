import 'package:nifu_flutter_kit/extensions/platform_ex.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showInquiryPage({String? languageCode}) async {
  languageCode ??= PlatformEx.languageCode;
  switch (languageCode) {
    case 'ja':
      await launch(Constant.appInquiryPageURLJa);
      break;
    default:
      await launch(Constant.appInquiryPageURLEn);
      break;
  }
}
