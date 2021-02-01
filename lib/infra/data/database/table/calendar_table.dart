import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_table.freezed.dart';

@freezed
abstract class CalendarTable implements _$CalendarTable {
  const factory CalendarTable({
    required final String id,
    required final String name,
  }) = _CalendarTable;

  const CalendarTable._();

  static const tableName = 'calendarTable';

  static const columnNameId = 'id';
  static const columnNameName = 'name';

  // freezedを使用する場合、パラメータありのfactoryを保つことができないため
  // ignore: prefer_constructors_over_static_methods
  static CalendarTable fromMap(Map<String, dynamic> map) => CalendarTable(
        id: map[columnNameId] as String,
        name: map[columnNameName] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        columnNameId: id,
        columnNameName: name,
      };
}
