import 'package:flutter/cupertino.dart';
import 'package:sembast/timestamp.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history.dart';
import 'package:simple_calendar_app/domain/calendar/model/history/event_history_id.dart';
import 'package:simple_calendar_app/infra/data/database/table/event_history_table.dart';

class EventHistoryMapper {
  static EventHistory fromTable(EventHistoryTable table) => EventHistory(
        id: EventHistoryId(value: table.id),
        calendarId: CalendarId(value: table.calendarId),
        name: table.name,
        color: Color(table.color),
        createdAt: table.createdAt.toDateTime(),
      );

  static EventHistoryTable toTable(EventHistory eventHistory) => EventHistoryTable(
        id: eventHistory.id.value,
        calendarId: eventHistory.calendarId.value,
        name: eventHistory.name,
        color: eventHistory.color.value,
        createdAt: Timestamp.fromDateTime(eventHistory.createdAt),
      );
}
