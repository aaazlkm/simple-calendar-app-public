import 'package:built_collection/built_collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:timezone/timezone.dart';

part 'undo_cache.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class UndoCache with _$UndoCache {
  const factory UndoCache.note({
    required String prevNote,
  }) = UndoCacheNote;

  const factory UndoCache.multiDates({
    required BuiltList<TZDateTime> prevSelectedDays,
  }) = UndoCacheMultiDates;

  const UndoCache._();
}
