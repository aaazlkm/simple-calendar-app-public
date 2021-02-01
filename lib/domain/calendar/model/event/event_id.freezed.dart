// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventIdTearOff {
  const _$EventIdTearOff();

  _EventId call({required String value}) {
    return _EventId(
      value: value,
    );
  }
}

/// @nodoc
const $EventId = _$EventIdTearOff();

/// @nodoc
mixin _$EventId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventIdCopyWith<EventId> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventIdCopyWith<$Res> {
  factory $EventIdCopyWith(EventId value, $Res Function(EventId) then) =
      _$EventIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$EventIdCopyWithImpl<$Res> implements $EventIdCopyWith<$Res> {
  _$EventIdCopyWithImpl(this._value, this._then);

  final EventId _value;
  // ignore: unused_field
  final $Res Function(EventId) _then;

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
abstract class _$EventIdCopyWith<$Res> implements $EventIdCopyWith<$Res> {
  factory _$EventIdCopyWith(_EventId value, $Res Function(_EventId) then) =
      __$EventIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$EventIdCopyWithImpl<$Res> extends _$EventIdCopyWithImpl<$Res>
    implements _$EventIdCopyWith<$Res> {
  __$EventIdCopyWithImpl(_EventId _value, $Res Function(_EventId) _then)
      : super(_value, (v) => _then(v as _EventId));

  @override
  _EventId get _value => super._value as _EventId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_EventId(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EventId with DiagnosticableTreeMixin implements _EventId {
  const _$_EventId({required this.value});

  @override
  final String value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventId(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventId'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventId &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$EventIdCopyWith<_EventId> get copyWith =>
      __$EventIdCopyWithImpl<_EventId>(this, _$identity);
}

abstract class _EventId implements EventId {
  const factory _EventId({required String value}) = _$_EventId;

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventIdCopyWith<_EventId> get copyWith =>
      throw _privateConstructorUsedError;
}
