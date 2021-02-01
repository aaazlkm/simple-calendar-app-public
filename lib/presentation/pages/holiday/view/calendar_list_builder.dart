import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/holiday_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/model/calendar_list_item.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/view/calendar_list_empty_view.dart';
import 'package:simple_calendar_app/presentation/pages/holiday/view/calendar_list_view.dart';

class CalendarListBuilder extends StatelessWidget {
  const CalendarListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<BuiltList<CalendarListItem>>(
        stream: HolidayViewModelData.of(context).calendarListItems,
        initialData: HolidayViewModelData.of(context).calendarListItemsValue,
        builder: (context, snapshot) => snapshot.requireData.isEmpty
            ? const CalendarListEmptyView()
            : CalendarListView(
                deviceCalendars: snapshot.requireData,
              ),
      );
}
