import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/history/event_history_view.dart';

class EventHistoryBuilder extends StatelessWidget {
  const EventHistoryBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => StreamBuilder<BuiltList<EventHistory>>(
        stream: EventEditViewModelData.of(context).eventHistories,
        initialData: EventEditViewModelData.of(context).eventHistoriesValue,
        builder: (context, snapshot) => EventHistoryView(eventHistories: snapshot.requireData),
      );
}
