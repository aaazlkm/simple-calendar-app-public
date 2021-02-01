// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'reminder_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReminderIdTearOff {
  const _$ReminderIdTearOff();

  _ReminderId call({required String value}) {
    return _ReminderId(
      value: value,
    );
  }
}

/// @nodoc
const $ReminderId = _$ReminderIdTearOff();

/// @nodoc
mixin _$ReminderId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderIdCopyWith<ReminderId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderIdCopyWith<$Res> {
  factory $ReminderIdCopyWith(
          ReminderId value, $Res Function(ReminderId) then) =
      _$ReminderIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$ReminderIdCopyWithImpl<$Res> implements $ReminderIdCopyWith<$Res> {
  _$ReminderIdCopyWithImpl(this._value, this._then);

  final ReminderId _value;
  // ignore: unused_field
  final $Res Function(ReminderId) _then;

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
abstract class _$ReminderIdCopyWith<$Res> implements $ReminderIdCopyWith<$Res> {
  factory _$ReminderIdCopyWith(
          _ReminderId value, $Res Function(_ReminderId) then) =
      __$ReminderIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$ReminderIdCopyWithImpl<$Res> extends _$ReminderIdCopyWithImpl<$Res>
    implements _$ReminderIdCopyWith<$Res> {
  __$ReminderIdCopyWithImpl(
      _ReminderId _value, $Res Function(_ReminderId) _then)
      : super(_value, (v) => _then(v as _ReminderId));

  @override
  _ReminderId get _value => super._value as _ReminderId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_ReminderId(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReminderId with DiagnosticableTreeMixin implements _ReminderId {
  const _$_ReminderId({required this.value});

  @override
  final String value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReminderId(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReminderId'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReminderId &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$ReminderIdCopyWith<_ReminderId> get copyWith =>
      __$ReminderIdCopyWithImpl<_ReminderId>(this, _$identity);
}

abstract class _ReminderId implements ReminderId {
  const factory _ReminderId({required String value}) = _$_ReminderId;

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReminderIdCopyWith<_ReminderId> get copyWith =>
      throw _privateConstructorUsedError;
}
