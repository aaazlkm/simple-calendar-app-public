import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

extension DayOfWeekEx on DayOfWeek {
  static DayOfWeek from({required DateTime dateTime}) {
    switch (dateTime.weekday) {
      case DateTime.monday:
        return DayOfWeek.monday;
      case DateTime.tuesday:
        return DayOfWeek.tuesday;
      case DateTime.wednesday:
        return DayOfWeek.wednesday;
      case DateTime.thursday:
        return DayOfWeek.thursday;
      case DateTime.friday:
        return DayOfWeek.friday;
      case DateTime.saturday:
        return DayOfWeek.saturday;
      case DateTime.sunday:
        return DayOfWeek.sunday;
    }
    throw AssertionError('unknown this type: ${dateTime.weekday}');
  }

  BuiltList<DayOfWeek> get dayOfWeeksStartThis {
    final index = DayOfWeek.values.indexOf(this);
    return DayOfWeek.values.sublist(index).build() + DayOfWeek.values.sublist(0, index).build();
  }

  int calculateOffset({required DayOfWeek to}) => dayOfWeeksStartThis.indexOf(to);
}
