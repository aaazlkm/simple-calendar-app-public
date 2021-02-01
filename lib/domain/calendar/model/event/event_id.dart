import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

part 'event_id.freezed.dart';

@freezed
abstract class EventId with _$EventId {
  const factory EventId({
    required final String value,
  }) = _EventId;

  static EventId constructor() => EventId(value: Uuid().v4());
}
