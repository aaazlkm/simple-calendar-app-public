// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'device_calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DeviceCalendarTearOff {
  const _$DeviceCalendarTearOff();

  _DeviceCalendar call(
      {required DeviceCalendarId id,
      required String name,
      required Color color,
      required String accountName,
      required String accountType}) {
    return _DeviceCalendar(
      id: id,
      name: name,
      color: color,
      accountName: accountName,
      accountType: accountType,
    );
  }
}

/// @nodoc
const $DeviceCalendar = _$DeviceCalendarTearOff();

/// @nodoc
mixin _$DeviceCalendar {
  DeviceCalendarId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  String get accountType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceCalendarCopyWith<DeviceCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCalendarCopyWith<$Res> {
  factory $DeviceCalendarCopyWith(
          DeviceCalendar value, $Res Function(DeviceCalendar) then) =
      _$DeviceCalendarCopyWithImpl<$Res>;
  $Res call(
      {DeviceCalendarId id,
      String name,
      Color color,
      String accountName,
      String accountType});

  $DeviceCalendarIdCopyWith<$Res> get id;
}

/// @nodoc
class _$DeviceCalendarCopyWithImpl<$Res>
    implements $DeviceCalendarCopyWith<$Res> {
  _$DeviceCalendarCopyWithImpl(this._value, this._then);

  final DeviceCalendar _value;
  // ignore: unused_field
  final $Res Function(DeviceCalendar) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? accountName = freezed,
    Object? accountType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as DeviceCalendarId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $DeviceCalendarIdCopyWith<$Res> get id {
    return $DeviceCalendarIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$DeviceCalendarCopyWith<$Res>
    implements $DeviceCalendarCopyWith<$Res> {
  factory _$DeviceCalendarCopyWith(
          _DeviceCalendar value, $Res Function(_DeviceCalendar) then) =
      __$DeviceCalendarCopyWithImpl<$Res>;
  @override
  $Res call(
      {DeviceCalendarId id,
      String name,
      Color color,
      String accountName,
      String accountType});

  @override
  $DeviceCalendarIdCopyWith<$Res> get id;
}

/// @nodoc
class __$DeviceCalendarCopyWithImpl<$Res>
    extends _$DeviceCalendarCopyWithImpl<$Res>
    implements _$DeviceCalendarCopyWith<$Res> {
  __$DeviceCalendarCopyWithImpl(
      _DeviceCalendar _value, $Res Function(_DeviceCalendar) _then)
      : super(_value, (v) => _then(v as _DeviceCalendar));

  @override
  _DeviceCalendar get _value => super._value as _DeviceCalendar;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? accountName = freezed,
    Object? accountType = freezed,
  }) {
    return _then(_DeviceCalendar(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as DeviceCalendarId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      accountName: accountName == freezed
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: accountType == freezed
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeviceCalendar
    with DiagnosticableTreeMixin
    implements _DeviceCalendar {
  const _$_DeviceCalendar(
      {required this.id,
      required this.name,
      required this.color,
      required this.accountName,
      required this.accountType});

  @override
  final DeviceCalendarId id;
  @override
  final String name;
  @override
  final Color color;
  @override
  final String accountName;
  @override
  final String accountType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeviceCalendar(id: $id, name: $name, color: $color, accountName: $accountName, accountType: $accountType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeviceCalendar'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('accountName', accountName))
      ..add(DiagnosticsProperty('accountType', accountType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DeviceCalendar &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.accountName, accountName) ||
                const DeepCollectionEquality()
                    .equals(other.accountName, accountName)) &&
            (identical(other.accountType, accountType) ||
                const DeepCollectionEquality()
                    .equals(other.accountType, accountType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(accountName) ^
      const DeepCollectionEquality().hash(accountType);

  @JsonKey(ignore: true)
  @override
  _$DeviceCalendarCopyWith<_DeviceCalendar> get copyWith =>
      __$DeviceCalendarCopyWithImpl<_DeviceCalendar>(this, _$identity);
}

abstract class _DeviceCalendar implements DeviceCalendar {
  const factory _DeviceCalendar(
      {required DeviceCalendarId id,
      required String name,
      required Color color,
      required String accountName,
      required String accountType}) = _$_DeviceCalendar;

  @override
  DeviceCalendarId get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  String get accountName => throw _privateConstructorUsedError;
  @override
  String get accountType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DeviceCalendarCopyWith<_DeviceCalendar> get copyWith =>
      throw _privateConstructorUsedError;
}
