import 'dart:ui';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/date_range.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/recurrencerule/recurrence_rule.dart';
import 'package:simple_calendar_app/domain/calendar/model/reminder/reminder.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

part 'event.freezed.dart';

@freezed
abstract class Event implements _$Event {
  const factory Event({
    required final EventId id,
    required final CalendarId calendarId,
    required final String name,
    required final String note,
    required final Color color,
    required final EventDate eventDate,
    required final BuiltList<Reminder> reminders,
    required final DateTime createdAt,
    final RecurrenceRule? recurrenceRule,
  }) = _Event;

  const Event._();

  static Event constructor({
    required final CalendarId calendarId,
    required final String name,
    required final String note,
    required final Color color,
    required final EventDate eventDate,
    BuiltList<Reminder>? reminders,
    RecurrenceRule? recurrenceRule,
  }) =>
      Event(
        id: EventId.constructor(),
        calendarId: calendarId,
        name: name,
        note: note,
        color: color,
        eventDate: eventDate,
        reminders: reminders ?? BuiltList.of([]),
        recurrenceRule: recurrenceRule,
        createdAt: DateTime.now(),
      );

  BuiltList<Event> extractEvents({required DateRange range}) {
    if (recurrenceRule == null) {
      return [this].build();
    } else {
      /// RRuleで生成されたList<Date>のうち、dateRange内にあるものを抽出
      /// 抽出したList<Date>をEventに変換する
      final eventStartDates = recurrenceRule?.createEventStartDates(
            eventStart: eventDate.start,
            range: range,
          ) ??
          BuiltList.of([]);
      return eventStartDates
          .map(
            (dateTime) => copyWith(eventDate: eventDate.moveStartDate(dateTime)),
          )
          .toBuiltList();
    }
  }
}
