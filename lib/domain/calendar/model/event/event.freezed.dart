// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event call(
      {required EventId id,
      required CalendarId calendarId,
      required String name,
      required String note,
      required Color color,
      required EventDate eventDate,
      required BuiltList<Reminder> reminders,
      required DateTime createdAt,
      RecurrenceRule? recurrenceRule}) {
    return _Event(
      id: id,
      calendarId: calendarId,
      name: name,
      note: note,
      color: color,
      eventDate: eventDate,
      reminders: reminders,
      createdAt: createdAt,
      recurrenceRule: recurrenceRule,
    );
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event {
  EventId get id => throw _privateConstructorUsedError;
  CalendarId get calendarId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  EventDate get eventDate => throw _privateConstructorUsedError;
  BuiltList<Reminder> get reminders => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  RecurrenceRule? get recurrenceRule => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res>;
  $Res call(
      {EventId id,
      CalendarId calendarId,
      String name,
      String note,
      Color color,
      EventDate eventDate,
      BuiltList<Reminder> reminders,
      DateTime createdAt,
      RecurrenceRule? recurrenceRule});

  $EventIdCopyWith<$Res> get id;
  $CalendarIdCopyWith<$Res> get calendarId;
  $EventDateCopyWith<$Res> get eventDate;
  $RecurrenceRuleCopyWith<$Res>? get recurrenceRule;
}

/// @nodoc
class _$EventCopyWithImpl<$Res> implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event _value;
  // ignore: unused_field
  final $Res Function(Event) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? calendarId = freezed,
    Object? name = freezed,
    Object? note = freezed,
    Object? color = freezed,
    Object? eventDate = freezed,
    Object? reminders = freezed,
    Object? createdAt = freezed,
    Object? recurrenceRule = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as EventId,
      calendarId: calendarId == freezed
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as CalendarId,
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
              as Color,
      eventDate: eventDate == freezed
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as EventDate,
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as BuiltList<Reminder>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurrenceRule: recurrenceRule == freezed
          ? _value.recurrenceRule
          : recurrenceRule // ignore: cast_nullable_to_non_nullable
              as RecurrenceRule?,
    ));
  }

  @override
  $EventIdCopyWith<$Res> get id {
    return $EventIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }

  @override
  $CalendarIdCopyWith<$Res> get calendarId {
    return $CalendarIdCopyWith<$Res>(_value.calendarId, (value) {
      return _then(_value.copyWith(calendarId: value));
    });
  }

  @override
  $EventDateCopyWith<$Res> get eventDate {
    return $EventDateCopyWith<$Res>(_value.eventDate, (value) {
      return _then(_value.copyWith(eventDate: value));
    });
  }

  @override
  $RecurrenceRuleCopyWith<$Res>? get recurrenceRule {
    if (_value.recurrenceRule == null) {
      return null;
    }

    return $RecurrenceRuleCopyWith<$Res>(_value.recurrenceRule!, (value) {
      return _then(_value.copyWith(recurrenceRule: value));
    });
  }
}

/// @nodoc
abstract class _$EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$EventCopyWith(_Event value, $Res Function(_Event) then) =
      __$EventCopyWithImpl<$Res>;
  @override
  $Res call(
      {EventId id,
      CalendarId calendarId,
      String name,
      String note,
      Color color,
      EventDate eventDate,
      BuiltList<Reminder> reminders,
      DateTime createdAt,
      RecurrenceRule? recurrenceRule});

  @override
  $EventIdCopyWith<$Res> get id;
  @override
  $CalendarIdCopyWith<$Res> get calendarId;
  @override
  $EventDateCopyWith<$Res> get eventDate;
  @override
  $RecurrenceRuleCopyWith<$Res>? get recurrenceRule;
}

/// @nodoc
class __$EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res>
    implements _$EventCopyWith<$Res> {
  __$EventCopyWithImpl(_Event _value, $Res Function(_Event) _then)
      : super(_value, (v) => _then(v as _Event));

  @override
  _Event get _value => super._value as _Event;

  @override
  $Res call({
    Object? id = freezed,
    Object? calendarId = freezed,
    Object? name = freezed,
    Object? note = freezed,
    Object? color = freezed,
    Object? eventDate = freezed,
    Object? reminders = freezed,
    Object? createdAt = freezed,
    Object? recurrenceRule = freezed,
  }) {
    return _then(_Event(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as EventId,
      calendarId: calendarId == freezed
          ? _value.calendarId
          : calendarId // ignore: cast_nullable_to_non_nullable
              as CalendarId,
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
              as Color,
      eventDate: eventDate == freezed
          ? _value.eventDate
          : eventDate // ignore: cast_nullable_to_non_nullable
              as EventDate,
      reminders: reminders == freezed
          ? _value.reminders
          : reminders // ignore: cast_nullable_to_non_nullable
              as BuiltList<Reminder>,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurrenceRule: recurrenceRule == freezed
          ? _value.recurrenceRule
          : recurrenceRule // ignore: cast_nullable_to_non_nullable
              as RecurrenceRule?,
    ));
  }
}

/// @nodoc

class _$_Event extends _Event with DiagnosticableTreeMixin {
  const _$_Event(
      {required this.id,
      required this.calendarId,
      required this.name,
      required this.note,
      required this.color,
      required this.eventDate,
      required this.reminders,
      required this.createdAt,
      this.recurrenceRule})
      : super._();

  @override
  final EventId id;
  @override
  final CalendarId calendarId;
  @override
  final String name;
  @override
  final String note;
  @override
  final Color color;
  @override
  final EventDate eventDate;
  @override
  final BuiltList<Reminder> reminders;
  @override
  final DateTime createdAt;
  @override
  final RecurrenceRule? recurrenceRule;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event(id: $id, calendarId: $calendarId, name: $name, note: $note, color: $color, eventDate: $eventDate, reminders: $reminders, createdAt: $createdAt, recurrenceRule: $recurrenceRule)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('calendarId', calendarId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('note', note))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('eventDate', eventDate))
      ..add(DiagnosticsProperty('reminders', reminders))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('recurrenceRule', recurrenceRule));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Event &&
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
            (identical(other.eventDate, eventDate) ||
                const DeepCollectionEquality()
                    .equals(other.eventDate, eventDate)) &&
            (identical(other.reminders, reminders) ||
                const DeepCollectionEquality()
                    .equals(other.reminders, reminders)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.recurrenceRule, recurrenceRule) ||
                const DeepCollectionEquality()
                    .equals(other.recurrenceRule, recurrenceRule)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(calendarId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(note) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(eventDate) ^
      const DeepCollectionEquality().hash(reminders) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(recurrenceRule);

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<_Event> get copyWith =>
      __$EventCopyWithImpl<_Event>(this, _$identity);
}

abstract class _Event extends Event {
  const factory _Event(
      {required EventId id,
      required CalendarId calendarId,
      required String name,
      required String note,
      required Color color,
      required EventDate eventDate,
      required BuiltList<Reminder> reminders,
      required DateTime createdAt,
      RecurrenceRule? recurrenceRule}) = _$_Event;
  const _Event._() : super._();

  @override
  EventId get id => throw _privateConstructorUsedError;
  @override
  CalendarId get calendarId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get note => throw _privateConstructorUsedError;
  @override
  Color get color => throw _privateConstructorUsedError;
  @override
  EventDate get eventDate => throw _privateConstructorUsedError;
  @override
  BuiltList<Reminder> get reminders => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  RecurrenceRule? get recurrenceRule => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<_Event> get copyWith => throw _privateConstructorUsedError;
}
