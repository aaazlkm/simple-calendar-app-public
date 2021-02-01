import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sembast/timestamp.dart';
import 'package:simple_calendar_app/infra/data/database/table/recurrence_rule_table.dart';
import 'package:simple_calendar_app/infra/data/database/table/reminder_table.dart';

part 'event_table.freezed.dart';

@freezed
abstract class EventTable implements _$EventTable {
  const factory EventTable({
    required final String id,
    required final String calendarId,
    required final String name,
    required final String note,
    required final int color,
    required final int isAllDay,
    required final Timestamp start,
    required final Timestamp end,
    required final String timeZoneId,
    required final BuiltList<ReminderTable> reminderTables,
    required final Timestamp createdAt,
    final RecurrenceRuleTable? recurrenceRuleTable,
  }) = _EventTable;

  const EventTable._();

  static const tableName = 'eventTable';

  static const columnNameId = 'id';
  static const columnNameCalendarId = 'calendarId';
  static const columnNameName = 'name';
  static const columnNameNote = 'note';
  static const columnNameColor = 'color';
  static const columnNameIsAllDay = 'isAllDay';
  static const columnNameStart = 'start';
  static const columnNameEnd = 'end';
  static const columnNameTimeZoneId = 'timeZoneId';
  static const columnNameReminderTables = 'reminderTables';
  static const columnNameCreatedAt = 'createdAt';
  static const columnNameRecurrenceRuleTables = 'recurrenceRuleTable';

  // freezedを使用する場合、パラメータありのfactoryを保つことができないため
  // ignore: prefer_constructors_over_static_methods
  static EventTable fromMap(Map<String, dynamic> map) => EventTable(
        id: map[columnNameId] as String,
        calendarId: map[columnNameCalendarId] as String,
        name: map[columnNameName] as String,
        note: map[columnNameNote] as String,
        color: map[columnNameColor] as int,
        isAllDay: map[columnNameIsAllDay] as int,
        start: map[columnNameStart] as Timestamp,
        end: map[columnNameEnd] as Timestamp,
        timeZoneId: map[columnNameTimeZoneId] as String,
        reminderTables: (map[columnNameReminderTables] as List).cast<Map<String, dynamic>>().map(ReminderTable.fromMap).toBuiltList(),
        createdAt: map[columnNameCreatedAt] as Timestamp,
        recurrenceRuleTable: map[columnNameRecurrenceRuleTables] != null ? RecurrenceRuleTable.fromMap(map[columnNameRecurrenceRuleTables] as Map<String, dynamic>) : null,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        columnNameId: id,
        columnNameCalendarId: calendarId,
        columnNameName: name,
        columnNameNote: note,
        columnNameColor: color,
        columnNameIsAllDay: isAllDay,
        columnNameStart: start,
        columnNameEnd: end,
        columnNameTimeZoneId: timeZoneId,
        columnNameReminderTables: reminderTables.map((e) => e.toMap()).toList(growable: false),
        columnNameCreatedAt: createdAt,
        columnNameRecurrenceRuleTables: recurrenceRuleTable?.toMap(),
      };
}
