// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'daily_remind.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DailyRemindTearOff {
  const _$DailyRemindTearOff();

  _DailyRemind call(
      {required TZDateTime scheduledDate, required BuiltList<Event> events}) {
    return _DailyRemind(
      scheduledDate: scheduledDate,
      events: events,
    );
  }
}

/// @nodoc
const $DailyRemind = _$DailyRemindTearOff();

/// @nodoc
mixin _$DailyRemind {
  TZDateTime get scheduledDate => throw _privateConstructorUsedError;
  BuiltList<Event> get events => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailyRemindCopyWith<DailyRemind> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyRemindCopyWith<$Res> {
  factory $DailyRemindCopyWith(
          DailyRemind value, $Res Function(DailyRemind) then) =
      _$DailyRemindCopyWithImpl<$Res>;
  $Res call({TZDateTime scheduledDate, BuiltList<Event> events});
}

/// @nodoc
class _$DailyRemindCopyWithImpl<$Res> implements $DailyRemindCopyWith<$Res> {
  _$DailyRemindCopyWithImpl(this._value, this._then);

  final DailyRemind _value;
  // ignore: unused_field
  final $Res Function(DailyRemind) _then;

  @override
  $Res call({
    Object? scheduledDate = freezed,
    Object? events = freezed,
  }) {
    return _then(_value.copyWith(
      scheduledDate: scheduledDate == freezed
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as BuiltList<Event>,
    ));
  }
}

/// @nodoc
abstract class _$DailyRemindCopyWith<$Res>
    implements $DailyRemindCopyWith<$Res> {
  factory _$DailyRemindCopyWith(
          _DailyRemind value, $Res Function(_DailyRemind) then) =
      __$DailyRemindCopyWithImpl<$Res>;
  @override
  $Res call({TZDateTime scheduledDate, BuiltList<Event> events});
}

/// @nodoc
class __$DailyRemindCopyWithImpl<$Res> extends _$DailyRemindCopyWithImpl<$Res>
    implements _$DailyRemindCopyWith<$Res> {
  __$DailyRemindCopyWithImpl(
      _DailyRemind _value, $Res Function(_DailyRemind) _then)
      : super(_value, (v) => _then(v as _DailyRemind));

  @override
  _DailyRemind get _value => super._value as _DailyRemind;

  @override
  $Res call({
    Object? scheduledDate = freezed,
    Object? events = freezed,
  }) {
    return _then(_DailyRemind(
      scheduledDate: scheduledDate == freezed
          ? _value.scheduledDate
          : scheduledDate // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
      events: events == freezed
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as BuiltList<Event>,
    ));
  }
}

/// @nodoc

class _$_DailyRemind extends _DailyRemind {
  _$_DailyRemind({required this.scheduledDate, required this.events})
      : super._();

  @override
  final TZDateTime scheduledDate;
  @override
  final BuiltList<Event> events;

  @override
  String toString() {
    return 'DailyRemind(scheduledDate: $scheduledDate, events: $events)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DailyRemind &&
            (identical(other.scheduledDate, scheduledDate) ||
                const DeepCollectionEquality()
                    .equals(other.scheduledDate, scheduledDate)) &&
            (identical(other.events, events) ||
                const DeepCollectionEquality().equals(other.events, events)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(scheduledDate) ^
      const DeepCollectionEquality().hash(events);

  @JsonKey(ignore: true)
  @override
  _$DailyRemindCopyWith<_DailyRemind> get copyWith =>
      __$DailyRemindCopyWithImpl<_DailyRemind>(this, _$identity);
}

abstract class _DailyRemind extends DailyRemind {
  factory _DailyRemind(
      {required TZDateTime scheduledDate,
      required BuiltList<Event> events}) = _$_DailyRemind;
  _DailyRemind._() : super._();

  @override
  TZDateTime get scheduledDate => throw _privateConstructorUsedError;
  @override
  BuiltList<Event> get events => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DailyRemindCopyWith<_DailyRemind> get copyWith =>
      throw _privateConstructorUsedError;
}
