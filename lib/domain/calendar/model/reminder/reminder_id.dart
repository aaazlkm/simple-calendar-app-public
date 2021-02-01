import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

part 'reminder_id.freezed.dart';

@freezed
abstract class ReminderId with _$ReminderId {
  const factory ReminderId({
    required final String value,
  }) = _ReminderId;

  static ReminderId constructor() => ReminderId(value: Uuid().v4());
}
