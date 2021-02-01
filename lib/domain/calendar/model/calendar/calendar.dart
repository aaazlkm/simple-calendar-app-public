import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/domain/calendar/model/recurrencerule/recurrence_rule.dart';
import 'package:simple_calendar_app/domain/calendar/model/reminder/reminder.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

part 'calendar.freezed.dart';

@freezed
abstract class Calendar implements _$Calendar {
  const factory Calendar({
    required final CalendarId id,
    required final String name,
  }) = _Calendar;

  const Calendar._();

  static Calendar constructor({
    required final String name,
  }) =>
      Calendar(
        id: CalendarId.constructor(),
        name: name,
      );

  Event createEvent({
    required final String name,
    required final String note,
    required final Color color,
    required final EventDate eventDate,
    BuiltList<Reminder>? reminders,
    RecurrenceRule? recurrenceRule,
  }) =>
      Event.constructor(
        calendarId: id,
        name: name,
        note: note,
        color: color,
        eventDate: eventDate,
        reminders: reminders,
        recurrenceRule: recurrenceRule,
      );
}
