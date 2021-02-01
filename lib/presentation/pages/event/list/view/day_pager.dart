import 'package:built_collection/built_collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:nifu_flutter_kit/resources/dimens.dart';
import 'package:result/result.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/controller/event_list_pager_cotroller.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/event_list_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/event_list_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/list/view/day_view.dart';

class DayPagerBuilder extends StatelessWidget {
  const DayPagerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CombineStreamBuilder3<DateTime, LoadResult<BuiltList<Event>>, BuiltList<Holiday>>(
        stream1: EventListViewModelData.of(context).nowDay,
        stream2: EventListViewModelData.of(context).eventsResult,
        stream3: EventListViewModelData.of(context).holidays,
        initialData1: EventListViewModelData.of(context).nowDayValue,
        initialData2: EventListViewModelData.of(context).eventsResultValue,
        initialData3: EventListViewModelData.of(context).holidaysValue,
        builder: (_, day, eventsResult, holidays) => _DayPager(
          nowDay: day,
          eventsResult: eventsResult,
          holidays: holidays,
        ),
      );
}

class _DayPager extends StatelessWidget {
  const _DayPager({
    required this.nowDay,
    required this.eventsResult,
    required this.holidays,
    Key? key,
  }) : super(key: key);

  final DateTime nowDay;

  final LoadResult<BuiltList<Event>> eventsResult;

  final BuiltList<Holiday> holidays;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          _DayPagerHelper(
            dayBuilder: (context, day) => DayView(
              nowDay: nowDay,
              day: day,
              eventsResult: eventsResult.map(
                success: (success) => LoadResult.success(success.value.where((event) => event.eventDate.isIn(day)).toBuiltList()),
                failure: (failure) => failure,
                loading: (loading) => loading,
              ),
              holidays: holidays.where((holiday) => holiday.dateRange.isIn(day)).toBuiltList(),
            ),
            onDayChanged: (day) => EventListController.of(context).onDayChanged(day),
          ),
          Positioned.fill(
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * DayView.viewportWidthFraction, // pagerの要素の幅と揃えている
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: Dimens.padding16 + DayView.horizontalPadding, bottom: Dimens.padding16),
                    child: FloatingActionButton(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      onPressed: () => EventListController.of(context).onFloatingActionButtonTap(),
                      child: const Icon(FluentIcons.add_24_filled),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}

class _DayPagerHelper extends StatelessWidget {
  const _DayPagerHelper({
    required this.dayBuilder,
    required this.onDayChanged,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, DateTime day) dayBuilder;

  final ValueChanged<DateTime> onDayChanged;

  @override
  Widget build(BuildContext context) => PageView.builder(
        controller: EventListPagerController.of(context).pageController,
        onPageChanged: (pageIndex) => onDayChanged(EventListPagerController.calculateDayFromPageIndex(pageIndex: pageIndex)),
        itemCount: EventListPagerController.pageCount,
        itemBuilder: (context, index) => dayBuilder(context, EventListPagerController.calculateDayFromPageIndex(pageIndex: index)),
      );
}
