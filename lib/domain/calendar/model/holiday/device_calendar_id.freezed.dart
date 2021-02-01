// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'device_calendar_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeviceCalendarIdTearOff {
  const _$DeviceCalendarIdTearOff();

  _DeviceCalendarId call({required String value}) {
    return _DeviceCalendarId(
      value: value,
    );
  }
}

/// @nodoc
const $DeviceCalendarId = _$DeviceCalendarIdTearOff();

/// @nodoc
mixin _$DeviceCalendarId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceCalendarIdCopyWith<DeviceCalendarId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCalendarIdCopyWith<$Res> {
  factory $DeviceCalendarIdCopyWith(
          DeviceCalendarId value, $Res Function(DeviceCalendarId) then) =
      _$DeviceCalendarIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$DeviceCalendarIdCopyWithImpl<$Res>
    implements $DeviceCalendarIdCopyWith<$Res> {
  _$DeviceCalendarIdCopyWithImpl(this._value, this._then);

  final DeviceCalendarId _value;
  // ignore: unused_field
  final $Res Function(DeviceCalendarId) _then;

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
abstract class _$DeviceCalendarIdCopyWith<$Res>
    implements $DeviceCalendarIdCopyWith<$Res> {
  factory _$DeviceCalendarIdCopyWith(
          _DeviceCalendarId value, $Res Function(_DeviceCalendarId) then) =
      __$DeviceCalendarIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$DeviceCalendarIdCopyWithImpl<$Res>
    extends _$DeviceCalendarIdCopyWithImpl<$Res>
    implements _$DeviceCalendarIdCopyWith<$Res> {
  __$DeviceCalendarIdCopyWithImpl(
      _DeviceCalendarId _value, $Res Function(_DeviceCalendarId) _then)
      : super(_value, (v) => _then(v as _DeviceCalendarId));

  @override
  _DeviceCalendarId get _value => super._value as _DeviceCalendarId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_DeviceCalendarId(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeviceCalendarId extends _DeviceCalendarId
    with DiagnosticableTreeMixin {
  const _$_DeviceCalendarId({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeviceCalendarId(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeviceCalendarId'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeviceCalendarId &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$DeviceCalendarIdCopyWith<_DeviceCalendarId> get copyWith =>
      __$DeviceCalendarIdCopyWithImpl<_DeviceCalendarId>(this, _$identity);
}

abstract class _DeviceCalendarId extends DeviceCalendarId {
  const factory _DeviceCalendarId({required String value}) =
      _$_DeviceCalendarId;
  const _DeviceCalendarId._() : super._();

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DeviceCalendarIdCopyWith<_DeviceCalendarId> get copyWith =>
      throw _privateConstructorUsedError;
}
