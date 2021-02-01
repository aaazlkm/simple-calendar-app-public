import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_controller.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/view/holiday_page_view.dart';

class HolidayPage extends StatefulWidget {
  const HolidayPage({Key? key}) : super(key: key);

  @override
  _HolidayPageState createState() => _HolidayPageState();
}

class _HolidayPageState extends State<HolidayPage> with HolidayController {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<HolidayController>.value(value: this),
          Provider<HolidayViewModelData>.value(value: viewModel),
        ],
        child: const HolidayPageView(),
      );
}
