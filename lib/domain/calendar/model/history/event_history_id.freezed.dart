// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_history_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventHistoryIdTearOff {
  const _$EventHistoryIdTearOff();

  _EventHistoryId call({required String value}) {
    return _EventHistoryId(
      value: value,
    );
  }
}

/// @nodoc
const $EventHistoryId = _$EventHistoryIdTearOff();

/// @nodoc
mixin _$EventHistoryId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventHistoryIdCopyWith<EventHistoryId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventHistoryIdCopyWith<$Res> {
  factory $EventHistoryIdCopyWith(
          EventHistoryId value, $Res Function(EventHistoryId) then) =
      _$EventHistoryIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$EventHistoryIdCopyWithImpl<$Res>
    implements $EventHistoryIdCopyWith<$Res> {
  _$EventHistoryIdCopyWithImpl(this._value, this._then);

  final EventHistoryId _value;
  // ignore: unused_field
  final $Res Function(EventHistoryId) _then;

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
abstract class _$EventHistoryIdCopyWith<$Res>
    implements $EventHistoryIdCopyWith<$Res> {
  factory _$EventHistoryIdCopyWith(
          _EventHistoryId value, $Res Function(_EventHistoryId) then) =
      __$EventHistoryIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$EventHistoryIdCopyWithImpl<$Res>
    extends _$EventHistoryIdCopyWithImpl<$Res>
    implements _$EventHistoryIdCopyWith<$Res> {
  __$EventHistoryIdCopyWithImpl(
      _EventHistoryId _value, $Res Function(_EventHistoryId) _then)
      : super(_value, (v) => _then(v as _EventHistoryId));

  @override
  _EventHistoryId get _value => super._value as _EventHistoryId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_EventHistoryId(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EventHistoryId
    with DiagnosticableTreeMixin
    implements _EventHistoryId {
  const _$_EventHistoryId({required this.value});

  @override
  final String value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventHistoryId(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventHistoryId'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventHistoryId &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$EventHistoryIdCopyWith<_EventHistoryId> get copyWith =>
      __$EventHistoryIdCopyWithImpl<_EventHistoryId>(this, _$identity);
}

abstract class _EventHistoryId implements EventHistoryId {
  const factory _EventHistoryId({required String value}) = _$_EventHistoryId;

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventHistoryIdCopyWith<_EventHistoryId> get copyWith =>
      throw _privateConstructorUsedError;
}
