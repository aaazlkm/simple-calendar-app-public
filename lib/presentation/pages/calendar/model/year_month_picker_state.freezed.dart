// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'year_month_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$YearMonthPickerStateTearOff {
  const _$YearMonthPickerStateTearOff();

  _YearMonthPickerState call({required DateTime year, required bool visible}) {
    return _YearMonthPickerState(
      year: year,
      visible: visible,
    );
  }
}

/// @nodoc
const $YearMonthPickerState = _$YearMonthPickerStateTearOff();

/// @nodoc
mixin _$YearMonthPickerState {
  DateTime get year => throw _privateConstructorUsedError;
  bool get visible => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $YearMonthPickerStateCopyWith<YearMonthPickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearMonthPickerStateCopyWith<$Res> {
  factory $YearMonthPickerStateCopyWith(YearMonthPickerState value,
          $Res Function(YearMonthPickerState) then) =
      _$YearMonthPickerStateCopyWithImpl<$Res>;
  $Res call({DateTime year, bool visible});
}

/// @nodoc
class _$YearMonthPickerStateCopyWithImpl<$Res>
    implements $YearMonthPickerStateCopyWith<$Res> {
  _$YearMonthPickerStateCopyWithImpl(this._value, this._then);

  final YearMonthPickerState _value;
  // ignore: unused_field
  final $Res Function(YearMonthPickerState) _then;

  @override
  $Res call({
    Object? year = freezed,
    Object? visible = freezed,
  }) {
    return _then(_value.copyWith(
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$YearMonthPickerStateCopyWith<$Res>
    implements $YearMonthPickerStateCopyWith<$Res> {
  factory _$YearMonthPickerStateCopyWith(_YearMonthPickerState value,
          $Res Function(_YearMonthPickerState) then) =
      __$YearMonthPickerStateCopyWithImpl<$Res>;
  @override
  $Res call({DateTime year, bool visible});
}

/// @nodoc
class __$YearMonthPickerStateCopyWithImpl<$Res>
    extends _$YearMonthPickerStateCopyWithImpl<$Res>
    implements _$YearMonthPickerStateCopyWith<$Res> {
  __$YearMonthPickerStateCopyWithImpl(
      _YearMonthPickerState _value, $Res Function(_YearMonthPickerState) _then)
      : super(_value, (v) => _then(v as _YearMonthPickerState));

  @override
  _YearMonthPickerState get _value => super._value as _YearMonthPickerState;

  @override
  $Res call({
    Object? year = freezed,
    Object? visible = freezed,
  }) {
    return _then(_YearMonthPickerState(
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as DateTime,
      visible: visible == freezed
          ? _value.visible
          : visible // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_YearMonthPickerState
    with DiagnosticableTreeMixin
    implements _YearMonthPickerState {
  const _$_YearMonthPickerState({required this.year, required this.visible});

  @override
  final DateTime year;
  @override
  final bool visible;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YearMonthPickerState(year: $year, visible: $visible)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'YearMonthPickerState'))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('visible', visible));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _YearMonthPickerState &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.visible, visible) ||
                const DeepCollectionEquality().equals(other.visible, visible)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(visible);

  @JsonKey(ignore: true)
  @override
  _$YearMonthPickerStateCopyWith<_YearMonthPickerState> get copyWith =>
      __$YearMonthPickerStateCopyWithImpl<_YearMonthPickerState>(
          this, _$identity);
}

abstract class _YearMonthPickerState implements YearMonthPickerState {
  const factory _YearMonthPickerState(
      {required DateTime year,
      required bool visible}) = _$_YearMonthPickerState;

  @override
  DateTime get year => throw _privateConstructorUsedError;
  @override
  bool get visible => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$YearMonthPickerStateCopyWith<_YearMonthPickerState> get copyWith =>
      throw _privateConstructorUsedError;
}
