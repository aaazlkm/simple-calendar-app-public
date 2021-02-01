// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'calendar_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarIdTearOff {
  const _$CalendarIdTearOff();

  _CalendarId call({required String value}) {
    return _CalendarId(
      value: value,
    );
  }
}

/// @nodoc
const $CalendarId = _$CalendarIdTearOff();

/// @nodoc
mixin _$CalendarId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarIdCopyWith<CalendarId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarIdCopyWith<$Res> {
  factory $CalendarIdCopyWith(
          CalendarId value, $Res Function(CalendarId) then) =
      _$CalendarIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$CalendarIdCopyWithImpl<$Res> implements $CalendarIdCopyWith<$Res> {
  _$CalendarIdCopyWithImpl(this._value, this._then);

  final CalendarId _value;
  // ignore: unused_field
  final $Res Function(CalendarId) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CalendarIdCopyWith<$Res> implements $CalendarIdCopyWith<$Res> {
  factory _$CalendarIdCopyWith(
          _CalendarId value, $Res Function(_CalendarId) then) =
      __$CalendarIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$CalendarIdCopyWithImpl<$Res> extends _$CalendarIdCopyWithImpl<$Res>
    implements _$CalendarIdCopyWith<$Res> {
  __$CalendarIdCopyWithImpl(
      _CalendarId _value, $Res Function(_CalendarId) _then)
      : super(_value, (v) => _then(v as _CalendarId));

  @override
  _CalendarId get _value => super._value as _CalendarId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_CalendarId(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CalendarId implements _CalendarId {
  const _$_CalendarId({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'CalendarId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarId &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$CalendarIdCopyWith<_CalendarId> get copyWith =>
      __$CalendarIdCopyWithImpl<_CalendarId>(this, _$identity);
}

abstract class _CalendarId implements CalendarId {
  const factory _CalendarId({required String value}) = _$_CalendarId;

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CalendarIdCopyWith<_CalendarId> get copyWith =>
      throw _privateConstructorUsedError;
}
