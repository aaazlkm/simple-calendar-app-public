import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'year_month_picker_state.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
abstract class YearMonthPickerState with _$YearMonthPickerState {
  const factory YearMonthPickerState({
    required final DateTime year,
    required final bool visible,
  }) = _YearMonthPickerState;
}
