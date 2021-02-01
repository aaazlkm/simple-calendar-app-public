import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:nifu_flutter_kit/nifu_flutter_kit.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_page.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/multi_date_item_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/note_item_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/history/event_history_builder.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/add_option_item_view.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/color_item_builder.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/eventdate/event_date_item_builder.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/multi_date_item_view.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/name_item_view.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/item/note_item_view.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/undo_button.dart';

class EventEditBodyView extends StatelessWidget {
  const EventEditBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
        behavior: ScrollBehaviorForRemoveOverflowColor(),
        child: Column(
          children: [
            const NameItemView(),
            _buildDivider(),
            Expanded(
              child: Stack(
                children: [
                  NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      EventEditController.of(context).onUserScrollNotification(notification);
                      return true;
                    },
                    child: ListView(
                      controller: ModalScrollController.of(context),
                      padding: EdgeInsets.zero,
                      children: [
                        const EventDateItemBuilder(),
                        _buildDivider(),
                        _buildMultiDateItem(context),
                        const ColorItemBuilder(),
                        _buildDivider(),
                        _buildNoteItem(context),
                        _buildAddOptionItem(context),
                        const SizedBox(height: Dimens.padding80),
                      ],
                    ),
                  ),
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: UndoButton(),
                    ),
                  ),
                  _buildHistory(context),
                ],
              ),
            ),
          ],
        ),
      );

  CombineStreamBuilder2<EventDate, MultiDateItemState> _buildMultiDateItem(BuildContext context) => CombineStreamBuilder2<EventDate, MultiDateItemState>(
        stream1: EventEditViewModelData.of(context).eventDate,
        stream2: EventEditViewModelData.of(context).multiDateItemState,
        initialData1: EventEditViewModelData.of(context).eventDateValue,
        initialData2: EventEditViewModelData.of(context).multiDateItemState.value,
        builder: (context, eventDate, multiDateItemState) => AnimatedExpansion(
          isExpanded: multiDateItemState.isVisible,
          duration: const Duration(milliseconds: 300),
          child: Column(
            children: [
              MultiDateItemView(eventDates: multiDateItemState.createSelectedEventDates(eventDate)),
              _buildDivider(),
            ],
          ),
        ),
      );

  StreamBuilder<NoteItemState> _buildNoteItem(BuildContext context) => StreamBuilder<NoteItemState>(
        stream: EventEditViewModelData.of(context).noteItemState,
        initialData: EventEditViewModelData.of(context).noteItemState.value,
        builder: (context, snapshot) => AnimatedExpansion(
          isExpanded: snapshot.requireData == NoteItemState.visible,
          duration: const Duration(milliseconds: 300),
          child: Column(
            children: [
              const NoteItemView(),
              _buildDivider(),
            ],
          ),
        ),
      );

  StreamBuilder<bool> _buildAddOptionItem(BuildContext context) => StreamBuilder<bool>(
        stream: EventEditViewModelData.of(context).addOptionItemVisible,
        initialData: EventEditViewModelData.of(context).addOptionItemVisibleValue,
        builder: (context, snapshot) => AnimatedVisibility(
          visible: snapshot.requireData,
          duration: const Duration(milliseconds: 300),
          child: const AddOptionItemView(),
        ),
      );

  StreamBuilder<bool> _buildHistory(BuildContext context) => StreamBuilder<bool>(
        stream: EventEditViewModelData.of(context).historyVisible,
        initialData: EventEditViewModelData.of(context).historyVisibleValue,
        builder: (context, snapshot) => AnimatedVisibility(
          visible: snapshot.requireData,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOutQuint,
          child: const EventHistoryBuilder(),
        ),
      );

  Divider _buildDivider() => const Divider(height: Dimens.viewSize1);
}
