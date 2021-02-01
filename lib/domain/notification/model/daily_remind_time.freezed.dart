// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'daily_remind_time.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DailyRemindTimeTearOff {
  const _$DailyRemindTimeTearOff();

  _DailyRemindTime call(
      {required DailyRemindType remindType, required TimeOfDay timeOfDay}) {
    return _DailyRemindTime(
      remindType: remindType,
      timeOfDay: timeOfDay,
    );
  }
}

/// @nodoc
const $DailyRemindTime = _$DailyRemindTimeTearOff();

/// @nodoc
mixin _$DailyRemindTime {
  DailyRemindType get remindType => throw _privateConstructorUsedError;
  TimeOfDay get timeOfDay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailyRemindTimeCopyWith<DailyRemindTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyRemindTimeCopyWith<$Res> {
  factory $DailyRemindTimeCopyWith(
          DailyRemindTime value, $Res Function(DailyRemindTime) then) =
      _$DailyRemindTimeCopyWithImpl<$Res>;
  $Res call({DailyRemindType remindType, TimeOfDay timeOfDay});
}

/// @nodoc
class _$DailyRemindTimeCopyWithImpl<$Res>
    implements $DailyRemindTimeCopyWith<$Res> {
  _$DailyRemindTimeCopyWithImpl(this._value, this._then);

  final DailyRemindTime _value;
  // ignore: unused_field
  final $Res Function(DailyRemindTime) _then;

  @override
  $Res call({
    Object? remindType = freezed,
    Object? timeOfDay = freezed,
  }) {
    return _then(_value.copyWith(
      remindType: remindType == freezed
          ? _value.remindType
          : remindType // ignore: cast_nullable_to_non_nullable
              as DailyRemindType,
      timeOfDay: timeOfDay == freezed
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc
abstract class _$DailyRemindTimeCopyWith<$Res>
    implements $DailyRemindTimeCopyWith<$Res> {
  factory _$DailyRemindTimeCopyWith(
          _DailyRemindTime value, $Res Function(_DailyRemindTime) then) =
      __$DailyRemindTimeCopyWithImpl<$Res>;
  @override
  $Res call({DailyRemindType remindType, TimeOfDay timeOfDay});
}

/// @nodoc
class __$DailyRemindTimeCopyWithImpl<$Res>
    extends _$DailyRemindTimeCopyWithImpl<$Res>
    implements _$DailyRemindTimeCopyWith<$Res> {
  __$DailyRemindTimeCopyWithImpl(
      _DailyRemindTime _value, $Res Function(_DailyRemindTime) _then)
      : super(_value, (v) => _then(v as _DailyRemindTime));

  @override
  _DailyRemindTime get _value => super._value as _DailyRemindTime;

  @override
  $Res call({
    Object? remindType = freezed,
    Object? timeOfDay = freezed,
  }) {
    return _then(_DailyRemindTime(
      remindType: remindType == freezed
          ? _value.remindType
          : remindType // ignore: cast_nullable_to_non_nullable
              as DailyRemindType,
      timeOfDay: timeOfDay == freezed
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as TimeOfDay,
    ));
  }
}

/// @nodoc

class _$_DailyRemindTime extends _DailyRemindTime {
  const _$_DailyRemindTime({required this.remindType, required this.timeOfDay})
      : super._();

  @override
  final DailyRemindType remindType;
  @override
  final TimeOfDay timeOfDay;

  @override
  String toString() {
    return 'DailyRemindTime(remindType: $remindType, timeOfDay: $timeOfDay)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DailyRemindTime &&
            (identical(other.remindType, remindType) ||
                const DeepCollectionEquality()
                    .equals(other.remindType, remindType)) &&
            (identical(other.timeOfDay, timeOfDay) ||
                const DeepCollectionEquality()
                    .equals(other.timeOfDay, timeOfDay)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(remindType) ^
      const DeepCollectionEquality().hash(timeOfDay);

  @JsonKey(ignore: true)
  @override
  _$DailyRemindTimeCopyWith<_DailyRemindTime> get copyWith =>
      __$DailyRemindTimeCopyWithImpl<_DailyRemindTime>(this, _$identity);
}

abstract class _DailyRemindTime extends DailyRemindTime {
  const factory _DailyRemindTime(
      {required DailyRemindType remindType,
      required TimeOfDay timeOfDay}) = _$_DailyRemindTime;
  const _DailyRemindTime._() : super._();

  @override
  DailyRemindType get remindType => throw _privateConstructorUsedError;
  @override
  TimeOfDay get timeOfDay => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DailyRemindTimeCopyWith<_DailyRemindTime> get copyWith =>
      throw _privateConstructorUsedError;
}
