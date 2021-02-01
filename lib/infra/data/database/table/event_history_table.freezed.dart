// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_history_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventHistoryTableTearOff {
  const _$EventHistoryTableTearOff();

  _EventHistoryTable call(
      {required String id,
      required String calendarId,
      required String name,
      required int color,
      required Timestamp createdAt}) {
    return _EventHistoryTable(
      id: id,
      calendarId: calendarId,
      name: name,
      color: color,
      createdAt: createdAt,
    );
  }
}

/// @nodoc
const $EventHistoryTable = _$EventHistoryTableTearOff();

/// @nodoc
mixin _$EventHistoryTable {
  String get id => throw _privateConstructorUsedError;
  String get calendarId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  Timestamp get createdAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventHistoryTableCopyWith<EventHistoryTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventHistoryTableCopyWith<$Res> {
  factory $EventHistoryTableCopyWith(
          EventHistoryTable value, $Res Function(EventHistoryTable) then) =
      _$EventHistoryTableCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String calendarId,
      String name,
      int color,
      Timestamp createdAt});
}

/// @nodoc
class _$EventHistoryTableCopyWithImpl<$Res>
    implements $EventHistoryTableCopyWith<$Res> {
  _$EventHistoryTableCopyWithImpl(this._value, this._then);

  final EventHistoryTable _value;
  // ignore: unused_field
  final $Res Function(EventHistoryTable) _then;

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
              as String,
      calendarId: calendarId == freezed
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
abstract class _$EventHistoryTableCopyWith<$Res>
    implements $EventHistoryTableCopyWith<$Res> {
  factory _$EventHistoryTableCopyWith(
          _EventHistoryTable value, $Res Function(_EventHistoryTable) then) =
      __$EventHistoryTableCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String calendarId,
      String name,
      int color,
      Timestamp createdAt});
}

/// @nodoc
class __$EventHistoryTableCopyWithImpl<$Res>
    extends _$EventHistoryTableCopyWithImpl<$Res>
    implements _$EventHistoryTableCopyWith<$Res> {
  __$EventHistoryTableCopyWithImpl(
      _EventHistoryTable _value, $Res Function(_EventHistoryTable) _then)
      : super(_value, (v) => _then(v as _EventHistoryTable));

  @override
  _EventHistoryTable get _value => super._value as _EventHistoryTable;

  @override
  $Res call({
    Object? id = freezed,
    Object? calendarId = freezed,
    Object? name = freezed,
    Object? color = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_EventHistoryTable(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      calendarId: calendarId == freezed
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

class _$_EventHistoryTable extends _EventHistoryTable
    with DiagnosticableTreeMixin {
  const _$_EventHistoryTable(
      {required this.id,
      required this.calendarId,
      required this.name,
      required this.color,
      required this.createdAt})
      : super._();

  @override
  final String id;
  @override
  final String calendarId;
  @override
  final String name;
  @override
  final int color;
  @override
  final Timestamp createdAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventHistoryTable(id: $id, calendarId: $calendarId, name: $name, color: $color, createdAt: $createdAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventHistoryTable'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('calendarId', calendarId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('createdAt', createdAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventHistoryTable &&
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
  _$EventHistoryTableCopyWith<_EventHistoryTable> get copyWith =>
      __$EventHistoryTableCopyWithImpl<_EventHistoryTable>(this, _$identity);
}

abstract class _EventHistoryTable extends EventHistoryTable {
  const factory _EventHistoryTable(
      {required String id,
      required String calendarId,
      required String name,
      required int color,
      required Timestamp createdAt}) = _$_EventHistoryTable;
  const _EventHistoryTable._() : super._();

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get calendarId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get color => throw _privateConstructorUsedError;
  @override
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventHistoryTableCopyWith<_EventHistoryTable> get copyWith =>
      throw _privateConstructorUsedError;
}
