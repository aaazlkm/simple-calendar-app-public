import 'package:simple_calendar_app/core/constant.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showTermsAndConditionsPage() async {
  const termsAndConditionsURL = Constant.termsAndConditionsURL;
  if (await canLaunch(termsAndConditionsURL)) {
    await launch(termsAndConditionsURL);
  }
}
