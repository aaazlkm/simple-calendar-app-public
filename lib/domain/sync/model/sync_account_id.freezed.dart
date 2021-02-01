// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sync_account_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SyncAccountIdTearOff {
  const _$SyncAccountIdTearOff();

  _SyncAccountId call({required String value}) {
    return _SyncAccountId(
      value: value,
    );
  }
}

/// @nodoc
const $SyncAccountId = _$SyncAccountIdTearOff();

/// @nodoc
mixin _$SyncAccountId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SyncAccountIdCopyWith<SyncAccountId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncAccountIdCopyWith<$Res> {
  factory $SyncAccountIdCopyWith(
          SyncAccountId value, $Res Function(SyncAccountId) then) =
      _$SyncAccountIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$SyncAccountIdCopyWithImpl<$Res>
    implements $SyncAccountIdCopyWith<$Res> {
  _$SyncAccountIdCopyWithImpl(this._value, this._then);

  final SyncAccountId _value;
  // ignore: unused_field
  final $Res Function(SyncAccountId) _then;

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
abstract class _$SyncAccountIdCopyWith<$Res>
    implements $SyncAccountIdCopyWith<$Res> {
  factory _$SyncAccountIdCopyWith(
          _SyncAccountId value, $Res Function(_SyncAccountId) then) =
      __$SyncAccountIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$SyncAccountIdCopyWithImpl<$Res>
    extends _$SyncAccountIdCopyWithImpl<$Res>
    implements _$SyncAccountIdCopyWith<$Res> {
  __$SyncAccountIdCopyWithImpl(
      _SyncAccountId _value, $Res Function(_SyncAccountId) _then)
      : super(_value, (v) => _then(v as _SyncAccountId));

  @override
  _SyncAccountId get _value => super._value as _SyncAccountId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_SyncAccountId(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SyncAccountId extends _SyncAccountId {
  const _$_SyncAccountId({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'SyncAccountId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SyncAccountId &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$SyncAccountIdCopyWith<_SyncAccountId> get copyWith =>
      __$SyncAccountIdCopyWithImpl<_SyncAccountId>(this, _$identity);
}

abstract class _SyncAccountId extends SyncAccountId {
  const factory _SyncAccountId({required String value}) = _$_SyncAccountId;
  const _SyncAccountId._() : super._();

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SyncAccountIdCopyWith<_SyncAccountId> get copyWith =>
      throw _privateConstructorUsedError;
}
