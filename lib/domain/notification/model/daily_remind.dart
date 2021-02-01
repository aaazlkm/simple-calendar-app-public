import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/calendar/model/event/event.dart';
import 'package:simple_calendar_app/domain/notification/model/daily_remind_id.dart';
import 'package:timezone/timezone.dart';

part 'daily_remind.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class DailyRemind with _$DailyRemind {
  factory DailyRemind({
    required final TZDateTime scheduledDate,
    required final BuiltList<Event> events,
  }) = _DailyRemind;

  DailyRemind._();

  /// notificationのIDとして使用する
  late final DailyRemindId id = DailyRemindId.from(scheduledDate);
}
