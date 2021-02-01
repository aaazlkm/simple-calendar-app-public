import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar_app/presentation/pages/setting/setting_controller.dart';
import 'package:simple_calendar_app/presentation/pages/setting/setting_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/setting/view/setting_view.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> with SettingController {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<SettingViewModelData>.value(value: viewModel),
          Provider<SettingController>.value(value: this),
        ],
        child: const SettingView(),
      );
}
