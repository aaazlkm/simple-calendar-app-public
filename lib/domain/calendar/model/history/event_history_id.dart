import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'event_history_id.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class EventHistoryId with _$EventHistoryId {
  const factory EventHistoryId({
    required final String value,
  }) = _EventHistoryId;

  static EventHistoryId constructor() => EventHistoryId(value: Uuid().v4());
}
