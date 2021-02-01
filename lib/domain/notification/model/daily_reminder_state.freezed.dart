// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'daily_reminder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DailyReminderStateTearOff {
  const _$DailyReminderStateTearOff();

  _DailyReminderState call(
      {required bool enable, required DailyRemindTime remindTime}) {
    return _DailyReminderState(
      enable: enable,
      remindTime: remindTime,
    );
  }
}

/// @nodoc
const $DailyReminderState = _$DailyReminderStateTearOff();

/// @nodoc
mixin _$DailyReminderState {
  bool get enable => throw _privateConstructorUsedError;
  DailyRemindTime get remindTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DailyReminderStateCopyWith<DailyReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyReminderStateCopyWith<$Res> {
  factory $DailyReminderStateCopyWith(
          DailyReminderState value, $Res Function(DailyReminderState) then) =
      _$DailyReminderStateCopyWithImpl<$Res>;
  $Res call({bool enable, DailyRemindTime remindTime});

  $DailyRemindTimeCopyWith<$Res> get remindTime;
}

/// @nodoc
class _$DailyReminderStateCopyWithImpl<$Res>
    implements $DailyReminderStateCopyWith<$Res> {
  _$DailyReminderStateCopyWithImpl(this._value, this._then);

  final DailyReminderState _value;
  // ignore: unused_field
  final $Res Function(DailyReminderState) _then;

  @override
  $Res call({
    Object? enable = freezed,
    Object? remindTime = freezed,
  }) {
    return _then(_value.copyWith(
      enable: enable == freezed
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      remindTime: remindTime == freezed
          ? _value.remindTime
          : remindTime // ignore: cast_nullable_to_non_nullable
              as DailyRemindTime,
    ));
  }

  @override
  $DailyRemindTimeCopyWith<$Res> get remindTime {
    return $DailyRemindTimeCopyWith<$Res>(_value.remindTime, (value) {
      return _then(_value.copyWith(remindTime: value));
    });
  }
}

/// @nodoc
abstract class _$DailyReminderStateCopyWith<$Res>
    implements $DailyReminderStateCopyWith<$Res> {
  factory _$DailyReminderStateCopyWith(
          _DailyReminderState value, $Res Function(_DailyReminderState) then) =
      __$DailyReminderStateCopyWithImpl<$Res>;
  @override
  $Res call({bool enable, DailyRemindTime remindTime});

  @override
  $DailyRemindTimeCopyWith<$Res> get remindTime;
}

/// @nodoc
class __$DailyReminderStateCopyWithImpl<$Res>
    extends _$DailyReminderStateCopyWithImpl<$Res>
    implements _$DailyReminderStateCopyWith<$Res> {
  __$DailyReminderStateCopyWithImpl(
      _DailyReminderState _value, $Res Function(_DailyReminderState) _then)
      : super(_value, (v) => _then(v as _DailyReminderState));

  @override
  _DailyReminderState get _value => super._value as _DailyReminderState;

  @override
  $Res call({
    Object? enable = freezed,
    Object? remindTime = freezed,
  }) {
    return _then(_DailyReminderState(
      enable: enable == freezed
          ? _value.enable
          : enable // ignore: cast_nullable_to_non_nullable
              as bool,
      remindTime: remindTime == freezed
          ? _value.remindTime
          : remindTime // ignore: cast_nullable_to_non_nullable
              as DailyRemindTime,
    ));
  }
}

/// @nodoc

class _$_DailyReminderState extends _DailyReminderState {
  const _$_DailyReminderState({required this.enable, required this.remindTime})
      : super._();

  @override
  final bool enable;
  @override
  final DailyRemindTime remindTime;

  @override
  String toString() {
    return 'DailyReminderState(enable: $enable, remindTime: $remindTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DailyReminderState &&
            (identical(other.enable, enable) ||
                const DeepCollectionEquality().equals(other.enable, enable)) &&
            (identical(other.remindTime, remindTime) ||
                const DeepCollectionEquality()
                    .equals(other.remindTime, remindTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(enable) ^
      const DeepCollectionEquality().hash(remindTime);

  @JsonKey(ignore: true)
  @override
  _$DailyReminderStateCopyWith<_DailyReminderState> get copyWith =>
      __$DailyReminderStateCopyWithImpl<_DailyReminderState>(this, _$identity);
}

abstract class _DailyReminderState extends DailyReminderState {
  const factory _DailyReminderState(
      {required bool enable,
      required DailyRemindTime remindTime}) = _$_DailyReminderState;
  const _DailyReminderState._() : super._();

  @override
  bool get enable => throw _privateConstructorUsedError;
  @override
  DailyRemindTime get remindTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DailyReminderStateCopyWith<_DailyReminderState> get copyWith =>
      throw _privateConstructorUsedError;
}
