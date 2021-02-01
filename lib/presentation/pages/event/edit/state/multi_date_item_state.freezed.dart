// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'multi_date_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MultiDateItemStateTearOff {
  const _$MultiDateItemStateTearOff();

  MultiDateItemStateGone gone({BuiltList<TZDateTime>? prevSelectedDays}) {
    return MultiDateItemStateGone(
      prevSelectedDays: prevSelectedDays,
    );
  }

  MultiDateItemStateVisible visible(
      {required BuiltList<TZDateTime> selectedDays}) {
    return MultiDateItemStateVisible(
      selectedDays: selectedDays,
    );
  }
}

/// @nodoc
const $MultiDateItemState = _$MultiDateItemStateTearOff();

/// @nodoc
mixin _$MultiDateItemState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuiltList<TZDateTime>? prevSelectedDays) gone,
    required TResult Function(BuiltList<TZDateTime> selectedDays) visible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuiltList<TZDateTime>? prevSelectedDays)? gone,
    TResult Function(BuiltList<TZDateTime> selectedDays)? visible,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MultiDateItemStateGone value) gone,
    required TResult Function(MultiDateItemStateVisible value) visible,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiDateItemStateGone value)? gone,
    TResult Function(MultiDateItemStateVisible value)? visible,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiDateItemStateCopyWith<$Res> {
  factory $MultiDateItemStateCopyWith(
          MultiDateItemState value, $Res Function(MultiDateItemState) then) =
      _$MultiDateItemStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$MultiDateItemStateCopyWithImpl<$Res>
    implements $MultiDateItemStateCopyWith<$Res> {
  _$MultiDateItemStateCopyWithImpl(this._value, this._then);

  final MultiDateItemState _value;
  // ignore: unused_field
  final $Res Function(MultiDateItemState) _then;
}

/// @nodoc
abstract class $MultiDateItemStateGoneCopyWith<$Res> {
  factory $MultiDateItemStateGoneCopyWith(MultiDateItemStateGone value,
          $Res Function(MultiDateItemStateGone) then) =
      _$MultiDateItemStateGoneCopyWithImpl<$Res>;
  $Res call({BuiltList<TZDateTime>? prevSelectedDays});
}

/// @nodoc
class _$MultiDateItemStateGoneCopyWithImpl<$Res>
    extends _$MultiDateItemStateCopyWithImpl<$Res>
    implements $MultiDateItemStateGoneCopyWith<$Res> {
  _$MultiDateItemStateGoneCopyWithImpl(MultiDateItemStateGone _value,
      $Res Function(MultiDateItemStateGone) _then)
      : super(_value, (v) => _then(v as MultiDateItemStateGone));

  @override
  MultiDateItemStateGone get _value => super._value as MultiDateItemStateGone;

  @override
  $Res call({
    Object? prevSelectedDays = freezed,
  }) {
    return _then(MultiDateItemStateGone(
      prevSelectedDays: prevSelectedDays == freezed
          ? _value.prevSelectedDays
          : prevSelectedDays // ignore: cast_nullable_to_non_nullable
              as BuiltList<TZDateTime>?,
    ));
  }
}

/// @nodoc

class _$MultiDateItemStateGone extends MultiDateItemStateGone {
  const _$MultiDateItemStateGone({this.prevSelectedDays}) : super._();

  @override

  /// アニメーション用に前回表示していた値を保持しておく
  final BuiltList<TZDateTime>? prevSelectedDays;

  @override
  String toString() {
    return 'MultiDateItemState.gone(prevSelectedDays: $prevSelectedDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MultiDateItemStateGone &&
            (identical(other.prevSelectedDays, prevSelectedDays) ||
                const DeepCollectionEquality()
                    .equals(other.prevSelectedDays, prevSelectedDays)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(prevSelectedDays);

  @JsonKey(ignore: true)
  @override
  $MultiDateItemStateGoneCopyWith<MultiDateItemStateGone> get copyWith =>
      _$MultiDateItemStateGoneCopyWithImpl<MultiDateItemStateGone>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuiltList<TZDateTime>? prevSelectedDays) gone,
    required TResult Function(BuiltList<TZDateTime> selectedDays) visible,
  }) {
    return gone(prevSelectedDays);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuiltList<TZDateTime>? prevSelectedDays)? gone,
    TResult Function(BuiltList<TZDateTime> selectedDays)? visible,
    required TResult orElse(),
  }) {
    if (gone != null) {
      return gone(prevSelectedDays);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MultiDateItemStateGone value) gone,
    required TResult Function(MultiDateItemStateVisible value) visible,
  }) {
    return gone(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiDateItemStateGone value)? gone,
    TResult Function(MultiDateItemStateVisible value)? visible,
    required TResult orElse(),
  }) {
    if (gone != null) {
      return gone(this);
    }
    return orElse();
  }
}

