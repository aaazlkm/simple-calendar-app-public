import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/calendar_permission_status.dart';
import 'package:simple_calendar_app/gen/assets.gen.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_controller.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class PermissionRequireView extends StatelessWidget {
  const PermissionRequireView({
    required this.calendarPermissionStatus,
    Key? key,
  }) : super(key: key);

  final CalendarPermissionStatus calendarPermissionStatus;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(Dimens.padding16).copyWith(right: 24),
                    color: Colors.white,
                    child: Assets.image.calendar.image(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.padding8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    AppLocalizations.string(context).holidayPermissionTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: Dimens.padding8),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Text(
                    AppLocalizations.string(context).holidayPermissionDescription,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(Dimens.emphasisMedium),
                        ),
                  ),
                ),
                const SizedBox(height: Dimens.padding56),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 0.85),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.71, // テキストの幅よりも少し広くする。こちらの方が揃っているように見える
              child: MaterialButton(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                padding: const EdgeInsets.symmetric(horizontal: Dimens.padding24, vertical: Dimens.padding12),
                color: Theme.of(context).colorScheme.secondary,
                elevation: 4,
                onPressed: () => HolidayController.of(context).onPermissionRequestButtonTap(calendarPermissionStatus),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.string(context).holidayPermissionPermitAccess,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      );
}
