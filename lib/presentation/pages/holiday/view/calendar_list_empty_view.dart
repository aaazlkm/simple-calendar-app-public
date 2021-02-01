import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/gen/assets.gen.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_controller.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class CalendarListEmptyView extends StatelessWidget {
  const CalendarListEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.9),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: Dimens.padding64),
                ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(Dimens.padding16).copyWith(right: 24),
                    color: Colors.white,
                    child: Assets.image.catSitting.image(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.padding24),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    AppLocalizations.string(context).holidayListEmptyTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(),
                  ),
                ),
                const SizedBox(height: Dimens.padding8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    AppLocalizations.string(context).holidayListEmptyDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(Dimens.emphasisLow),
                        ),
                  ),
                ),
                TextButton(
                  onPressed: () => HolidayController.of(context).onHowToRegisterButtonOnEmptyTap(),
                  child: Text(
                    AppLocalizations.string(context).holidayListEmptyHowToRegister,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Colors.blue[700],
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