abstract class MultiDateItemStateGone extends MultiDateItemState {
  const factory MultiDateItemStateGone(
      {BuiltList<TZDateTime>? prevSelectedDays}) = _$MultiDateItemStateGone;
  const MultiDateItemStateGone._() : super._();

  /// アニメーション用に前回表示していた値を保持しておく
  BuiltList<TZDateTime>? get prevSelectedDays =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MultiDateItemStateGoneCopyWith<MultiDateItemStateGone> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MultiDateItemStateVisibleCopyWith<$Res> {
  factory $MultiDateItemStateVisibleCopyWith(MultiDateItemStateVisible value,
          $Res Function(MultiDateItemStateVisible) then) =
      _$MultiDateItemStateVisibleCopyWithImpl<$Res>;
  $Res call({BuiltList<TZDateTime> selectedDays});
}

/// @nodoc
class _$MultiDateItemStateVisibleCopyWithImpl<$Res>
    extends _$MultiDateItemStateCopyWithImpl<$Res>
    implements $MultiDateItemStateVisibleCopyWith<$Res> {
  _$MultiDateItemStateVisibleCopyWithImpl(MultiDateItemStateVisible _value,
      $Res Function(MultiDateItemStateVisible) _then)
      : super(_value, (v) => _then(v as MultiDateItemStateVisible));

  @override
  MultiDateItemStateVisible get _value =>
      super._value as MultiDateItemStateVisible;

  @override
  $Res call({
    Object? selectedDays = freezed,
  }) {
    return _then(MultiDateItemStateVisible(
      selectedDays: selectedDays == freezed
          ? _value.selectedDays
          : selectedDays // ignore: cast_nullable_to_non_nullable
              as BuiltList<TZDateTime>,
    ));
  }
}

/// @nodoc

class _$MultiDateItemStateVisible extends MultiDateItemStateVisible {
  const _$MultiDateItemStateVisible({required this.selectedDays}) : super._();

  @override
  final BuiltList<TZDateTime> selectedDays;

  @override
  String toString() {
    return 'MultiDateItemState.visible(selectedDays: $selectedDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is MultiDateItemStateVisible &&
            (identical(other.selectedDays, selectedDays) ||
                const DeepCollectionEquality()
                    .equals(other.selectedDays, selectedDays)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(selectedDays);

  @JsonKey(ignore: true)
  @override
  $MultiDateItemStateVisibleCopyWith<MultiDateItemStateVisible> get copyWith =>
      _$MultiDateItemStateVisibleCopyWithImpl<MultiDateItemStateVisible>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BuiltList<TZDateTime>? prevSelectedDays) gone,
    required TResult Function(BuiltList<TZDateTime> selectedDays) visible,
  }) {
    return visible(selectedDays);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BuiltList<TZDateTime>? prevSelectedDays)? gone,
    TResult Function(BuiltList<TZDateTime> selectedDays)? visible,
    required TResult orElse(),
  }) {
    if (visible != null) {
      return visible(selectedDays);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MultiDateItemStateGone value) gone,
    required TResult Function(MultiDateItemStateVisible value) visible,
  }) {
    return visible(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MultiDateItemStateGone value)? gone,
    TResult Function(MultiDateItemStateVisible value)? visible,
    required TResult orElse(),
  }) {
    if (visible != null) {
      return visible(this);
    }
    return orElse();
  }
}

abstract class MultiDateItemStateVisible extends MultiDateItemState {
  const factory MultiDateItemStateVisible(
          {required BuiltList<TZDateTime> selectedDays}) =
      _$MultiDateItemStateVisible;
  const MultiDateItemStateVisible._() : super._();

  BuiltList<TZDateTime> get selectedDays => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MultiDateItemStateVisibleCopyWith<MultiDateItemStateVisible> get copyWith =>
      throw _privateConstructorUsedError;
}
