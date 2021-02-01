import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/item_select_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/eventdate/event_date_item_view.dart';

class EventDateItemBuilder extends StatelessWidget {
  const EventDateItemBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => CombineStreamBuilder2<EventDate, ItemSelectState>(
        stream1: EventEditViewModelData.of(context).eventDate,
        stream2: EventEditViewModelData.of(context).itemSelectState,
        initialData1: EventEditViewModelData.of(context).eventDateValue,
        initialData2: EventEditViewModelData.of(context).itemSelectStateValue,
        builder: (context, eventDate, itemSelectState) => EventDateItemView(
          eventDate: eventDate,
          itemSelectState: itemSelectState,
        ),
      );
}
