import 'dart:math';

import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/calendar_permission_status.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_controller.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/view/calendar_list_builder.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/view/permission_require_view.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class HolidayPageView extends StatelessWidget {
  const HolidayPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FocusDetector(
        onForegroundGained: () => HolidayController.of(context).onForegroundGained(),
        child: SizedBox(
          height: min(MediaQuery.of(context).size.height, 800),
          child: Column(
            children: [
              const _TopControl(),
              Divider(
                height: 0.5,
                color: Theme.of(context).colorScheme.onBackground.withOpacity(0.15),
              ),
              Expanded(
                child: Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  body: const _HolidayBodyView(),
                ),
              ),
            ],
          ),
        ),
      );
}

class _HolidayBodyView extends StatelessWidget {
  const _HolidayBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SafeArea(
        child: StreamBuilder<CalendarPermissionStatus>(
          stream: HolidayViewModelData.of(context).calendarPermissionStatus,
          initialData: HolidayViewModelData.of(context).calendarPermissionStatusValue,
          builder: (context, snapshot) {
            switch (snapshot.requireData) {
              case CalendarPermissionStatus.granted:
                return const CalendarListBuilder();
              case CalendarPermissionStatus.needPermission:
              case CalendarPermissionStatus.needPermissionFromDeviceSetting:
                return PermissionRequireView(calendarPermissionStatus: snapshot.requireData);
            }
          },
        ),
      );
}

class _TopControl extends StatelessWidget {
  const _TopControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).colorScheme.background,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: Dimens.padding8),
                child: Container(
                  height: Dimens.viewSize4,
                  width: Dimens.viewSize40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(Dimens.radius8),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimens.padding16),
                child: Text(
                  AppLocalizations.string(context).holidayTitle,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              )
            ],
          ),
        ),
      );
}
