import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:nifu_flutter_kit/extensions/extensions.dart';
import 'package:provider/provider.dart';
import 'package:result/result.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/core/ex/tz_date_time_ex.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/calendar/model/date_range.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/calendar_usecase.dart';
import 'package:simple_calendar_app/domain/calendar/usecase/event_history_usecase.dart';
import 'package:simple_calendar_app/domain/setting/usecase/setting_usecase.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/date_picker_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/item_select_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/multi_date_item_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/note_item_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/undo_button_state.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/undo_cache.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/state/undo_cache_store.dart';
import 'package:simple_calendar_app/presentation/pages/event/edit/trade/event_edit_argument.dart';
import 'package:simple_calendar_app/presentation/res/app_color.dart';
import 'package:timezone/timezone.dart';

abstract class EventEditViewModelData with _ItemStateValue, _UndoButtonStoreData {
  static EventEditViewModelData of(BuildContext context) => context.read<EventEditViewModelData>();

  static bool _validateEventName(Event event) => event.name.isNotEmpty;

  static bool _validateEventDate(EventDate eventDate) {
    if (eventDate.isAllDay) {
      return true;
    } else {
      return eventDate.start.millisecondsSinceEpoch <= eventDate.end.millisecondsSinceEpoch;
    }
  }

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  //region result
  final PublishSubject<Result<Complete>> _savingEventResult = PublishSubject();

  Stream<Result<Complete>> get savingEventResult => _savingEventResult.stream;

  final PublishSubject<Result<Complete>> _deletingEventResult = PublishSubject();

  Stream<Result<Complete>> get deletingEventResult => _deletingEventResult.stream;

  //endregion

  //region event
  final PublishSubject<Complete> _invalidNameOnSaveEvent = PublishSubject();

  Stream<Complete> get invalidNameOnSaveEvent => _invalidNameOnSaveEvent.stream;

  final PublishSubject<Complete> _invalidDateOnSaveEvent = PublishSubject();

  Stream<Complete> get invalidDateOnSaveEvent => _invalidDateOnSaveEvent.stream;

  //event

  //region data state
  /// setupで渡される
  late final EventEditArgument argument;

  /// setupで渡される
  final BehaviorSubject<Calendar> _calendar = BehaviorSubject();

  Stream<Calendar> get calendar => _calendar.stream.distinct();

  Calendar get calendarValue => _calendar.value;

  /// setupで渡される
  final BehaviorSubject<Event> _event = BehaviorSubject();

  Stream<Event> get event => _event.stream.distinct();

  Event get eventValue => _event.value;

  final BehaviorSubject<BuiltList<EventHistory>> _eventHistories = BehaviorSubject.seeded(BuiltList.of([]));

  Stream<BuiltList<EventHistory>> get eventHistories => _eventHistories.map(_sortEventHistories).distinct();

  BuiltList<EventHistory> get eventHistoriesValue => _sortEventHistories(_eventHistories.value);

  final BehaviorSubject<DayOfWeek> _startDayOfWeek = BehaviorSubject.seeded(Constant.defaultStartDayOfWeek);

  Stream<DayOfWeek> get startDayOfWeek => _startDayOfWeek.stream.distinct();

  DayOfWeek get startDayOfWeekValue => _startDayOfWeek.value;

  //endregion

  //region view state

  final BehaviorSubject<DatePickerState> _datePickerState = BehaviorSubject.seeded(DatePickerState.initial(yearMonth: DateTime.now(), prevDateRange: DateRange.day(day: DateTime.now())));

  Stream<DatePickerState> get datePickerState => _datePickerState.stream.distinct();

  DatePickerState get datePickerStateValue => _datePickerState.value;

  final BehaviorSubject<bool> _deleteButtonVisible = BehaviorSubject.seeded(false);

  Stream<bool> get deleteButtonVisible => _deleteButtonVisible.stream.distinct();

  bool get deleteButtonVisibleValue => _deleteButtonVisible.value;

  final BehaviorSubject<bool> _hasNameTextFieldFocus = BehaviorSubject.seeded(false);

  Stream<bool> get hasNameTextFieldFocus => _hasNameTextFieldFocus.stream.distinct();

  bool get hasNameTextFieldFocusValue => _hasNameTextFieldFocus.value;

  //endregion
  Stream<EventDate> get eventDate => event.map((event) => event.eventDate);

  EventDate get eventDateValue => eventValue.eventDate;

  Stream<Color> get color => event.map((event) => event.color);

  Color get colorValue => eventValue.color;

