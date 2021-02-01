// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventHistoryTearOff {
  const _$EventHistoryTearOff();

  _EventHistory call(
      {required EventHistoryId id,
      required CalendarId calendarId,
      required String name,
      required Color color,
      required DateTime createdAt}) {
    return _EventHistory(
      id: id,
      calendarId: calendarId,
      name: name,
      color: color,
      createdAt: createdAt,
    );
  }
}

/// @nodoc
const $EventHistory = _$EventHistoryTearOff();

/// @nodoc
mixin _$EventHistory {
  EventHistoryId get id => throw _privateConstructorUsedError;
  CalendarId get calendarId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventHistoryCopyWith<EventHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventHistoryCopyWith<$Res> {
  factory $EventHistoryCopyWith(
          EventHistory value, $Res Function(EventHistory) then) =
      _$EventHistoryCopyWithImpl<$Res>;
  $Res call(
      {EventHistoryId id,
      CalendarId calendarId,
      String name,
      Color color,
      DateTime createdAt});

  $EventHistoryIdCopyWith<$Res> get id;
  $CalendarIdCopyWith<$Res> get calendarId;
}

/// @nodoc
class _$EventHistoryCopyWithImpl<$Res> implements $EventHistoryCopyWith<$Res> {
  _$EventHistoryCopyWithImpl(this._value, this._then);

  final EventHistory _value;
  // ignore: unused_field
  final $Res Function(EventHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? calendarId = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as EventHistoryId,
      calendarId: calendarId == freezed
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as CalendarId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  @override
  $EventHistoryIdCopyWith<$Res> get id {
    return $EventHistoryIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  $CalendarIdCopyWith<$Res> get calendarId {
    return $CalendarIdCopyWith<$Res>(_value.calendarId, (value) {
      return _then(_value.copyWith(calendarId: value));
    });
  }
}

/// @nodoc
abstract class _$EventHistoryCopyWith<$Res>
    implements $EventHistoryCopyWith<$Res> {
  factory _$EventHistoryCopyWith(
          _EventHistory value, $Res Function(_EventHistory) then) =
      __$EventHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {EventHistoryId id,
      CalendarId calendarId,
      String name,
      Color color,
      DateTime createdAt});

  @override
  $EventHistoryIdCopyWith<$Res> get id;
  @override
  $CalendarIdCopyWith<$Res> get calendarId;
}

/// @nodoc
class __$EventHistoryCopyWithImpl<$Res> extends _$EventHistoryCopyWithImpl<$Res>
    implements _$EventHistoryCopyWith<$Res> {
  __$EventHistoryCopyWithImpl(
      _EventHistory _value, $Res Function(_EventHistory) _then)
      : super(_value, (v) => _then(v as _EventHistory));

  @override
  _EventHistory get _value => super._value as _EventHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? calendarId = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_EventHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as EventHistoryId,
      calendarId: calendarId == freezed
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as CalendarId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_EventHistory extends _EventHistory with DiagnosticableTreeMixin {
  const _$_EventHistory(
      {required this.id,
      required this.calendarId,
      required this.name,
      required this.color,
      required this.createdAt})
      : super._();

  @override
  final EventHistoryId id;
  @override
  final CalendarId calendarId;
  @override
  final String name;
  @override
  final Color color;
  @override
  final DateTime createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventHistory(id: $id, calendarId: $calendarId, name: $name, color: $color, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventHistory'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('calendarId', calendarId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventHistory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.calendarId, calendarId) ||
                const DeepCollectionEquality()
                    .equals(other.calendarId, calendarId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(calendarId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(createdAt);

  @JsonKey(ignore: true)
  @override
  _$EventHistoryCopyWith<_EventHistory> get copyWith =>
      __$EventHistoryCopyWithImpl<_EventHistory>(this, _$identity);
}

abstract class _EventHistory extends EventHistory {
  const factory _EventHistory(
      {required EventHistoryId id,
      required CalendarId calendarId,
      required String name,
      required Color color,
      required DateTime createdAt}) = _$_EventHistory;
  const _EventHistory._() : super._();

  @override
  EventHistoryId get id => throw _privateConstructorUsedError;
  @override
  CalendarId get calendarId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventHistoryCopyWith<_EventHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
