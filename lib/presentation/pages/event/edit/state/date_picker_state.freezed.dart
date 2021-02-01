// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'date_picker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DatePickerStateTearOff {
  const _$DatePickerStateTearOff();

  Initial initial(
      {required DateTime yearMonth, required DateRange prevDateRange}) {
    return Initial(
      yearMonth: yearMonth,
      prevDateRange: prevDateRange,
    );
  }

  Day day(
      {required DateTime yearMonth,
      required DateRange prevDateRange,
      required DateTime day}) {
    return Day(
      yearMonth: yearMonth,
      prevDateRange: prevDateRange,
      day: day,
    );
  }

  Range range(
      {required DateTime yearMonth,
      required DateRange prevDateRange,
      required DateTime start,
      required DateTime end}) {
    return Range(
      yearMonth: yearMonth,
      prevDateRange: prevDateRange,
      start: start,
      end: end,
    );
  }
}

/// @nodoc
const $DatePickerState = _$DatePickerStateTearOff();

/// @nodoc
mixin _$DatePickerState {
  DateTime get yearMonth => throw _privateConstructorUsedError;
  DateRange get prevDateRange => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime yearMonth, DateRange prevDateRange)
        initial,
    required TResult Function(
            DateTime yearMonth, DateRange prevDateRange, DateTime day)
        day,
    required TResult Function(DateTime yearMonth, DateRange prevDateRange,
            DateTime start, DateTime end)
        range,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime yearMonth, DateRange prevDateRange)? initial,
    TResult Function(DateTime yearMonth, DateRange prevDateRange, DateTime day)?
        day,
    TResult Function(DateTime yearMonth, DateRange prevDateRange,
            DateTime start, DateTime end)?
        range,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Day value) day,
    required TResult Function(Range value) range,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Day value)? day,
    TResult Function(Range value)? range,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DatePickerStateCopyWith<DatePickerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatePickerStateCopyWith<$Res> {
  factory $DatePickerStateCopyWith(
          DatePickerState value, $Res Function(DatePickerState) then) =
      _$DatePickerStateCopyWithImpl<$Res>;
  $Res call({DateTime yearMonth, DateRange prevDateRange});

  $DateRangeCopyWith<$Res> get prevDateRange;
}

/// @nodoc
class _$DatePickerStateCopyWithImpl<$Res>
    implements $DatePickerStateCopyWith<$Res> {
  _$DatePickerStateCopyWithImpl(this._value, this._then);

  final DatePickerState _value;
  // ignore: unused_field
  final $Res Function(DatePickerState) _then;

  @override
  $Res call({
    Object? yearMonth = freezed,
    Object? prevDateRange = freezed,
  }) {
    return _then(_value.copyWith(
      yearMonth: yearMonth == freezed
          ? _value.yearMonth
          : yearMonth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prevDateRange: prevDateRange == freezed
          ? _value.prevDateRange
          : prevDateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
    ));
  }

  @override
  $DateRangeCopyWith<$Res> get prevDateRange {
    return $DateRangeCopyWith<$Res>(_value.prevDateRange, (value) {
      return _then(_value.copyWith(prevDateRange: value));
    });
  }
}

/// @nodoc
abstract class $InitialCopyWith<$Res>
    implements $DatePickerStateCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
  @override
  $Res call({DateTime yearMonth, DateRange prevDateRange});

  @override
  $DateRangeCopyWith<$Res> get prevDateRange;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$DatePickerStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;

  @override
  $Res call({
    Object? yearMonth = freezed,
    Object? prevDateRange = freezed,
  }) {
    return _then(Initial(
      yearMonth: yearMonth == freezed
          ? _value.yearMonth
          : yearMonth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prevDateRange: prevDateRange == freezed
          ? _value.prevDateRange
          : prevDateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
    ));
  }
}

/// @nodoc

class _$Initial extends Initial with DiagnosticableTreeMixin {
  const _$Initial({required this.yearMonth, required this.prevDateRange})
      : super._();

