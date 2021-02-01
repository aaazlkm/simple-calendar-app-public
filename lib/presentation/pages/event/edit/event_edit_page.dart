import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nifu_flutter_kit/util/focus.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history.dart';
import 'package:simple_calendar_app/locator/locator.dart';
import 'package:simple_calendar_app/presentation/navigator/app_navigator.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/controller/date_picker_page_controller.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/controller/name_text_editing_cotroller.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/controller/note_text_editing_controller.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/event_edit_view_model.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/item_select_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/note_item_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/undo_button_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/trade/event_edit_argument.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/event_edit_page_view.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/view/option_modal.dart';
import 'package:simple_calendar_app/presentation/port/dialog/alert_dialog.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/multi_date_picker.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/trade/multi_date_argument.dart';
import 'package:simple_calendar_app/presentation/port/toast.dart';
import 'package:simple_calendar_app/presentation/res/localizations/app_localizations.dart';

class EventEditPage extends StatefulWidget {
  const EventEditPage({
    required this.argument,
    Key? key,
  }) : super(key: key);

  final EventEditArgument argument;

  @override
  _EventEditPageState createState() => _EventEditPageState();
}

class _EventEditPageState extends State<EventEditPage> with EventEditController {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<EventEditController>.value(value: this),
          Provider<EventEditViewModelData>.value(value: _viewModel),
          Provider<DatePickerPageController>.value(value: _datePickerPageController),
          Provider<NameTextEditingController>.value(value: _nameTextEditingController),
          Provider<NoteTextEditingController>.value(value: _noteTextEditingController),
        ],
        child: const EventEditPageView(),
      );
}

