import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sembast/timestamp.dart';

part 'event_history_table.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class EventHistoryTable implements _$EventHistoryTable {
  const factory EventHistoryTable({
    required final String id,
    required final String calendarId,
    required final String name,
    required final int color,
    required final Timestamp createdAt,
  }) = _EventHistoryTable;

  const EventHistoryTable._();

  static const tableName = 'eventHistoryTable';

  static const columnNameId = 'id';
  static const columnNameCalendarId = 'calendarId';
  static const columnNameName = 'name';
  static const columnNameColor = 'color';
  static const columnNameCreatedAt = 'createdAt';

  // freezedを使用する場合、パラメータありのfactoryを保つことができないため
  // ignore: prefer_constructors_over_static_methods
  static EventHistoryTable fromMap(Map<String, dynamic> map) => EventHistoryTable(
        id: map[columnNameId] as String,
        calendarId: map[columnNameCalendarId] as String,
        name: map[columnNameName] as String,
        color: map[columnNameColor] as int,
        createdAt: map[columnNameCreatedAt] as Timestamp,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        columnNameId: id,
        columnNameCalendarId: calendarId,
        columnNameName: name,
        columnNameColor: color,
        columnNameCreatedAt: createdAt,
      };
}
