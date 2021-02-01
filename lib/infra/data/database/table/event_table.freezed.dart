// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventTableTearOff {
  const _$EventTableTearOff();

  _EventTable call(
      {required String id,
      required String calendarId,
      required String name,
      required String note,
      required int color,
      required int isAllDay,
      required Timestamp start,
      required Timestamp end,
      required String timeZoneId,
      required BuiltList<ReminderTable> reminderTables,
      required Timestamp createdAt,
      RecurrenceRuleTable? recurrenceRuleTable}) {
    return _EventTable(
      id: id,
      calendarId: calendarId,
      name: name,
      note: note,
      color: color,
      isAllDay: isAllDay,
      start: start,
      end: end,
      timeZoneId: timeZoneId,
      reminderTables: reminderTables,
      createdAt: createdAt,
      recurrenceRuleTable: recurrenceRuleTable,
    );
  }
}

/// @nodoc
const $EventTable = _$EventTableTearOff();

/// @nodoc
mixin _$EventTable {
  String get id => throw _privateConstructorUsedError;
  String get calendarId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  int get isAllDay => throw _privateConstructorUsedError;
  Timestamp get start => throw _privateConstructorUsedError;
  Timestamp get end => throw _privateConstructorUsedError;
  String get timeZoneId => throw _privateConstructorUsedError;
  BuiltList<ReminderTable> get reminderTables =>
      throw _privateConstructorUsedError;
  Timestamp get createdAt => throw _privateConstructorUsedError;
  RecurrenceRuleTable? get recurrenceRuleTable =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventTableCopyWith<EventTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventTableCopyWith<$Res> {
  factory $EventTableCopyWith(
          EventTable value, $Res Function(EventTable) then) =
      _$EventTableCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String calendarId,
      String name,
      String note,
      int color,
      int isAllDay,
      Timestamp start,
      Timestamp end,
      String timeZoneId,
      BuiltList<ReminderTable> reminderTables,
      Timestamp createdAt,
      RecurrenceRuleTable? recurrenceRuleTable});

  $RecurrenceRuleTableCopyWith<$Res>? get recurrenceRuleTable;
}

/// @nodoc
class _$EventTableCopyWithImpl<$Res> implements $EventTableCopyWith<$Res> {
  _$EventTableCopyWithImpl(this._value, this._then);

  final EventTable _value;
  // ignore: unused_field
  final $Res Function(EventTable) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? calendarId = freezed,
    Object? name = freezed,
    Object? note = freezed,
    Object? color = freezed,
    Object? isAllDay = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? timeZoneId = freezed,
    Object? reminderTables = freezed,
    Object? createdAt = freezed,
    Object? recurrenceRuleTable = freezed,
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
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      isAllDay: isAllDay == freezed
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as int,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      timeZoneId: timeZoneId == freezed
          ? _value.timeZoneId
          : timeZoneId // ignore: cast_nullable_to_non_nullable
              as String,
      reminderTables: reminderTables == freezed
          ? _value.reminderTables
          : reminderTables // ignore: cast_nullable_to_non_nullable
              as BuiltList<ReminderTable>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      recurrenceRuleTable: recurrenceRuleTable == freezed
          ? _value.recurrenceRuleTable
          : recurrenceRuleTable // ignore: cast_nullable_to_non_nullable
              as RecurrenceRuleTable?,
    ));
  }

  @override
  $RecurrenceRuleTableCopyWith<$Res>? get recurrenceRuleTable {
    if (_value.recurrenceRuleTable == null) {
      return null;
    }

    return $RecurrenceRuleTableCopyWith<$Res>(_value.recurrenceRuleTable!,
        (value) {
      return _then(_value.copyWith(recurrenceRuleTable: value));
    });
  }
}

/// @nodoc
abstract class _$EventTableCopyWith<$Res> implements $EventTableCopyWith<$Res> {
  factory _$EventTableCopyWith(
          _EventTable value, $Res Function(_EventTable) then) =
      __$EventTableCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String calendarId,
      String name,
      String note,
      int color,
      int isAllDay,
      Timestamp start,
      Timestamp end,
      String timeZoneId,
      BuiltList<ReminderTable> reminderTables,
      Timestamp createdAt,
      RecurrenceRuleTable? recurrenceRuleTable});

  @override
  $RecurrenceRuleTableCopyWith<$Res>? get recurrenceRuleTable;
}