mixin EventEditController on State<EventEditPage> {
  static EventEditController of(BuildContext context) => context.read<EventEditController>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();
  late final EventEditViewModel _viewModel;
  late final DatePickerPageController _datePickerPageController;
  late final NameTextEditingController _nameTextEditingController;
  late final NoteTextEditingController _noteTextEditingController;

  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<EventEditViewModel>()..setup(widget.argument);
    _datePickerPageController = DatePickerPageController(initialYearMonth: _viewModel.datePickerStateValue.yearMonth);
    _nameTextEditingController = NameTextEditingController()..text = _viewModel.eventValue.name;
    _noteTextEditingController = NoteTextEditingController()..text = _viewModel.eventValue.note;
    _bindViewModelEvent();
    _bindViewModelState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _datePickerPageController.dispose();
    _nameTextEditingController.dispose();
    _noteTextEditingController.dispose();
    _compositeSubscription.clear();
    super.dispose();
  }

  void _bindViewModelEvent() {
    _viewModel.savingEventResult.listen((result) {
      result.ifFailure((_) => showToast(message: AppLocalizations.string(context).eventEdit.failedToSave));
      AppNavigator.of(context).popEventEditPage(context);
    }).addTo(_compositeSubscription);

    _viewModel.deletingEventResult.listen((result) {
      result.ifFailure((_) => showToast(message: AppLocalizations.string(context).eventEdit.failedToDelete));
      AppNavigator.of(context).popEventEditPage(context);
    }).addTo(_compositeSubscription);

    _viewModel.invalidNameOnSaveEvent.listen((result) {
      showToast(message: AppLocalizations.string(context).eventEdit.invalidName, toastLength: Toast.LENGTH_LONG);
      _viewModel.updateItemSelectState(ItemSelectState.name);
    }).addTo(_compositeSubscription);

    _viewModel.invalidDateOnSaveEvent.listen((result) {
      showToast(message: AppLocalizations.string(context).eventEdit.invalidDate, toastLength: Toast.LENGTH_LONG);
      _viewModel.updateItemSelectState(ItemSelectState.timeOfDay);
    }).addTo(_compositeSubscription);
  }

  void _bindViewModelState() {
    _viewModel.itemSelectState.listen((state) {
      switch (state) {
        case ItemSelectState.name:
          _nameTextEditingController.requestFocus();
          break;
        case ItemSelectState.note:
          _noteTextEditingController.requestFocus();
          break;
        case ItemSelectState.none:
        case ItemSelectState.date:
        case ItemSelectState.multiDate:
        case ItemSelectState.timeOfDay:
        case ItemSelectState.color:
          clearFocus();
          break;
      }
    }).addTo(_compositeSubscription);

    _viewModel.datePickerState.listen((state) {
      _datePickerPageController.animateToYearMonthPageIfNeeded(state.yearMonth);
    }).addTo(_compositeSubscription);
  }

  Future<bool> onWillPop() async {
    var shouldClose = true;
    if (_viewModel.needToPreventPop) {
      await showDeleteCancelAlertDialog(
        context: context,
        title: AppLocalizations.string(context).eventEdit.confirmPopDialogTitle,
        deleteText: AppLocalizations.string(context).eventEdit.confirmPopDialogButtonText,
        onCancelPressed: () {
          shouldClose = false;
        },
      );
    }
    return shouldClose;
  }

  void onDeleteButtonTap() {
    showDeleteCancelAlertDialog(
      context: context,
      title: AppLocalizations.string(context).eventEdit.confirmDeleteDialogTitle(_viewModel.eventValue.name),
      onDeletePressed: _viewModel.deleteEvent,
    );
  }

  void onNameItemTap() {
    _viewModel.toggleItemSelectState(ItemSelectState.name);
  }

  void onNameChanged(String name) {
    _viewModel.setEventProperty(name: name);
  }

  void onNameTextFieldFocusChanged({required bool hasFocus}) {
    _viewModel.updateNameTextFieldHasFocus(hasFocus: hasFocus);
  }

  void onEventHistorySelected(EventHistory eventHistory) {
    _viewModel
      ..setEventProperty(name: eventHistory.name, color: eventHistory.color)
      ..toggleItemSelectState(ItemSelectState.none);
    _nameTextEditingController.text = eventHistory.name;
  }

  void onEventHistoryDeleteButtonTap(EventHistory eventHistory) {
    HapticFeedback.lightImpact();
    _viewModel.deleteEventHistory(eventHistory);
  }

  void onUserScrollNotification(UserScrollNotification notification) {
    if (notification.direction == ScrollDirection.forward) {
      clearFocus();
    }
  }

  void onEventDateItemTap() {
    _viewModel
      ..initializeDatePickerState()
      ..toggleItemSelectState(ItemSelectState.date);
  }

  void onDatePickerYearMonthChanged(DateTime yearMonth) {
    HapticFeedback.lightImpact();
    _viewModel.updateDatePickerStateOfYearMonth(yearMonth);
  }

  void onDatePickerDaySelected(DateTime day) {
    HapticFeedback.lightImpact();
    _viewModel.updateDatePickerStateOfDate(day);
  }

  void onDatePickerNextMonthTap() {
    _viewModel.goToNextDatePickerMonth();
  }

  void onDatePickerPrevMonthTap() {
    _viewModel.goToPrevDatePickerMonth();
  }

  Future<void> onEnableTimeOfDayButton() async {
    await HapticFeedback.lightImpact();
    final now = DateTime.now();
    _viewModel
      ..setEventProperty(
        // 24以上の値を渡すと次の日に遷移するため
        startHour: now.minute < 30 ? now.hour : (now.hour + 1) % 24,
        startMinute: now.minute < 30 ? 30 : 0,
        // 24以上の値を渡すと次の日に遷移するため
        endHour: now.minute < 30 ? (now.hour + 1) % 24 : (now.hour + 2) % 24,
        endMinute: now.minute < 30 ? 30 : 0,
        isAllDay: false,
      )
      ..toggleItemSelectState(ItemSelectState.timeOfDay);
  }

  void onDisableTimeOfDayButton() {
    HapticFeedback.lightImpact();
    _viewModel
      ..setEventProperty(isAllDay: true)
      ..toggleItemSelectState(ItemSelectState.none);
  }

  void onTimeOfDayStartTap() {
    _viewModel.toggleItemSelectState(ItemSelectState.timeOfDay);
  }

  void onTimeOfDayEndTap() {
    _viewModel.toggleItemSelectState(ItemSelectState.timeOfDay);
  }

  void onTimeOfDayChanged({int? startHour, int? startMinute, int? endHour, int? endMinute}) {
    _viewModel.setEventProperty(
      startHour: startHour,
      startMinute: startMinute,
      endHour: endHour,
      endMinute: endMinute,
    );
  }

  void onMultiDateItemTap() {
    HapticFeedback.lightImpact();
    _viewModel.updateItemSelectState(ItemSelectState.multiDate);
    _showMultiDatePicker();
  }

  void onMultiDateItemDismissButtonTap() {
    HapticFeedback.lightImpact();
    _viewModel.multiDateItemState.value.maybeWhen(
      visible: (selectedDays) {
        _viewModel
          ..updateMultiDateItemToGone()
          ..cacheMultiDaysForUndo(selectedDays);
      },
      orElse: () {},
    );
  }

  void onColorItemTap() {
    _viewModel.toggleItemSelectState(ItemSelectState.color);
  }

  void onColorSelected(Color color) {
    HapticFeedback.lightImpact();
    _viewModel
      ..setEventProperty(color: color)
      ..toggleItemSelectState(ItemSelectState.none);
  }

  void onNoteItemTap() {
    _viewModel.toggleItemSelectState(ItemSelectState.note);
  }

  void onNoteChanged(String note) {
    _viewModel.setEventProperty(note: note);
  }

  void onNoteDismissButtonTap() {
    HapticFeedback.lightImpact();
    _viewModel
      ..setEventProperty(note: '')
      ..updateItemSelectState(ItemSelectState.none)
      ..updateNoteItemState(NoteItemState.gone)
      ..cacheNoteForUndo(_noteTextEditingController.text);
    _noteTextEditingController.text = '';
  }

  void onAddOptionButtonTap() {
    HapticFeedback.lightImpact();
    _viewModel.updateItemSelectState(ItemSelectState.none);
    showOptionModal(
      context,
      excludeOptions: [
        if (_viewModel.noteItemState.value.isVisible) Option.note else null,
        if (_viewModel.multiDateItemState.value.isVisible) Option.multiDates else null,
      ].whereNotNull().toBuiltList(),
      onOptionSelected: (option) async {
        switch (option) {
          case Option.note:
            _viewModel
              ..updateNoteItemState(NoteItemState.visible)
              ..updateItemSelectState(ItemSelectState.note);
            break;
          case Option.multiDates:

            /// option modalが閉じる途中でmulti date pickerを表示するようにする
            await Future<void>.delayed(const Duration(milliseconds: 50));
            await _showMultiDatePicker();
            break;
        }
      },
    );
  }

  void onUndoButtonTap(UndoButtonState state) {
    HapticFeedback.lightImpact();
    state.maybeWhen(
      visible: (cacheStore) {
        final cache = cacheStore.pop();
        if (cacheStore.isEmpty) {
          _viewModel.updateUndoButtonToGone();
        }
        cache?.when(
          note: (prevNote) {
            _noteTextEditingController.text = prevNote;
            _viewModel
              ..updateNoteItemState(NoteItemState.visible)
              ..setEventProperty(note: prevNote);
          },
          multiDates: (prevSelectedDates) {
            _viewModel.updateMultiDateItemToVisible(prevSelectedDates);
          },
        );
      },
      orElse: () {},
    );
  }

  void onFloatingActionButtonTap() {
    _viewModel.saveOrUpdateEvent();
  }

  Future<void> _showMultiDatePicker() async {
    final returnValue = await showMultiDatePicker(
      context,
      argument: MultiDateArgument(
        event: _viewModel.eventValue,
        initialYearMonth: _viewModel.datePickerStateValue.yearMonth,
        initialDateTimes: _viewModel.multiDateItemState.value.map(
          gone: (gone) => BuiltList.of([]),
          visible: (visible) => visible.selectedDays,
        ),
      ),
    );
    if (returnValue != null) {
      _viewModel.updateMultiDateItemToVisible(returnValue.dateTimes);
    }
  }
}
