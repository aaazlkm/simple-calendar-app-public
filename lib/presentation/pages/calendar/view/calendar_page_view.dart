import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nifu_flutter_kit/extensions/date_time_ex.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/calendar_page.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/calendar_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/model/year_month_picker_state.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/view/calendar_pager_builder.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/view/year_month_picker.dart';
import 'package:simple_calendar_app/presentation/pages/drawer/drawer_view.dart';

class CalendarPageView extends StatefulWidget {
  const CalendarPageView({Key? key}) : super(key: key);

  @override
  _CalendarPageViewState createState() => _CalendarPageViewState();
}

class _CalendarPageViewState extends State<CalendarPageView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const DrawerView(),
        appBar: buildAppBar(context),
        body: const SafeArea(child: _CalendarPageBody()),
      );

  AppBar buildAppBar(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: const _AppBarTitle(),
        leading: Builder(
          builder: (context) => IconButton(
            padding: const EdgeInsets.only(left: Dimens.padding16),
            icon: const Icon(FluentIcons.navigation_20_regular),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      );
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<DateTime>(
        stream: CalendarViewModelData.of(context).yearMonth,
        initialData: CalendarViewModelData.of(context).yearMonthValue,
        builder: (context, snapshot) => InkWell(
          onTap: () => CalendarController.of(context).onTitleTap(),
          borderRadius: const BorderRadius.all(Radius.circular(Dimens.radius8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.padding24, vertical: Dimens.padding8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  snapshot.requireData.isSameYear(DateTime.now()) ? DateFormat.MMM().format(snapshot.requireData) : DateFormat.yMMM().format(snapshot.requireData),
                  style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: Dimens.padding4),
                StreamBuilder<YearMonthPickerState>(
                  stream: CalendarViewModelData.of(context).yearMonthPickerState,
                  initialData: CalendarViewModelData.of(context).yearMonthPickerStateValue,
                  builder: (context, snapshot) => TweenAnimationBuilder<double>(
                    duration: kThemeAnimationDuration,
                    curve: Curves.easeInOutSine,
                    tween: Tween(begin: 2 * pi, end: snapshot.requireData.visible ? pi : 2 * pi),
                    builder: (context, angle, child) => Transform.rotate(
                      angle: angle,
                      child: child,
                    ),
                    child: const Icon(
                      FluentIcons.chevron_down_24_filled,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _CalendarPageBody extends StatelessWidget {
  const _CalendarPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const Positioned.fill(
                  child: CalendarPagerBuilder(),
                ),
                const Positioned.fill(
                  child: YearMonthPickerBuilder(),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.padding16),
                      child: buildFloatingActionButton(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget buildFloatingActionButton(BuildContext context) => StreamBuilder<bool>(
        stream: CalendarViewModelData.of(context).floatingActionButtonVisible,
        initialData: CalendarViewModelData.of(context).floatingActionButtonVisibleValue,
        builder: (context, snapshot) => AnimatedScale(
          scale: snapshot.requireData ? 1 : 0,
          duration: const Duration(milliseconds: 75),
          curve: snapshot.requireData ? Curves.easeOutSine : Curves.easeInSine,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: () => CalendarController.of(context).onFloatingActionButtonTap(),
            child: Icon(
              FluentIcons.add_24_filled,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      );
}
