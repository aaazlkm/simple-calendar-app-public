import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sembast/timestamp.dart';

part 'recurrence_rule_table.freezed.dart';

@freezed
abstract class RecurrenceRuleTable implements _$RecurrenceRuleTable {
  factory RecurrenceRuleTable({
    required final int recurrenceFrequency,
    required final int interval,

    /// when weekly
    final BuiltList<int>? dayOfWeeks,

    /// when monthly
    final BuiltList<int>? dayOfMonths,

    /// when yearly
    final BuiltList<int>? monthOfYears,

    /// 終了日
    /// [endDate]か[count]によって定まる
    /// どちらも存在しなければ、終了日はない
    final Timestamp? endDate,

    /// 終了日
    /// [endDate]か[count]によって定まる
    /// どちらも存在しなければ、終了日はない
    final int? count,
  }) = _RecurrenceRuleTable;

  const RecurrenceRuleTable._();

  static const columnNameRecurrenceFrequency = 'recurrenceFrequency';
  static const columnNameInterval = 'interval';
  static const columnNameDayOfWeeks = 'dayOfWeeks';
  static const columnNameDayOfMonths = 'dayOfMonths';
  static const columnNameMonthOfYears = 'monthOfYears';
  static const columnNameEndDate = 'endDate';
  static const columnNameCount = 'count';

  // freezedを使用する場合、パラメータありのfactoryを保つことができないため
  // ignore: prefer_constructors_over_static_methods
  static RecurrenceRuleTable fromMap(Map<String, dynamic> map) => RecurrenceRuleTable(
        recurrenceFrequency: map[columnNameRecurrenceFrequency] as int,
        interval: map[columnNameInterval] as int,
        dayOfWeeks: (map[columnNameDayOfWeeks] as List).cast<int>().build(),
        dayOfMonths: (map[columnNameDayOfMonths] as List).cast<int>().build(),
        monthOfYears: (map[columnNameMonthOfYears] as List).cast<int>().build(),
        endDate: map[columnNameEndDate] as Timestamp,
        count: map[columnNameCount] as int,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        columnNameRecurrenceFrequency: recurrenceFrequency,
        columnNameInterval: interval,
        columnNameDayOfWeeks: dayOfWeeks?.toList(),
        columnNameDayOfMonths: dayOfMonths?.toList(),
        columnNameMonthOfYears: monthOfYears?.toList(),
        columnNameEndDate: endDate,
        columnNameCount: count,
      };
}