  Stream<bool> get isValidEventDate => event.map((event) => _validateEventDate(event.eventDate));

  bool get isValidEventDateValue => _validateEventDate(eventValue.eventDate);

  Stream<bool> get canSave => event.map(_validateEventName);

  bool get canSaveValue => _validateEventName(eventValue);

  Stream<bool> get historyVisible => Rx.combineLatest3<bool, bool, bool, bool>(
        eventHistories.map((list) => list.isNotEmpty),
        event.map((event) => event.name.isEmpty),
        hasNameTextFieldFocus,
        (a, b, c) => a && b && c,
      );

  bool get historyVisibleValue => eventHistoriesValue.isNotEmpty && eventValue.name.isEmpty && hasNameTextFieldFocusValue;

  bool get needToPreventPop => argument.map(
        newItem: (newItem) => eventValue.name.isNotEmpty || eventValue.note.isNotEmpty,
        edit: (edit) => edit.event != eventValue,
      );

  void dispose() {
    _savingEventResult.close();
    _deletingEventResult.close();
    _invalidNameOnSaveEvent.close();
    _invalidDateOnSaveEvent.close();
    _datePickerState.close();
    _itemSelectState.close();
    _deleteButtonVisible.close();
    _hasNameTextFieldFocus.close();
    _calendar.close();
    _event.close();
    _eventHistories.close();
    _startDayOfWeek.close();
    _compositeSubscription.clear();
    _disposeItemState();
    _disposeUndoButton();
  }

  BuiltList<EventHistory> _sortEventHistories(BuiltList<EventHistory> eventHistories) => _sortedByCreatedAt(_distinctByName(eventHistories));

  BuiltList<EventHistory> _sortedByCreatedAt(BuiltList<EventHistory> events) => events.rebuild((list) => list..sort((a, b) => b.createdAt.compareTo(a.createdAt)));

  BuiltList<EventHistory> _distinctByName(BuiltList<EventHistory> events) {
    final names = events.map((e) => e.name).toSet();
    return events.rebuild((list) => list.retainWhere((x) => names.remove(x.name)));
  }
}

class EventEditViewModel extends EventEditViewModelData with _ItemState, _UndoButtonStore {
  EventEditViewModel({
    required this.calendarUseCase,
    required this.eventHistoryUseCase,
    required this.settingUseCase,
  }) {
    _syncDatePickerValueWithEvent();
  }

  final CalendarUseCase calendarUseCase;

  final EventHistoryUseCase eventHistoryUseCase;

  final SettingUseCase settingUseCase;

  void setup(EventEditArgument argument) {
    this.argument = argument;
    _calendar.add(argument.calendar);
    argument.when(
      newItem: (calendar, dateTime) {
        final date = dateTime ?? DateTime.now();
        final eventDate = EventDate.day(dateTime: date);
        _event.add(argument.calendar.createEvent(name: '', note: '', color: AppColor.eventColors.first, eventDate: eventDate));
        _datePickerState.add(datePickerStateValue.copyWith(yearMonth: date));
        _deleteButtonVisible.add(false);
        _fetchAndStartAutoSavingColor();
      },
      edit: (calendar, event) {
        _event.add(event);
        _datePickerState.add(datePickerStateValue.copyWith(yearMonth: event.eventDate.start));
        _deleteButtonVisible.add(true);
        _noteItemState.add(event.note.isNotEmpty ? NoteItemState.visible : NoteItemState.gone);
      },
    );
    _setupUndoButton();

    initializeDatePickerState();
    _fetchEventHistory();
    _fetchStartDayOfWeek();
  }

  //region event methods
  void setEventProperty({
    String? name,
    String? note,
    Color? color,
    DateTime? startDate,
    DateTime? endDate,
    int? startHour,
    int? startMinute,
    int? endHour,
    int? endMinute,
    bool? isAllDay,
  }) {
    final nowEvent = eventValue;
    final _name = name ?? nowEvent.name;
    final _note = note ?? nowEvent.note;
    final _color = color ?? nowEvent.color;
    final _startDate = startDate != null ? TZDateTime(nowEvent.eventDate.start.location, startDate.year, startDate.month, startDate.day) : nowEvent.eventDate.start;
    final _startDateWithTime = _startDate.copyWith(hour: startHour ?? nowEvent.eventDate.start.hour, minute: startMinute ?? nowEvent.eventDate.start.minute);
    final _endDate = endDate != null ? TZDateTime(nowEvent.eventDate.end.location, endDate.year, endDate.month, endDate.day) : nowEvent.eventDate.end;
    final _endDateWithTime = _endDate.copyWith(hour: endHour ?? nowEvent.eventDate.end.hour, minute: endMinute ?? nowEvent.eventDate.end.minute);
    final _isAllDay = isAllDay ?? nowEvent.eventDate.isAllDay;
    _event.add(
      nowEvent.copyWith(
        name: _name,
        note: _note,
        color: _color,
        eventDate: nowEvent.eventDate.copyWith(
          start: _startDateWithTime,
          end: _endDateWithTime,
          isAllDay: _isAllDay,
        ),
      ),
    );
  }

