// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'event_edit_argument.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventEditArgumentTearOff {
  const _$EventEditArgumentTearOff();

  EventEditArgumentNewItem newItem(
      {required Calendar calendar, DateTime? dateTime}) {
    return EventEditArgumentNewItem(
      calendar: calendar,
      dateTime: dateTime,
    );
  }

  EventEditArgumentEdit edit(
      {required Calendar calendar, required Event event}) {
    return EventEditArgumentEdit(
      calendar: calendar,
      event: event,
    );
  }
}

/// @nodoc
const $EventEditArgument = _$EventEditArgumentTearOff();

/// @nodoc
mixin _$EventEditArgument {
  Calendar get calendar => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Calendar calendar, DateTime? dateTime) newItem,
    required TResult Function(Calendar calendar, Event event) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Calendar calendar, DateTime? dateTime)? newItem,
    TResult Function(Calendar calendar, Event event)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEditArgumentNewItem value) newItem,
    required TResult Function(EventEditArgumentEdit value) edit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEditArgumentNewItem value)? newItem,
    TResult Function(EventEditArgumentEdit value)? edit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventEditArgumentCopyWith<EventEditArgument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEditArgumentCopyWith<$Res> {
  factory $EventEditArgumentCopyWith(
          EventEditArgument value, $Res Function(EventEditArgument) then) =
      _$EventEditArgumentCopyWithImpl<$Res>;
  $Res call({Calendar calendar});

  $CalendarCopyWith<$Res> get calendar;
}

/// @nodoc
class _$EventEditArgumentCopyWithImpl<$Res>
    implements $EventEditArgumentCopyWith<$Res> {
  _$EventEditArgumentCopyWithImpl(this._value, this._then);

  final EventEditArgument _value;
  // ignore: unused_field
  final $Res Function(EventEditArgument) _then;

  @override
  $Res call({
    Object? calendar = freezed,
  }) {
    return _then(_value.copyWith(
      calendar: calendar == freezed
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as Calendar,
    ));
  }

  @override
  $CalendarCopyWith<$Res> get calendar {
    return $CalendarCopyWith<$Res>(_value.calendar, (value) {
      return _then(_value.copyWith(calendar: value));
    });
  }
}

/// @nodoc
abstract class $EventEditArgumentNewItemCopyWith<$Res>
    implements $EventEditArgumentCopyWith<$Res> {
  factory $EventEditArgumentNewItemCopyWith(EventEditArgumentNewItem value,
          $Res Function(EventEditArgumentNewItem) then) =
      _$EventEditArgumentNewItemCopyWithImpl<$Res>;
  @override
  $Res call({Calendar calendar, DateTime? dateTime});

  @override
  $CalendarCopyWith<$Res> get calendar;
}

