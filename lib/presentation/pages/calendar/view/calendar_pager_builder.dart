import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/holiday/holiday.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/calendar_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/calendar/view/calendar_pager_view.dart';

class CalendarPagerBuilder extends StatelessWidget {
  const CalendarPagerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CombineStreamBuilder3<BuiltList<Event>, BuiltList<Holiday>, DayOfWeek>(
        stream1: CalendarViewModelData.of(context).events,
        stream2: CalendarViewModelData.of(context).holidays,
        stream3: CalendarViewModelData.of(context).startDayOfWeek,
        initialData1: CalendarViewModelData.of(context).eventsValue,
        initialData2: CalendarViewModelData.of(context).holidaysValue,
        initialData3: CalendarViewModelData.of(context).startDayOfWeekValue,
        builder: (context, events, holidays, startDayOfWeek) => CalendarPagerView(
          events: events,
          holidays: holidays,
          startDayOfWeek: startDayOfWeek,
        ),
      );
}
