// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'backup_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BackupFileTearOff {
  const _$BackupFileTearOff();

  _BackupFile call(
      {required BackupFileId id,
      required String name,
      required DateTime modifiedTime}) {
    return _BackupFile(
      id: id,
      name: name,
      modifiedTime: modifiedTime,
    );
  }
}

/// @nodoc
const $BackupFile = _$BackupFileTearOff();

/// @nodoc
mixin _$BackupFile {
  BackupFileId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get modifiedTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BackupFileCopyWith<BackupFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupFileCopyWith<$Res> {
  factory $BackupFileCopyWith(
          BackupFile value, $Res Function(BackupFile) then) =
      _$BackupFileCopyWithImpl<$Res>;
  $Res call({BackupFileId id, String name, DateTime modifiedTime});

  $BackupFileIdCopyWith<$Res> get id;
}

/// @nodoc
class _$BackupFileCopyWithImpl<$Res> implements $BackupFileCopyWith<$Res> {
  _$BackupFileCopyWithImpl(this._value, this._then);

  final BackupFile _value;
  // ignore: unused_field
  final $Res Function(BackupFile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? modifiedTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BackupFileId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedTime: modifiedTime == freezed
          ? _value.modifiedTime
          : modifiedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $BackupFileIdCopyWith<$Res> get id {
    return $BackupFileIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$BackupFileCopyWith<$Res> implements $BackupFileCopyWith<$Res> {
  factory _$BackupFileCopyWith(
          _BackupFile value, $Res Function(_BackupFile) then) =
      __$BackupFileCopyWithImpl<$Res>;
  @override
  $Res call({BackupFileId id, String name, DateTime modifiedTime});

  @override
  $BackupFileIdCopyWith<$Res> get id;
}

/// @nodoc
class __$BackupFileCopyWithImpl<$Res> extends _$BackupFileCopyWithImpl<$Res>
    implements _$BackupFileCopyWith<$Res> {
  __$BackupFileCopyWithImpl(
      _BackupFile _value, $Res Function(_BackupFile) _then)
      : super(_value, (v) => _then(v as _BackupFile));

  @override
  _BackupFile get _value => super._value as _BackupFile;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? modifiedTime = freezed,
  }) {
    return _then(_BackupFile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as BackupFileId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedTime: modifiedTime == freezed
          ? _value.modifiedTime
          : modifiedTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_BackupFile extends _BackupFile {
  const _$_BackupFile(
      {required this.id, required this.name, required this.modifiedTime})
      : super._();

  @override
  final BackupFileId id;
  @override
  final String name;
  @override
  final DateTime modifiedTime;

  @override
  String toString() {
    return 'BackupFile(id: $id, name: $name, modifiedTime: $modifiedTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BackupFile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.modifiedTime, modifiedTime) ||
                const DeepCollectionEquality()
                    .equals(other.modifiedTime, modifiedTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(modifiedTime);

  @JsonKey(ignore: true)
  @override
  _$BackupFileCopyWith<_BackupFile> get copyWith =>
      __$BackupFileCopyWithImpl<_BackupFile>(this, _$identity);
}

abstract class _BackupFile extends BackupFile {
  const factory _BackupFile(
      {required BackupFileId id,
      required String name,
      required DateTime modifiedTime}) = _$_BackupFile;
  const _BackupFile._() : super._();

  @override
  BackupFileId get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  DateTime get modifiedTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BackupFileCopyWith<_BackupFile> get copyWith =>
      throw _privateConstructorUsedError;
}
