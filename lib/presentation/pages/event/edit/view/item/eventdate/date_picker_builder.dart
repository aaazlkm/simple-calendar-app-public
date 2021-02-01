import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/date_picker_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/eventdate/date_picker_view.dart';

class DatePickerBuilder extends StatelessWidget {
  const DatePickerBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CombineStreamBuilder2<DatePickerState, DayOfWeek>(
        stream1: EventEditViewModelData.of(context).datePickerState,
        stream2: EventEditViewModelData.of(context).startDayOfWeek,
        initialData1: EventEditViewModelData.of(context).datePickerStateValue,
        initialData2: EventEditViewModelData.of(context).startDayOfWeekValue,
        builder: (context, datePickerState, startDayOfWeek) => DatePickerView(
          datePickerState: datePickerState,
          startDayOfWeek: startDayOfWeek,
        ),
      );
}