  Future<void> saveOrUpdateEvent() async {
    final event = eventValue;
    if (!EventEditViewModelData._validateEventName(event)) {
      _invalidNameOnSaveEvent.add(Complete());
      return;
    }

    if (!EventEditViewModelData._validateEventDate(event.eventDate)) {
      _invalidDateOnSaveEvent.add(Complete());
      return;
    }

    final newNote = noteItemState.value.isVisible ? event.note : '';
    final newEvent = event.copyWith(note: newNote);

    final result = await multiDateItemState.value.map(
      gone: (_) async => calendarUseCase.saveOrUpdateEvent(newEvent),
      visible: (visible) async {
        final newEvents = visible
            .createSelectedEventDates(newEvent.eventDate)
            .map(
              (eventDate) => newEvent.copyWith(
                id: EventId.constructor(),
                eventDate: eventDate,
              ),
            )
            .toBuiltList();
        return calendarUseCase.saveOrUpdateEvents([newEvent, ...newEvents].toBuiltList());
      },
    );
    _savingEventResult.add(result);
  }

  Future<void> deleteEvent() async {
    final result = await calendarUseCase.deleteEvent(eventValue);
    _deletingEventResult.add(result);
  }

  //endregion

  Future<void> deleteEventHistory(EventHistory eventHistory) async {
    final result = await eventHistoryUseCase.deleteEventHistory(eventHistory);
    result.ifFailure(logger.severe);
    _eventHistories.add(eventHistoriesValue.where((e) => e.id != eventHistory.id).toBuiltList());
  }

  //region name fields methods
  void updateNameTextFieldHasFocus({required bool hasFocus}) {
    _hasNameTextFieldFocus.add(hasFocus);
  }

  //endregion

  //region date picker methods
  void initializeDatePickerState() {
    _datePickerState.add(
      DatePickerState.initial(
        yearMonth: datePickerStateValue.yearMonth,
        prevDateRange: DateRange(start: eventValue.eventDate.start, end: eventValue.eventDate.end),
      ),
    );
  }

  void updateDatePickerStateOfYearMonth(DateTime yearMonth) {
    _datePickerState.add(datePickerStateValue.copyWith(yearMonth: yearMonth));
  }

  void updateDatePickerStateOfDate(DateTime dateTime) {
    _datePickerState.add(datePickerStateValue.map(
      initial: (initial) => initial.toDay(dateTime),
      day: (day) => day.day.isSameDay(dateTime) ? day : day.toRange(dateTime),
      range: (range) => range.toInitial(),
    ));
  }

  void goToNextDatePickerMonth() {
    _datePickerState.add(datePickerStateValue.copyWith(yearMonth: datePickerStateValue.yearMonth.addDate(month: 1)));
  }

  void goToPrevDatePickerMonth() {
    _datePickerState.add(datePickerStateValue.copyWith(yearMonth: datePickerStateValue.yearMonth.addDate(month: -1)));
  }

  //endregion

  Future<void> _fetchEventHistory() async {
    final result = await eventHistoryUseCase.fetchEventHistories(calendarValue.id);
    result.when(
      success: _eventHistories.add,
      failure: logger.severe,
    );
  }

  Future<void> _fetchStartDayOfWeek() async {
    final result = await settingUseCase.getStartDayOfWeek();
    result.when(
      success: _startDayOfWeek.add,
      failure: logger.severe,
    );
  }

  void _syncDatePickerValueWithEvent() {
    datePickerState.listen((state) {
      state.maybeWhen(
        day: (_, __, day) => setEventProperty(startDate: day, endDate: day),
        range: (_, __, start, end) => setEventProperty(startDate: start, endDate: end),
        orElse: () {},
      );
    }).addTo(_compositeSubscription);
  }

  /// fetchが完了してから、自動保存するようにする
  Future<void> _fetchAndStartAutoSavingColor() async {
    await _fetchPrevSelectedEventColor();
    _setupAutoSavingEventColor();
  }

