import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_table.freezed.dart';

@freezed
abstract class ReminderTable implements _$ReminderTable {
  factory ReminderTable({
    required final String id,
    required final int minutes,
  }) = _ReminderTable;

  const ReminderTable._();

  static const columnNameId = 'id';
  static const columnNameMinutes = 'minutes';

  // freezedを使用する場合、パラメータありのfactoryを保つことができないため
  // ignore: prefer_constructors_over_static_methods
  static ReminderTable fromMap(Map<String, dynamic> map) => ReminderTable(
        id: map[columnNameId] as String,
        minutes: map[columnNameMinutes] as int,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        columnNameId: id,
        columnNameMinutes: minutes,
      };
}
