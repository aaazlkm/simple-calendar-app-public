import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nifu_flutter_kit/extensions/extensions.dart';

part 'date_range.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class DateRange implements _$DateRange {
  const factory DateRange({
    required final DateTime start,
    required final DateTime end,
  }) = _DateRange;

  const DateRange._();

  static DateRange day({required DateTime day}) => DateRange(start: day, end: day);

  bool isIn(DateTime dateTime) => start.startDayTime.millisecondsSinceEpoch <= dateTime.millisecondsSinceEpoch && dateTime.millisecondsSinceEpoch < end.tomorrowStartDayTime.millisecondsSinceEpoch;
}
