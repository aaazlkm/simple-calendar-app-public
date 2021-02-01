import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/model/selected_state.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/multi_date_view_model.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/view/calendar_pager_view.dart';

class CalendarPagerBuilder extends StatelessWidget {
  const CalendarPagerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CombineStreamBuilder2<SelectedState, DayOfWeek>(
        stream1: MultiDateViewModel.of(context).selectedState,
        stream2: MultiDateViewModel.of(context).startDayOfWeek,
        initialData1: MultiDateViewModel.of(context).selectedState.value,
        initialData2: MultiDateViewModel.of(context).startDayOfWeek.value,
        builder: (context, displayEventList, startDayOfWeek) => CalendarPagerView(
          selectedState: displayEventList,
          startDayOfWeek: startDayOfWeek,
        ),
      );
}
