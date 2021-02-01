import 'package:simple_calendar_app/core/constant.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showPrivacyPolicyPage() async {
  const privacyPolicyURL = Constant.privacyPolicyURL;
  if (await canLaunch(privacyPolicyURL)) {
    await launch(privacyPolicyURL);
  }
}
