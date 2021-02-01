// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'backup_file_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BackupFileIdTearOff {
  const _$BackupFileIdTearOff();

  _BackupFileId call({required String value}) {
    return _BackupFileId(
      value: value,
    );
  }
}

/// @nodoc
const $BackupFileId = _$BackupFileIdTearOff();

/// @nodoc
mixin _$BackupFileId {
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BackupFileIdCopyWith<BackupFileId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupFileIdCopyWith<$Res> {
  factory $BackupFileIdCopyWith(
          BackupFileId value, $Res Function(BackupFileId) then) =
      _$BackupFileIdCopyWithImpl<$Res>;
  $Res call({String value});
}

/// @nodoc
class _$BackupFileIdCopyWithImpl<$Res> implements $BackupFileIdCopyWith<$Res> {
  _$BackupFileIdCopyWithImpl(this._value, this._then);

  final BackupFileId _value;
  // ignore: unused_field
  final $Res Function(BackupFileId) _then;

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
abstract class _$BackupFileIdCopyWith<$Res>
    implements $BackupFileIdCopyWith<$Res> {
  factory _$BackupFileIdCopyWith(
          _BackupFileId value, $Res Function(_BackupFileId) then) =
      __$BackupFileIdCopyWithImpl<$Res>;
  @override
  $Res call({String value});
}

/// @nodoc
class __$BackupFileIdCopyWithImpl<$Res> extends _$BackupFileIdCopyWithImpl<$Res>
    implements _$BackupFileIdCopyWith<$Res> {
  __$BackupFileIdCopyWithImpl(
      _BackupFileId _value, $Res Function(_BackupFileId) _then)
      : super(_value, (v) => _then(v as _BackupFileId));

  @override
  _BackupFileId get _value => super._value as _BackupFileId;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_BackupFileId(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BackupFileId extends _BackupFileId {
  const _$_BackupFileId({required this.value}) : super._();

  @override
  final String value;

  @override
  String toString() {
    return 'BackupFileId(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BackupFileId &&
            (identical(other.value, value) ||
                const DeepCollectionEquality().equals(other.value, value)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(value);

  @JsonKey(ignore: true)
  @override
  _$BackupFileIdCopyWith<_BackupFileId> get copyWith =>
      __$BackupFileIdCopyWithImpl<_BackupFileId>(this, _$identity);
}

abstract class _BackupFileId extends BackupFileId {
  const factory _BackupFileId({required String value}) = _$_BackupFileId;
  const _BackupFileId._() : super._();

  @override
  String get value => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BackupFileIdCopyWith<_BackupFileId> get copyWith =>
      throw _privateConstructorUsedError;
}
