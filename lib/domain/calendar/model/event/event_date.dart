import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nifu_flutter_kit/extensions/extensions.dart';
import 'package:simple_calendar_app/core/ex/date_time_ex.dart' as simple_calendar_app;
import 'package:timezone/timezone.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

part 'event_date.freezed.dart';

@freezed
abstract class EventDate implements _$EventDate {
  const factory EventDate({
    required final bool isAllDay,
    required final TZDateTime start,
    required final TZDateTime end,
  }) = _EventDate;

  const EventDate._();

  static EventDate day({required DateTime dateTime, bool isAllDay = true}) => EventDate(
        isAllDay: isAllDay,
        start: TZDateTime(local, dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, dateTime.second, dateTime.millisecond, dateTime.microsecond),
        end: TZDateTime(local, dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, dateTime.second, dateTime.millisecond, dateTime.microsecond),
      );

  static EventDate range({required DateTime start, required DateTime end, bool isAllDay = true}) => EventDate(
        isAllDay: isAllDay,
        start: TZDateTime(local, start.year, start.month, start.day, start.hour, start.minute, start.second, start.millisecond, start.microsecond),
        end: TZDateTime(local, end.year, end.month, end.day, end.hour, end.minute, end.second, end.millisecond, end.microsecond),
      );

  int get diffInMilliseconds => (end.millisecondsSinceEpoch - start.millisecondsSinceEpoch).abs();

  int get diffInDays => start.startDayTime.difference(end.startDayTime).inDays.abs();

  bool get isDay => start.isSameDay(end);

  bool get isRange => !isDay;

  bool isIn(DateTime dateTime) => start.startDayTime.millisecondsSinceEpoch <= dateTime.millisecondsSinceEpoch && dateTime.millisecondsSinceEpoch < end.tomorrowStartDayTime.millisecondsSinceEpoch;

  /// 命名が微妙な気がするのでいいのが思いつたら修正する
  DateTime get startInLocal => simple_calendar_app.DateTimeEx.from(start);

  /// 命名が微妙な気がするのでいいのが思いつたら修正する
  DateTime get endInLocal => simple_calendar_app.DateTimeEx.from(end);

  /// todo 動作確認
  EventDate moveStartDate(TZDateTime newStartDate) {
    final duration = start.difference(newStartDate);
    final newEndDate = end.add(duration);
    return copyWith(start: newStartDate, end: newEndDate);
  }
}