  @override
  final DateTime yearMonth;
  @override
  final DateRange prevDateRange;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DatePickerState.initial(yearMonth: $yearMonth, prevDateRange: $prevDateRange)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DatePickerState.initial'))
      ..add(DiagnosticsProperty('yearMonth', yearMonth))
      ..add(DiagnosticsProperty('prevDateRange', prevDateRange));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Initial &&
            (identical(other.yearMonth, yearMonth) ||
                const DeepCollectionEquality()
                    .equals(other.yearMonth, yearMonth)) &&
            (identical(other.prevDateRange, prevDateRange) ||
                const DeepCollectionEquality()
                    .equals(other.prevDateRange, prevDateRange)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(yearMonth) ^
      const DeepCollectionEquality().hash(prevDateRange);

  @JsonKey(ignore: true)
  @override
  $InitialCopyWith<Initial> get copyWith =>
      _$InitialCopyWithImpl<Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime yearMonth, DateRange prevDateRange)
        initial,
    required TResult Function(
            DateTime yearMonth, DateRange prevDateRange, DateTime day)
        day,
    required TResult Function(DateTime yearMonth, DateRange prevDateRange,
            DateTime start, DateTime end)
        range,
  }) {
    return initial(yearMonth, prevDateRange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime yearMonth, DateRange prevDateRange)? initial,
    TResult Function(DateTime yearMonth, DateRange prevDateRange, DateTime day)?
        day,
    TResult Function(DateTime yearMonth, DateRange prevDateRange,
            DateTime start, DateTime end)?
        range,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(yearMonth, prevDateRange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Day value) day,
    required TResult Function(Range value) range,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Day value)? day,
    TResult Function(Range value)? range,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial extends DatePickerState {
  const factory Initial(
      {required DateTime yearMonth,
      required DateRange prevDateRange}) = _$Initial;
  const Initial._() : super._();

  @override
  DateTime get yearMonth => throw _privateConstructorUsedError;
  @override
  DateRange get prevDateRange => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InitialCopyWith<Initial> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayCopyWith<$Res> implements $DatePickerStateCopyWith<$Res> {
  factory $DayCopyWith(Day value, $Res Function(Day) then) =
      _$DayCopyWithImpl<$Res>;
  @override
  $Res call({DateTime yearMonth, DateRange prevDateRange, DateTime day});

  @override
  $DateRangeCopyWith<$Res> get prevDateRange;
}

/// @nodoc
class _$DayCopyWithImpl<$Res> extends _$DatePickerStateCopyWithImpl<$Res>
    implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(Day _value, $Res Function(Day) _then)
      : super(_value, (v) => _then(v as Day));

  @override
  Day get _value => super._value as Day;

  @override
  $Res call({
    Object? yearMonth = freezed,
    Object? prevDateRange = freezed,
    Object? day = freezed,
  }) {
    return _then(Day(
      yearMonth: yearMonth == freezed
          ? _value.yearMonth
          : yearMonth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prevDateRange: prevDateRange == freezed
          ? _value.prevDateRange
          : prevDateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$Day extends Day with DiagnosticableTreeMixin {
  const _$Day(
      {required this.yearMonth, required this.prevDateRange, required this.day})
      : super._();

  @override
  final DateTime yearMonth;
  @override
  final DateRange prevDateRange;
  @override
  final DateTime day;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DatePickerState.day(yearMonth: $yearMonth, prevDateRange: $prevDateRange, day: $day)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DatePickerState.day'))
      ..add(DiagnosticsProperty('yearMonth', yearMonth))
      ..add(DiagnosticsProperty('prevDateRange', prevDateRange))
      ..add(DiagnosticsProperty('day', day));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Day &&
            (identical(other.yearMonth, yearMonth) ||
                const DeepCollectionEquality()
                    .equals(other.yearMonth, yearMonth)) &&
            (identical(other.prevDateRange, prevDateRange) ||
                const DeepCollectionEquality()
                    .equals(other.prevDateRange, prevDateRange)) &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(yearMonth) ^
      const DeepCollectionEquality().hash(prevDateRange) ^
      const DeepCollectionEquality().hash(day);

  @JsonKey(ignore: true)
  @override
  $DayCopyWith<Day> get copyWith => _$DayCopyWithImpl<Day>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime yearMonth, DateRange prevDateRange)
        initial,
    required TResult Function(
            DateTime yearMonth, DateRange prevDateRange, DateTime day)
        day,
    required TResult Function(DateTime yearMonth, DateRange prevDateRange,
            DateTime start, DateTime end)
        range,
  }) {
    return day(yearMonth, prevDateRange, this.day);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime yearMonth, DateRange prevDateRange)? initial,
    TResult Function(DateTime yearMonth, DateRange prevDateRange, DateTime day)?
        day,
    TResult Function(DateTime yearMonth, DateRange prevDateRange,
            DateTime start, DateTime end)?
        range,
    required TResult orElse(),
  }) {
    if (day != null) {
      return day(yearMonth, prevDateRange, this.day);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Day value) day,
    required TResult Function(Range value) range,
  }) {
    return day(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Day value)? day,
    TResult Function(Range value)? range,
    required TResult orElse(),
  }) {
    if (day != null) {
      return day(this);
    }
    return orElse();
  }
}

