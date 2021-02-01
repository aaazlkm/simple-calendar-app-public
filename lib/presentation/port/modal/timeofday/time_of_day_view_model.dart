import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_time.dart';

class TimeOfDayViewModel {
  TimeOfDayViewModel();

  static TimeOfDayViewModel of(BuildContext context) => context.read<TimeOfDayViewModel>();

  final CompositeSubscription _compositeSubscription = CompositeSubscription();

  static BuiltList<DailyRemindTime> timeOfDays = BuiltList.of(
    [
      DailyRemindTime.theDay(const TimeOfDay(hour: 5, minute: 0)),
      DailyRemindTime.theDay(const TimeOfDay(hour: 6, minute: 0)),
      DailyRemindTime.theDay(const TimeOfDay(hour: 7, minute: 0)),
      DailyRemindTime.theDay(const TimeOfDay(hour: 8, minute: 0)),
      DailyRemindTime.theDay(const TimeOfDay(hour: 9, minute: 0)),
      DailyRemindTime.theDay(const TimeOfDay(hour: 10, minute: 0)),
      DailyRemindTime.theDay(const TimeOfDay(hour: 11, minute: 0)),
    ],
  );

  final BehaviorSubject<DailyRemindTime?> _selectedDailyRemindTime = BehaviorSubject();

  ValueStream<DailyRemindTime?> get selectedDailyRemindTime => _selectedDailyRemindTime;

  void setup(DailyRemindTime? selectedDailyRemindTime) {
    _selectedDailyRemindTime.add(selectedDailyRemindTime);
  }

  void dispose() {
    _compositeSubscription.clear();
    _selectedDailyRemindTime.close();
  }
}
