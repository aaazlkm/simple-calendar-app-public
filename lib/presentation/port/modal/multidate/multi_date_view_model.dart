import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/core/constant.dart';
import 'package:simple_calendar_app/core/ex/tz_date_time_ex.dart';
import 'package:simple_calendar_app/core/logger.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/day_of_week.dart';
import 'package:simple_calendar_app/domain/setting/usecase/setting_usecase.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/model/selected_state.dart';
import 'package:simple_calendar_app/presentation/port/modal/multidate/trade/multi_date_argument.dart';

class MultiDateViewModel with _CalendarState {
  MultiDateViewModel(this._settingUseCase);

  static MultiDateViewModel of(BuildContext context) => context.read<MultiDateViewModel>();

  final SettingUseCase _settingUseCase;

  @override
  SettingUseCase get settingUseCase => _settingUseCase;

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  void setup(MultiDateArgument argument) {
    setupCalendar(argument);
  }

  void dispose() {
    _compositeSubscription.clear();
    disposeCalendar();
  }
}

mixin _CalendarState {
  SettingUseCase get settingUseCase;

  final BehaviorSubject<DateTime> _yearMonth = BehaviorSubject.seeded(DateTime.now());

  ValueStream<DateTime> get yearMonth => _yearMonth;

  final BehaviorSubject<DayOfWeek> _startDayOfWeek = BehaviorSubject.seeded(Constant.defaultStartDayOfWeek);

  ValueStream<DayOfWeek> get startDayOfWeek => _startDayOfWeek;

  /// setupCalendarで渡される
  final BehaviorSubject<SelectedState> _selectedState = BehaviorSubject();

  ValueStream<SelectedState> get selectedState => _selectedState;

  void setupCalendar(MultiDateArgument argument) {
    _selectedState.add(SelectedState(originEvent: argument.event, days: {...argument.initialDateTimes}.toBuiltList()));
    _yearMonth.add(argument.initialYearMonth);
    _fetchStartDayOfWeek();
  }

  void disposeCalendar() {
    _selectedState.close();
    _yearMonth.close();
    _startDayOfWeek.close();
  }

  void updateYearMonth(DateTime yearMonth) {
    _yearMonth.add(yearMonth);
  }

  void selectDay(DateTime day) {
    final selectedState = this.selectedState.value;
    final tzDay = selectedState.originEvent.eventDate.start.copyWith(year: day.year, month: day.month, day: day.day);
    if (selectedState.isDayOfOriginEvent(tzDay)) {
      /// origin eventの日付の場合は操作できないようにする
      return;
    }

    final hasDate = selectedState.hasDate(tzDay);
    if (hasDate) {
      _selectedState.add(selectedState.removeDay(tzDay));
    } else {
      _selectedState.add(selectedState.addDay(tzDay));
    }
  }

  Future<void> _fetchStartDayOfWeek() async {
    final result = await settingUseCase.getStartDayOfWeek();
    result.when(
      success: _startDayOfWeek.add,
      failure: logger.severe,
    );
  }
}
