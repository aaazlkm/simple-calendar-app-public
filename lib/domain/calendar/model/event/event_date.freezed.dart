// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventDateTearOff {
  const _$EventDateTearOff();

  _EventDate call(
      {required bool isAllDay,
      required TZDateTime start,
      required TZDateTime end}) {
    return _EventDate(
      isAllDay: isAllDay,
      start: start,
      end: end,
    );
  }
}

/// @nodoc
const $EventDate = _$EventDateTearOff();

/// @nodoc
mixin _$EventDate {
  bool get isAllDay => throw _privateConstructorUsedError;
  TZDateTime get start => throw _privateConstructorUsedError;
  TZDateTime get end => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventDateCopyWith<EventDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventDateCopyWith<$Res> {
  factory $EventDateCopyWith(EventDate value, $Res Function(EventDate) then) =
      _$EventDateCopyWithImpl<$Res>;
  $Res call({bool isAllDay, TZDateTime start, TZDateTime end});
}

/// @nodoc
class _$EventDateCopyWithImpl<$Res> implements $EventDateCopyWith<$Res> {
  _$EventDateCopyWithImpl(this._value, this._then);

  final EventDate _value;
  // ignore: unused_field
  final $Res Function(EventDate) _then;

  @override
  $Res call({
    Object? isAllDay = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      isAllDay: isAllDay == freezed
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
    ));
  }
}

/// @nodoc
abstract class _$EventDateCopyWith<$Res> implements $EventDateCopyWith<$Res> {
  factory _$EventDateCopyWith(
          _EventDate value, $Res Function(_EventDate) then) =
      __$EventDateCopyWithImpl<$Res>;
  @override
  $Res call({bool isAllDay, TZDateTime start, TZDateTime end});
}

/// @nodoc
class __$EventDateCopyWithImpl<$Res> extends _$EventDateCopyWithImpl<$Res>
    implements _$EventDateCopyWith<$Res> {
  __$EventDateCopyWithImpl(_EventDate _value, $Res Function(_EventDate) _then)
      : super(_value, (v) => _then(v as _EventDate));

  @override
  _EventDate get _value => super._value as _EventDate;

  @override
  $Res call({
    Object? isAllDay = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_EventDate(
      isAllDay: isAllDay == freezed
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as bool,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as TZDateTime,
    ));
  }
}

/// @nodoc

class _$_EventDate extends _EventDate with DiagnosticableTreeMixin {
  const _$_EventDate(
      {required this.isAllDay, required this.start, required this.end})
      : super._();

  @override
  final bool isAllDay;
  @override
  final TZDateTime start;
  @override
  final TZDateTime end;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventDate(isAllDay: $isAllDay, start: $start, end: $end)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventDate'))
      ..add(DiagnosticsProperty('isAllDay', isAllDay))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventDate &&
            (identical(other.isAllDay, isAllDay) ||
                const DeepCollectionEquality()
                    .equals(other.isAllDay, isAllDay)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isAllDay) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end);

  @JsonKey(ignore: true)
  @override
  _$EventDateCopyWith<_EventDate> get copyWith =>
      __$EventDateCopyWithImpl<_EventDate>(this, _$identity);
}

abstract class _EventDate extends EventDate {
  const factory _EventDate(
      {required bool isAllDay,
      required TZDateTime start,
      required TZDateTime end}) = _$_EventDate;
  const _EventDate._() : super._();

  @override
  bool get isAllDay => throw _privateConstructorUsedError;
  @override
  TZDateTime get start => throw _privateConstructorUsedError;
  @override
  TZDateTime get end => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventDateCopyWith<_EventDate> get copyWith =>
      throw _privateConstructorUsedError;
}
