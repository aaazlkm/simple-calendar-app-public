// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'backup_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BackupMediaTearOff {
  const _$BackupMediaTearOff();

  _BackupMedia call(
      {required Stream<List<int>> stream,
      required String contentType,
      int? length}) {
    return _BackupMedia(
      stream: stream,
      contentType: contentType,
      length: length,
    );
  }
}

/// @nodoc
const $BackupMedia = _$BackupMediaTearOff();

/// @nodoc
mixin _$BackupMedia {
  Stream<List<int>> get stream => throw _privateConstructorUsedError;
  String get contentType => throw _privateConstructorUsedError;
  int? get length => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BackupMediaCopyWith<BackupMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackupMediaCopyWith<$Res> {
  factory $BackupMediaCopyWith(
          BackupMedia value, $Res Function(BackupMedia) then) =
      _$BackupMediaCopyWithImpl<$Res>;
  $Res call({Stream<List<int>> stream, String contentType, int? length});
}

/// @nodoc
class _$BackupMediaCopyWithImpl<$Res> implements $BackupMediaCopyWith<$Res> {
  _$BackupMediaCopyWithImpl(this._value, this._then);

  final BackupMedia _value;
  // ignore: unused_field
  final $Res Function(BackupMedia) _then;

  @override
  $Res call({
    Object? stream = freezed,
    Object? contentType = freezed,
    Object? length = freezed,
  }) {
    return _then(_value.copyWith(
      stream: stream == freezed
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<List<int>>,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$BackupMediaCopyWith<$Res>
    implements $BackupMediaCopyWith<$Res> {
  factory _$BackupMediaCopyWith(
          _BackupMedia value, $Res Function(_BackupMedia) then) =
      __$BackupMediaCopyWithImpl<$Res>;
  @override
  $Res call({Stream<List<int>> stream, String contentType, int? length});
}

/// @nodoc
class __$BackupMediaCopyWithImpl<$Res> extends _$BackupMediaCopyWithImpl<$Res>
    implements _$BackupMediaCopyWith<$Res> {
  __$BackupMediaCopyWithImpl(
      _BackupMedia _value, $Res Function(_BackupMedia) _then)
      : super(_value, (v) => _then(v as _BackupMedia));

  @override
  _BackupMedia get _value => super._value as _BackupMedia;

  @override
  $Res call({
    Object? stream = freezed,
    Object? contentType = freezed,
    Object? length = freezed,
  }) {
    return _then(_BackupMedia(
      stream: stream == freezed
          ? _value.stream
          : stream // ignore: cast_nullable_to_non_nullable
              as Stream<List<int>>,
      contentType: contentType == freezed
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as String,
      length: length == freezed
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_BackupMedia extends _BackupMedia {
  const _$_BackupMedia(
      {required this.stream, required this.contentType, this.length})
      : super._();

  @override
  final Stream<List<int>> stream;
  @override
  final String contentType;
  @override
  final int? length;

  @override
  String toString() {
    return 'BackupMedia(stream: $stream, contentType: $contentType, length: $length)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BackupMedia &&
            (identical(other.stream, stream) ||
                const DeepCollectionEquality().equals(other.stream, stream)) &&
            (identical(other.contentType, contentType) ||
                const DeepCollectionEquality()
                    .equals(other.contentType, contentType)) &&
            (identical(other.length, length) ||
                const DeepCollectionEquality().equals(other.length, length)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(stream) ^
      const DeepCollectionEquality().hash(contentType) ^
      const DeepCollectionEquality().hash(length);

  @JsonKey(ignore: true)
  @override
  _$BackupMediaCopyWith<_BackupMedia> get copyWith =>
      __$BackupMediaCopyWithImpl<_BackupMedia>(this, _$identity);
}

abstract class _BackupMedia extends BackupMedia {
  const factory _BackupMedia(
      {required Stream<List<int>> stream,
      required String contentType,
      int? length}) = _$_BackupMedia;
  const _BackupMedia._() : super._();

  @override
  Stream<List<int>> get stream => throw _privateConstructorUsedError;
  @override
  String get contentType => throw _privateConstructorUsedError;
  @override
  int? get length => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BackupMediaCopyWith<_BackupMedia> get copyWith =>
      throw _privateConstructorUsedError;
}
