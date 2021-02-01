// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'reminder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReminderTearOff {
  const _$ReminderTearOff();

  _Reminder call({required ReminderId id, required int minutes}) {
    return _Reminder(
      id: id,
      minutes: minutes,
    );
  }
}

/// @nodoc
const $Reminder = _$ReminderTearOff();

/// @nodoc
mixin _$Reminder {
  ReminderId get id => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderCopyWith<Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderCopyWith<$Res> {
  factory $ReminderCopyWith(Reminder value, $Res Function(Reminder) then) =
      _$ReminderCopyWithImpl<$Res>;
  $Res call({ReminderId id, int minutes});

  $ReminderIdCopyWith<$Res> get id;
}

/// @nodoc
class _$ReminderCopyWithImpl<$Res> implements $ReminderCopyWith<$Res> {
  _$ReminderCopyWithImpl(this._value, this._then);

  final Reminder _value;
  // ignore: unused_field
  final $Res Function(Reminder) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? minutes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as ReminderId,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $ReminderIdCopyWith<$Res> get id {
    return $ReminderIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$ReminderCopyWith<$Res> implements $ReminderCopyWith<$Res> {
  factory _$ReminderCopyWith(_Reminder value, $Res Function(_Reminder) then) =
      __$ReminderCopyWithImpl<$Res>;
  @override
  $Res call({ReminderId id, int minutes});

  @override
  $ReminderIdCopyWith<$Res> get id;
}

/// @nodoc
class __$ReminderCopyWithImpl<$Res> extends _$ReminderCopyWithImpl<$Res>
    implements _$ReminderCopyWith<$Res> {
  __$ReminderCopyWithImpl(_Reminder _value, $Res Function(_Reminder) _then)
      : super(_value, (v) => _then(v as _Reminder));

  @override
  _Reminder get _value => super._value as _Reminder;

  @override
  $Res call({
    Object? id = freezed,
    Object? minutes = freezed,
  }) {
    return _then(_Reminder(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as ReminderId,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Reminder extends _Reminder with DiagnosticableTreeMixin {
  const _$_Reminder({required this.id, required this.minutes}) : super._();

  @override
  final ReminderId id;
  @override
  final int minutes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Reminder(id: $id, minutes: $minutes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Reminder'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('minutes', minutes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Reminder &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.minutes, minutes) ||
                const DeepCollectionEquality().equals(other.minutes, minutes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(minutes);

  @JsonKey(ignore: true)
  @override
  _$ReminderCopyWith<_Reminder> get copyWith =>
      __$ReminderCopyWithImpl<_Reminder>(this, _$identity);
}

abstract class _Reminder extends Reminder {
  const factory _Reminder({required ReminderId id, required int minutes}) =
      _$_Reminder;
  const _Reminder._() : super._();

  @override
  ReminderId get id => throw _privateConstructorUsedError;
  @override
  int get minutes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReminderCopyWith<_Reminder> get copyWith =>
      throw _privateConstructorUsedError;
}