  Future<void> _fetchPrevSelectedEventColor() async {
    final result = await settingUseCase.getPrevSelectedColor();
    result.when(
      success: (color) {
        if (color != null) {
          setEventProperty(color: color);
        }
      },
      failure: logger.severe,
    );
  }

  void _setupAutoSavingEventColor() {
    color
        .distinct()
        .debounceTime(const Duration(milliseconds: 500))
        .listen(
          settingUseCase.setPrevSelectedColor,
        )
        .addTo(_compositeSubscription);
  }
}

mixin _ItemStateValue {
  final BehaviorSubject<ItemSelectState> _itemSelectState = BehaviorSubject.seeded(ItemSelectState.none);

  Stream<ItemSelectState> get itemSelectState => _itemSelectState.stream.distinct();

  ItemSelectState get itemSelectStateValue => _itemSelectState.value;

  final BehaviorSubject<MultiDateItemState> _multiDateItemState = BehaviorSubject.seeded(const MultiDateItemState.gone());

  ValueStream<MultiDateItemState> get multiDateItemState => _multiDateItemState;

  final BehaviorSubject<NoteItemState> _noteItemState = BehaviorSubject.seeded(NoteItemState.gone);

  ValueStream<NoteItemState> get noteItemState => _noteItemState;

  Stream<bool> get addOptionItemVisible => Rx.combineLatest2<bool, bool, bool>(
        noteItemState.map((event) => event.isGone),
        multiDateItemState.map((event) => event.isGone),
        (a, b) => a || b,
      );

  bool get addOptionItemVisibleValue => noteItemState.value.isGone || multiDateItemState.value.isGone;

  void _disposeItemState() {
    _itemSelectState.close();
    _multiDateItemState.close();
    _noteItemState.close();
  }
}

mixin _ItemState on _ItemStateValue {
  void updateItemSelectState(ItemSelectState state) {
    _itemSelectState.add(state);
  }

  void toggleItemSelectState(ItemSelectState state) {
    if (itemSelectStateValue == state) {
      updateItemSelectState(ItemSelectState.none);
    } else {
      updateItemSelectState(state);
    }
  }

  void updateMultiDateItemToGone() {
    _multiDateItemState.add(
      multiDateItemState.value.map(
        gone: (gone) => gone,
        visible: (visible) => MultiDateItemState.gone(prevSelectedDays: visible.selectedDays),
      ),
    );
  }

  void updateMultiDateItemToVisible(BuiltList<TZDateTime> selectedDays) {
    _multiDateItemState.add(MultiDateItemStateVisible(selectedDays: selectedDays));
  }

  void updateNoteItemState(NoteItemState state) {
    _noteItemState.add(state);
  }
}

mixin _UndoButtonStoreData {
  final CompositeSubscription _undoButtonCompositeSubscription = CompositeSubscription();

  final BehaviorSubject<UndoButtonState> _undoButtonState = BehaviorSubject.seeded(const UndoButtonState.gone());

  ValueStream<UndoButtonState> get undoButtonState => _undoButtonState;

  Timer? _undoButtonVisibleTimer;

  void _disposeUndoButton() {
    _undoButtonCompositeSubscription.clear();
    _undoButtonState.close();
    _undoButtonVisibleTimer?.cancel();
  }
}

mixin _UndoButtonStore on _UndoButtonStoreData {
  void _setupUndoButton() {
    _undoButtonState.listen((value) {
      if (value.isVisible) {
        _undoButtonVisibleTimer?.cancel();
        _undoButtonVisibleTimer = Timer(
          const Duration(seconds: 3),
          () => _undoButtonState.add(const UndoButtonState.gone()),
        );
      }
    }).addTo(_undoButtonCompositeSubscription);
  }

  void cacheNoteForUndo(String note) {
    _cacheForUndo(UndoCache.note(prevNote: note));
  }

  void cacheMultiDaysForUndo(BuiltList<TZDateTime> selectedDays) {
    _cacheForUndo(UndoCache.multiDates(prevSelectedDays: selectedDays));
  }

  void _cacheForUndo(UndoCache undoCache) {
    _undoButtonState.value.when(
      visible: (cacheStore) {
        cacheStore.push(undoCache);
        _undoButtonState.add(UndoButtonState.visible(cacheStore: cacheStore));
      },
      gone: () => _undoButtonState.add(
        UndoButtonState.visible(cacheStore: UndoCacheStore(undoCache)),
      ),
    );
  }

  void updateUndoButtonToGone() {
    _undoButtonState.add(const UndoButtonState.gone());
  }
}
