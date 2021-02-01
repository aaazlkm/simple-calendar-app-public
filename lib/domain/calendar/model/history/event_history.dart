import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history_id.dart';

part 'event_history.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class EventHistory implements _$EventHistory {
  const factory EventHistory({
    required final EventHistoryId id,
    required final CalendarId calendarId,
    required final String name,
    required final Color color,
    required final DateTime createdAt,
  }) = _EventHistory;

  const EventHistory._();

  static EventHistory constructor({
    required final CalendarId calendarId,
    required final String name,
    required final Color color,
  }) =>
      EventHistory(
        id: EventHistoryId.constructor(),
        calendarId: calendarId,
        name: name,
        color: color,
        createdAt: DateTime.now(),
      );

  static EventHistory fromEvent(Event event) => EventHistory.constructor(
        calendarId: event.calendarId,
        name: event.name,
        color: event.color,
      );
}