/// @nodoc
class __$EventTableCopyWithImpl<$Res> extends _$EventTableCopyWithImpl<$Res>
    implements _$EventTableCopyWith<$Res> {
  __$EventTableCopyWithImpl(
      _EventTable _value, $Res Function(_EventTable) _then)
      : super(_value, (v) => _then(v as _EventTable));

  @override
  _EventTable get _value => super._value as _EventTable;

  @override
  $Res call({
    Object? id = freezed,
    Object? calendarId = freezed,
    Object? name = freezed,
    Object? note = freezed,
    Object? color = freezed,
    Object? isAllDay = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? timeZoneId = freezed,
    Object? reminderTables = freezed,
    Object? createdAt = freezed,
    Object? recurrenceRuleTable = freezed,
  }) {
    return _then(_EventTable(
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
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      isAllDay: isAllDay == freezed
          ? _value.isAllDay
          : isAllDay // ignore: cast_nullable_to_non_nullable
              as int,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      timeZoneId: timeZoneId == freezed
          ? _value.timeZoneId
          : timeZoneId // ignore: cast_nullable_to_non_nullable
              as String,
      reminderTables: reminderTables == freezed
          ? _value.reminderTables
          : reminderTables // ignore: cast_nullable_to_non_nullable
              as BuiltList<ReminderTable>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      recurrenceRuleTable: recurrenceRuleTable == freezed
          ? _value.recurrenceRuleTable
          : recurrenceRuleTable // ignore: cast_nullable_to_non_nullable
              as RecurrenceRuleTable?,
    ));
  }
}

/// @nodoc

class _$_EventTable extends _EventTable with DiagnosticableTreeMixin {
  const _$_EventTable(
      {required this.id,
      required this.calendarId,
      required this.name,
      required this.note,
      required this.color,
      required this.isAllDay,
      required this.start,
      required this.end,
      required this.timeZoneId,
      required this.reminderTables,
      required this.createdAt,
      this.recurrenceRuleTable})
      : super._();

  @override
  final String id;
  @override
  final String calendarId;
  @override
  final String name;
  @override
  final String note;
  @override
  final int color;
  @override
  final int isAllDay;
  @override
  final Timestamp start;
  @override
  final Timestamp end;
  @override
  final String timeZoneId;
  @override
  final BuiltList<ReminderTable> reminderTables;
  @override
  final Timestamp createdAt;
  @override
  final RecurrenceRuleTable? recurrenceRuleTable;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EventTable(id: $id, calendarId: $calendarId, name: $name, note: $note, color: $color, isAllDay: $isAllDay, start: $start, end: $end, timeZoneId: $timeZoneId, reminderTables: $reminderTables, createdAt: $createdAt, recurrenceRuleTable: $recurrenceRuleTable)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EventTable'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('calendarId', calendarId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('isAllDay', isAllDay))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end))
      ..add(DiagnosticsProperty('timeZoneId', timeZoneId))
      ..add(DiagnosticsProperty('reminderTables', reminderTables))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('recurrenceRuleTable', recurrenceRuleTable));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EventTable &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.calendarId, calendarId) ||
                const DeepCollectionEquality()
                    .equals(other.calendarId, calendarId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.note, note) ||
                const DeepCollectionEquality().equals(other.note, note)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.isAllDay, isAllDay) ||
                const DeepCollectionEquality()
                    .equals(other.isAllDay, isAllDay)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)) &&
            (identical(other.timeZoneId, timeZoneId) ||
                const DeepCollectionEquality()
                    .equals(other.timeZoneId, timeZoneId)) &&
            (identical(other.reminderTables, reminderTables) ||
                const DeepCollectionEquality()
                    .equals(other.reminderTables, reminderTables)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.recurrenceRuleTable, recurrenceRuleTable) ||
                const DeepCollectionEquality()
                    .equals(other.recurrenceRuleTable, recurrenceRuleTable)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(calendarId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(isAllDay) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end) ^
      const DeepCollectionEquality().hash(timeZoneId) ^
      const DeepCollectionEquality().hash(reminderTables) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(recurrenceRuleTable);

  @JsonKey(ignore: true)
  @override
  _$EventTableCopyWith<_EventTable> get copyWith =>
      __$EventTableCopyWithImpl<_EventTable>(this, _$identity);
}

abstract class _EventTable extends EventTable {
  const factory _EventTable(
      {required String id,
      required String calendarId,
      required String name,
      required String note,
      required int color,
      required int isAllDay,
      required Timestamp start,
      required Timestamp end,
      required String timeZoneId,
      required BuiltList<ReminderTable> reminderTables,
      required Timestamp createdAt,
      RecurrenceRuleTable? recurrenceRuleTable}) = _$_EventTable;
  const _EventTable._() : super._();

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get calendarId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get note => throw _privateConstructorUsedError;
  @override
  int get color => throw _privateConstructorUsedError;
  @override
  int get isAllDay => throw _privateConstructorUsedError;
  @override
  Timestamp get start => throw _privateConstructorUsedError;
  @override
  Timestamp get end => throw _privateConstructorUsedError;
  @override
  String get timeZoneId => throw _privateConstructorUsedError;
  @override
  BuiltList<ReminderTable> get reminderTables =>
      throw _privateConstructorUsedError;
  @override
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @override
  RecurrenceRuleTable? get recurrenceRuleTable =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventTableCopyWith<_EventTable> get copyWith =>
      throw _privateConstructorUsedError;
}
