// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'daily_remind_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DailyRemindIdTearOff {
  const _$DailyRemindIdTearOff();

  _DailyRemindId call({required int id}) {
    return _DailyRemindId(
      id: id,
    );
  }

  _DailyRemindIdFrom from(TZDateTime dateTime) {
    return _DailyRemindIdFrom(
      dateTime,
    );
  }
}

/// @nodoc
const $DailyRemindId = _$DailyRemindIdTearOff();

/// @nodoc
mixin _$DailyRemindId {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id) $default, {
    required TResult Function(TZDateTime dateTime) from,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id)? $default, {
    TResult Function(TZDateTime dateTime)? from,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DailyRemindId value) $default, {
    required TResult Function(_DailyRemindIdFrom value) from,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DailyRemindId value)? $default, {
    TResult Function(_DailyRemindIdFrom value)? from,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyRemindIdCopyWith<$Res> {
  factory $DailyRemindIdCopyWith(
          DailyRemindId value, $Res Function(DailyRemindId) then) =
      _$DailyRemindIdCopyWithImpl<$Res>;
}

/// @nodoc
class _$DailyRemindIdCopyWithImpl<$Res>
    implements $DailyRemindIdCopyWith<$Res> {
  _$DailyRemindIdCopyWithImpl(this._value, this._then);

  final DailyRemindId _value;
  // ignore: unused_field
  final $Res Function(DailyRemindId) _then;
}

/// @nodoc
abstract class _$DailyRemindIdCopyWith<$Res> {
  factory _$DailyRemindIdCopyWith(
          _DailyRemindId value, $Res Function(_DailyRemindId) then) =
      __$DailyRemindIdCopyWithImpl<$Res>;
  $Res call({int id});
}

/// @nodoc
class __$DailyRemindIdCopyWithImpl<$Res>
    extends _$DailyRemindIdCopyWithImpl<$Res>
    implements _$DailyRemindIdCopyWith<$Res> {
  __$DailyRemindIdCopyWithImpl(
      _DailyRemindId _value, $Res Function(_DailyRemindId) _then)
      : super(_value, (v) => _then(v as _DailyRemindId));

  @override
  _DailyRemindId get _value => super._value as _DailyRemindId;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_DailyRemindId(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_DailyRemindId extends _DailyRemindId {
  const _$_DailyRemindId({required this.id}) : super._();

  @override
  final int id;

  @override
  String toString() {
    return 'DailyRemindId(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DailyRemindId &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$DailyRemindIdCopyWith<_DailyRemindId> get copyWith =>
      __$DailyRemindIdCopyWithImpl<_DailyRemindId>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id) $default, {
    required TResult Function(TZDateTime dateTime) from,
  }) {
    return $default(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id)? $default, {
    TResult Function(TZDateTime dateTime)? from,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DailyRemindId value) $default, {
    required TResult Function(_DailyRemindIdFrom value) from,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DailyRemindId value)? $default, {
    TResult Function(_DailyRemindIdFrom value)? from,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _DailyRemindId extends DailyRemindId {
  const factory _DailyRemindId({required int id}) = _$_DailyRemindId;
  const _DailyRemindId._() : super._();

  int get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$DailyRemindIdCopyWith<_DailyRemindId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$DailyRemindIdFromCopyWith<$Res> {
  factory _$DailyRemindIdFromCopyWith(
          _DailyRemindIdFrom value, $Res Function(_DailyRemindIdFrom) then) =
      __$DailyRemindIdFromCopyWithImpl<$Res>;
  $Res call({TZDateTime dateTime});
}

/// @nodoc
class __$DailyRemindIdFromCopyWithImpl<$Res>
    extends _$DailyRemindIdCopyWithImpl<$Res>
    implements _$DailyRemindIdFromCopyWith<$Res> {
  __$DailyRemindIdFromCopyWithImpl(
      _DailyRemindIdFrom _value, $Res Function(_DailyRemindIdFrom) _then)
      : super(_value, (v) => _then(v as _DailyRemindIdFrom));

  @override
  _DailyRemindIdFrom get _value => super._value as _DailyRemindIdFrom;

  @override
  $Res call({
    Object? dateTime = freezed,
  }) {
    return _then(_DailyRemindIdFrom(
      dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
    ));
  }
}

/// @nodoc

class _$_DailyRemindIdFrom extends _DailyRemindIdFrom {
  const _$_DailyRemindIdFrom(this.dateTime) : super._();

  @override
  final TZDateTime dateTime;

  @override
  String toString() {
    return 'DailyRemindId.from(dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DailyRemindIdFrom &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(dateTime);

  @JsonKey(ignore: true)
  @override
  _$DailyRemindIdFromCopyWith<_DailyRemindIdFrom> get copyWith =>
      __$DailyRemindIdFromCopyWithImpl<_DailyRemindIdFrom>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int id) $default, {
    required TResult Function(TZDateTime dateTime) from,
  }) {
    return from(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int id)? $default, {
    TResult Function(TZDateTime dateTime)? from,
    required TResult orElse(),
  }) {
    if (from != null) {
      return from(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DailyRemindId value) $default, {
    required TResult Function(_DailyRemindIdFrom value) from,
  }) {
    return from(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DailyRemindId value)? $default, {
    TResult Function(_DailyRemindIdFrom value)? from,
    required TResult orElse(),
  }) {
    if (from != null) {
      return from(this);
    }
    return orElse();
  }
}

abstract class _DailyRemindIdFrom extends DailyRemindId {
  const factory _DailyRemindIdFrom(TZDateTime dateTime) = _$_DailyRemindIdFrom;
  const _DailyRemindIdFrom._() : super._();

  TZDateTime get dateTime => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$DailyRemindIdFromCopyWith<_DailyRemindIdFrom> get copyWith =>
      throw _privateConstructorUsedError;
}
