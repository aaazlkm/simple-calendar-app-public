import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:sembast/timestamp.dart';
import 'package:simple_calendar_app/core/ex/location_database_ex.dart';
import 'package:simple_calendar_app/domain/calendar/model/calendar/calendar_id.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_date.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event_id.dart';
import 'package:simple_calendar_app/infra/data/database/mapper/recurrence_rule_mapper.dart';
import 'package:simple_calendar_app/infra/data/database/mapper/reminder_mapper.dart';
import 'package:simple_calendar_app/infra/data/database/table/event_table.dart';
import 'package:timezone/timezone.dart' as tz;

class EventMapper {
  static Event fromTable(EventTable table) => Event(
        id: EventId(value: table.id),
        calendarId: CalendarId(value: table.calendarId),
        name: table.name,
        note: table.note,
        color: Color(table.color),
        eventDate: EventDate(
          isAllDay: _fromTableIsAllDay(isAllDay: table.isAllDay),
          start: tz.TZDateTime.from(table.start.toDateTime(), tz.timeZoneDatabase.getLocationOrNull(table.timeZoneId) ?? tz.UTC),
          end: tz.TZDateTime.from(table.end.toDateTime(), tz.timeZoneDatabase.getLocationOrNull(table.timeZoneId) ?? tz.UTC),
        ),
        reminders: table.reminderTables.map(ReminderMapper.fromTable).toBuiltList(),
        recurrenceRule: table.recurrenceRuleTable != null ? RecurrenceRuleMapper.fromTable(table.recurrenceRuleTable!) : null,
        createdAt: table.createdAt.toDateTime(),
      );

  static EventTable toTable(Event event) => EventTable(
        id: event.id.value,
        calendarId: event.calendarId.value,
        name: event.name,
        note: event.note,
        color: event.color.value,
        isAllDay: _toTableIsAllDay(isAllDay: event.eventDate.isAllDay),
        start: Timestamp.fromDateTime(event.eventDate.start),
        end: Timestamp.fromDateTime(event.eventDate.end),
        timeZoneId: event.eventDate.start.location.name,
        // or event.eventDate.end.location.name
        reminderTables: event.reminders.map(ReminderMapper.toTable).toBuiltList(),
        recurrenceRuleTable: event.recurrenceRule != null ? RecurrenceRuleMapper.toTable(event.recurrenceRule!) : null,
        createdAt: Timestamp.fromDateTime(event.createdAt),
      );

  //region convert allDay
  static bool _fromTableIsAllDay({required int isAllDay}) => isAllDay == 1;

  static int _toTableIsAllDay({required bool isAllDay}) => isAllDay ? 1 : 0;
//endregion
}
