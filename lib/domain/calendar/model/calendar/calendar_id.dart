import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'calendar_id.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class CalendarId with _$CalendarId {
  const factory CalendarId({
    required final String value,
  }) = _CalendarId;

  static CalendarId constructor() => CalendarId(value: Uuid().v4());
}