abstract class Day extends DatePickerState {
  const factory Day(
      {required DateTime yearMonth,
      required DateRange prevDateRange,
      required DateTime day}) = _$Day;
  const Day._() : super._();

  @override
  DateTime get yearMonth => throw _privateConstructorUsedError;
  @override
  DateRange get prevDateRange => throw _privateConstructorUsedError;
  DateTime get day => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $DayCopyWith<Day> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangeCopyWith<$Res> implements $DatePickerStateCopyWith<$Res> {
  factory $RangeCopyWith(Range value, $Res Function(Range) then) =
      _$RangeCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime yearMonth,
      DateRange prevDateRange,
      DateTime start,
      DateTime end});

  @override
  $DateRangeCopyWith<$Res> get prevDateRange;
}

/// @nodoc
class _$RangeCopyWithImpl<$Res> extends _$DatePickerStateCopyWithImpl<$Res>
    implements $RangeCopyWith<$Res> {
  _$RangeCopyWithImpl(Range _value, $Res Function(Range) _then)
      : super(_value, (v) => _then(v as Range));

  @override
  Range get _value => super._value as Range;

  @override
  $Res call({
    Object? yearMonth = freezed,
    Object? prevDateRange = freezed,
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(Range(
      yearMonth: yearMonth == freezed
          ? _value.yearMonth
          : yearMonth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      prevDateRange: prevDateRange == freezed
          ? _value.prevDateRange
          : prevDateRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: end == freezed
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$Range extends Range with DiagnosticableTreeMixin {
  const _$Range(
      {required this.yearMonth,
      required this.prevDateRange,
      required this.start,
      required this.end})
      : super._();

  @override
  final DateTime yearMonth;
  @override
  final DateRange prevDateRange;
  @override
  final DateTime start;
  @override
  final DateTime end;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DatePickerState.range(yearMonth: $yearMonth, prevDateRange: $prevDateRange, start: $start, end: $end)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DatePickerState.range'))
      ..add(DiagnosticsProperty('yearMonth', yearMonth))
      ..add(DiagnosticsProperty('prevDateRange', prevDateRange))
      ..add(DiagnosticsProperty('start', start))
      ..add(DiagnosticsProperty('end', end));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Range &&
            (identical(other.yearMonth, yearMonth) ||
                const DeepCollectionEquality()
                    .equals(other.yearMonth, yearMonth)) &&
            (identical(other.prevDateRange, prevDateRange) ||
                const DeepCollectionEquality()
                    .equals(other.prevDateRange, prevDateRange)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(yearMonth) ^
      const DeepCollectionEquality().hash(prevDateRange) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end);

  @JsonKey(ignore: true)
  @override
  $RangeCopyWith<Range> get copyWith =>
      _$RangeCopyWithImpl<Range>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime yearMonth, DateRange prevDateRange)
        initial,
    required TResult Function(
            DateTime yearMonth, DateRange prevDateRange, DateTime day)
        day,
    required TResult Function(DateTime yearMonth, DateRange prevDateRange,
            DateTime start, DateTime end)
        range,
  }) {
    return range(yearMonth, prevDateRange, start, end);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime yearMonth, DateRange prevDateRange)? initial,
    TResult Function(DateTime yearMonth, DateRange prevDateRange, DateTime day)?
        day,
    TResult Function(DateTime yearMonth, DateRange prevDateRange,
            DateTime start, DateTime end)?
        range,
    required TResult orElse(),
  }) {
    if (range != null) {
      return range(yearMonth, prevDateRange, start, end);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Day value) day,
    required TResult Function(Range value) range,
  }) {
    return range(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Day value)? day,
    TResult Function(Range value)? range,
    required TResult orElse(),
  }) {
    if (range != null) {
      return range(this);
    }
    return orElse();
  }
}

abstract class Range extends DatePickerState {
  const factory Range(
      {required DateTime yearMonth,
      required DateRange prevDateRange,
      required DateTime start,
      required DateTime end}) = _$Range;
  const Range._() : super._();

  @override
  DateTime get yearMonth => throw _privateConstructorUsedError;
  @override
  DateRange get prevDateRange => throw _privateConstructorUsedError;
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $RangeCopyWith<Range> get copyWith => throw _privateConstructorUsedError;
}
