// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'holiday.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HolidayTearOff {
  const _$HolidayTearOff();

  _Holiday call(
      {required String id,
      required String title,
      required DateRange dateRange,
      required DeviceCalendar deviceCalendar}) {
    return _Holiday(
      id: id,
      title: title,
      dateRange: dateRange,
      deviceCalendar: deviceCalendar,
    );
  }
}

/// @nodoc
const $Holiday = _$HolidayTearOff();

/// @nodoc
mixin _$Holiday {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateRange get dateRange => throw _privateConstructorUsedError;
  DeviceCalendar get deviceCalendar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HolidayCopyWith<Holiday> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayCopyWith<$Res> {
  factory $HolidayCopyWith(Holiday value, $Res Function(Holiday) then) =
      _$HolidayCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String title,
      DateRange dateRange,
      DeviceCalendar deviceCalendar});

  $DateRangeCopyWith<$Res> get dateRange;
  $DeviceCalendarCopyWith<$Res> get deviceCalendar;
}

/// @nodoc
class _$HolidayCopyWithImpl<$Res> implements $HolidayCopyWith<$Res> {
  _$HolidayCopyWithImpl(this._value, this._then);

  final Holiday _value;
  // ignore: unused_field
  final $Res Function(Holiday) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? dateRange = freezed,
    Object? deviceCalendar = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateRange: dateRange == freezed
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      deviceCalendar: deviceCalendar == freezed
          ? _value.deviceCalendar
          : deviceCalendar // ignore: cast_nullable_to_non_nullable
              as DeviceCalendar,
    ));
  }

  @override
  $DateRangeCopyWith<$Res> get dateRange {
    return $DateRangeCopyWith<$Res>(_value.dateRange, (value) {
      return _then(_value.copyWith(dateRange: value));
    });
  }

  @override
  $DeviceCalendarCopyWith<$Res> get deviceCalendar {
    return $DeviceCalendarCopyWith<$Res>(_value.deviceCalendar, (value) {
      return _then(_value.copyWith(deviceCalendar: value));
    });
  }
}

/// @nodoc
abstract class _$HolidayCopyWith<$Res> implements $HolidayCopyWith<$Res> {
  factory _$HolidayCopyWith(_Holiday value, $Res Function(_Holiday) then) =
      __$HolidayCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String title,
      DateRange dateRange,
      DeviceCalendar deviceCalendar});

  @override
  $DateRangeCopyWith<$Res> get dateRange;
  @override
  $DeviceCalendarCopyWith<$Res> get deviceCalendar;
}

/// @nodoc
class __$HolidayCopyWithImpl<$Res> extends _$HolidayCopyWithImpl<$Res>
    implements _$HolidayCopyWith<$Res> {
  __$HolidayCopyWithImpl(_Holiday _value, $Res Function(_Holiday) _then)
      : super(_value, (v) => _then(v as _Holiday));

  @override
  _Holiday get _value => super._value as _Holiday;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? dateRange = freezed,
    Object? deviceCalendar = freezed,
  }) {
    return _then(_Holiday(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      dateRange: dateRange == freezed
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      deviceCalendar: deviceCalendar == freezed
          ? _value.deviceCalendar
          : deviceCalendar // ignore: cast_nullable_to_non_nullable
              as DeviceCalendar,
    ));
  }
}

/// @nodoc

class _$_Holiday with DiagnosticableTreeMixin implements _Holiday {
  const _$_Holiday(
      {required this.id,
      required this.title,
      required this.dateRange,
      required this.deviceCalendar});

  @override
  final String id;
  @override
  final String title;
  @override
  final DateRange dateRange;
  @override
  final DeviceCalendar deviceCalendar;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Holiday(id: $id, title: $title, dateRange: $dateRange, deviceCalendar: $deviceCalendar)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Holiday'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('dateRange', dateRange))
      ..add(DiagnosticsProperty('deviceCalendar', deviceCalendar));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Holiday &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.dateRange, dateRange) ||
                const DeepCollectionEquality()
                    .equals(other.dateRange, dateRange)) &&
            (identical(other.deviceCalendar, deviceCalendar) ||
                const DeepCollectionEquality()
                    .equals(other.deviceCalendar, deviceCalendar)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(dateRange) ^
      const DeepCollectionEquality().hash(deviceCalendar);

  @JsonKey(ignore: true)
  @override
  _$HolidayCopyWith<_Holiday> get copyWith =>
      __$HolidayCopyWithImpl<_Holiday>(this, _$identity);
}

abstract class _Holiday implements Holiday {
  const factory _Holiday(
      {required String id,
      required String title,
      required DateRange dateRange,
      required DeviceCalendar deviceCalendar}) = _$_Holiday;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  DateRange get dateRange => throw _privateConstructorUsedError;
  @override
  DeviceCalendar get deviceCalendar => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HolidayCopyWith<_Holiday> get copyWith =>
      throw _privateConstructorUsedError;
}