/// @nodoc
class _$EventEditArgumentNewItemCopyWithImpl<$Res>
    extends _$EventEditArgumentCopyWithImpl<$Res>
    implements $EventEditArgumentNewItemCopyWith<$Res> {
  _$EventEditArgumentNewItemCopyWithImpl(EventEditArgumentNewItem _value,
      $Res Function(EventEditArgumentNewItem) _then)
      : super(_value, (v) => _then(v as EventEditArgumentNewItem));

  @override
  EventEditArgumentNewItem get _value =>
      super._value as EventEditArgumentNewItem;

  @override
  $Res call({
    Object? calendar = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(EventEditArgumentNewItem(
      calendar: calendar == freezed
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as Calendar,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$EventEditArgumentNewItem implements EventEditArgumentNewItem {
  const _$EventEditArgumentNewItem({required this.calendar, this.dateTime});

  @override
  final Calendar calendar;
  @override
  final DateTime? dateTime;

  @override
  String toString() {
    return 'EventEditArgument.newItem(calendar: $calendar, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventEditArgumentNewItem &&
            (identical(other.calendar, calendar) ||
                const DeepCollectionEquality()
                    .equals(other.calendar, calendar)) &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(calendar) ^
      const DeepCollectionEquality().hash(dateTime);

  @JsonKey(ignore: true)
  @override
  $EventEditArgumentNewItemCopyWith<EventEditArgumentNewItem> get copyWith =>
      _$EventEditArgumentNewItemCopyWithImpl<EventEditArgumentNewItem>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Calendar calendar, DateTime? dateTime) newItem,
    required TResult Function(Calendar calendar, Event event) edit,
  }) {
    return newItem(calendar, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Calendar calendar, DateTime? dateTime)? newItem,
    TResult Function(Calendar calendar, Event event)? edit,
    required TResult orElse(),
  }) {
    if (newItem != null) {
      return newItem(calendar, dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEditArgumentNewItem value) newItem,
    required TResult Function(EventEditArgumentEdit value) edit,
  }) {
    return newItem(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEditArgumentNewItem value)? newItem,
    TResult Function(EventEditArgumentEdit value)? edit,
    required TResult orElse(),
  }) {
    if (newItem != null) {
      return newItem(this);
    }
    return orElse();
  }
}

abstract class EventEditArgumentNewItem implements EventEditArgument {
  const factory EventEditArgumentNewItem(
      {required Calendar calendar,
      DateTime? dateTime}) = _$EventEditArgumentNewItem;

  @override
  Calendar get calendar => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $EventEditArgumentNewItemCopyWith<EventEditArgumentNewItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventEditArgumentEditCopyWith<$Res>
    implements $EventEditArgumentCopyWith<$Res> {
  factory $EventEditArgumentEditCopyWith(EventEditArgumentEdit value,
          $Res Function(EventEditArgumentEdit) then) =
      _$EventEditArgumentEditCopyWithImpl<$Res>;
  @override
  $Res call({Calendar calendar, Event event});

  @override
  $CalendarCopyWith<$Res> get calendar;
  $EventCopyWith<$Res> get event;
}

/// @nodoc
class _$EventEditArgumentEditCopyWithImpl<$Res>
    extends _$EventEditArgumentCopyWithImpl<$Res>
    implements $EventEditArgumentEditCopyWith<$Res> {
  _$EventEditArgumentEditCopyWithImpl(
      EventEditArgumentEdit _value, $Res Function(EventEditArgumentEdit) _then)
      : super(_value, (v) => _then(v as EventEditArgumentEdit));

  @override
  EventEditArgumentEdit get _value => super._value as EventEditArgumentEdit;

  @override
  $Res call({
    Object? calendar = freezed,
    Object? event = freezed,
  }) {
    return _then(EventEditArgumentEdit(
      calendar: calendar == freezed
          ? _value.calendar
          : calendar // ignore: cast_nullable_to_non_nullable
              as Calendar,
      event: event == freezed
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event,
    ));
  }

  @override
  $EventCopyWith<$Res> get event {
    return $EventCopyWith<$Res>(_value.event, (value) {
      return _then(_value.copyWith(event: value));
    });
  }
}

/// @nodoc

class _$EventEditArgumentEdit implements EventEditArgumentEdit {
  const _$EventEditArgumentEdit({required this.calendar, required this.event});

  @override
  final Calendar calendar;
  @override
  final Event event;

  @override
  String toString() {
    return 'EventEditArgument.edit(calendar: $calendar, event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EventEditArgumentEdit &&
            (identical(other.calendar, calendar) ||
                const DeepCollectionEquality()
                    .equals(other.calendar, calendar)) &&
            (identical(other.event, event) ||
                const DeepCollectionEquality().equals(other.event, event)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(calendar) ^
      const DeepCollectionEquality().hash(event);

  @JsonKey(ignore: true)
  @override
  $EventEditArgumentEditCopyWith<EventEditArgumentEdit> get copyWith =>
      _$EventEditArgumentEditCopyWithImpl<EventEditArgumentEdit>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Calendar calendar, DateTime? dateTime) newItem,
    required TResult Function(Calendar calendar, Event event) edit,
  }) {
    return edit(calendar, event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Calendar calendar, DateTime? dateTime)? newItem,
    TResult Function(Calendar calendar, Event event)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(calendar, event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EventEditArgumentNewItem value) newItem,
    required TResult Function(EventEditArgumentEdit value) edit,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EventEditArgumentNewItem value)? newItem,
    TResult Function(EventEditArgumentEdit value)? edit,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class EventEditArgumentEdit implements EventEditArgument {
  const factory EventEditArgumentEdit(
      {required Calendar calendar,
      required Event event}) = _$EventEditArgumentEdit;

  @override
  Calendar get calendar => throw _privateConstructorUsedError;
  Event get event => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $EventEditArgumentEditCopyWith<EventEditArgumentEdit> get copyWith =>
      throw _privateConstructorUsedError;
}
