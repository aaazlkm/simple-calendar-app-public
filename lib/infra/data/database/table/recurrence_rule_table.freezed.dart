// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'recurrence_rule_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecurrenceRuleTableTearOff {
  const _$RecurrenceRuleTableTearOff();

  _RecurrenceRuleTable call(
      {required int recurrenceFrequency,
      required int interval,
      BuiltList<int>? dayOfWeeks,
      BuiltList<int>? dayOfMonths,
      BuiltList<int>? monthOfYears,
      Timestamp? endDate,
      int? count}) {
    return _RecurrenceRuleTable(
      recurrenceFrequency: recurrenceFrequency,
      interval: interval,
      dayOfWeeks: dayOfWeeks,
      dayOfMonths: dayOfMonths,
      monthOfYears: monthOfYears,
      endDate: endDate,
      count: count,
    );
  }
}

/// @nodoc
const $RecurrenceRuleTable = _$RecurrenceRuleTableTearOff();

/// @nodoc
mixin _$RecurrenceRuleTable {
  int get recurrenceFrequency => throw _privateConstructorUsedError;
  int get interval => throw _privateConstructorUsedError;

  /// when weekly
  BuiltList<int>? get dayOfWeeks => throw _privateConstructorUsedError;

  /// when monthly
  BuiltList<int>? get dayOfMonths => throw _privateConstructorUsedError;

  /// when yearly
  BuiltList<int>? get monthOfYears => throw _privateConstructorUsedError;

  /// 終了日
  /// [endDate]か[count]によって定まる
  /// どちらも存在しなければ、終了日はない
  Timestamp? get endDate => throw _privateConstructorUsedError;

  /// 終了日
  /// [endDate]か[count]によって定まる
  /// どちらも存在しなければ、終了日はない
  int? get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecurrenceRuleTableCopyWith<RecurrenceRuleTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurrenceRuleTableCopyWith<$Res> {
  factory $RecurrenceRuleTableCopyWith(
          RecurrenceRuleTable value, $Res Function(RecurrenceRuleTable) then) =
      _$RecurrenceRuleTableCopyWithImpl<$Res>;
  $Res call(
      {int recurrenceFrequency,
      int interval,
      BuiltList<int>? dayOfWeeks,
      BuiltList<int>? dayOfMonths,
      BuiltList<int>? monthOfYears,
      Timestamp? endDate,
      int? count});
}

/// @nodoc
class _$RecurrenceRuleTableCopyWithImpl<$Res>
    implements $RecurrenceRuleTableCopyWith<$Res> {
  _$RecurrenceRuleTableCopyWithImpl(this._value, this._then);

  final RecurrenceRuleTable _value;
  // ignore: unused_field
  final $Res Function(RecurrenceRuleTable) _then;

  @override
  $Res call({
    Object? recurrenceFrequency = freezed,
    Object? interval = freezed,
    Object? dayOfWeeks = freezed,
    Object? dayOfMonths = freezed,
    Object? monthOfYears = freezed,
    Object? endDate = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      recurrenceFrequency: recurrenceFrequency == freezed
          ? _value.recurrenceFrequency
          : recurrenceFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfWeeks: dayOfWeeks == freezed
          ? _value.dayOfWeeks
          : dayOfWeeks // ignore: cast_nullable_to_non_nullable
              as BuiltList<int>?,
      dayOfMonths: dayOfMonths == freezed
          ? _value.dayOfMonths
          : dayOfMonths // ignore: cast_nullable_to_non_nullable
              as BuiltList<int>?,
      monthOfYears: monthOfYears == freezed
          ? _value.monthOfYears
          : monthOfYears // ignore: cast_nullable_to_non_nullable
              as BuiltList<int>?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$RecurrenceRuleTableCopyWith<$Res>
    implements $RecurrenceRuleTableCopyWith<$Res> {
  factory _$RecurrenceRuleTableCopyWith(_RecurrenceRuleTable value,
          $Res Function(_RecurrenceRuleTable) then) =
      __$RecurrenceRuleTableCopyWithImpl<$Res>;
  @override
  $Res call(
      {int recurrenceFrequency,
      int interval,
      BuiltList<int>? dayOfWeeks,
      BuiltList<int>? dayOfMonths,
      BuiltList<int>? monthOfYears,
      Timestamp? endDate,
      int? count});
}

/// @nodoc
class __$RecurrenceRuleTableCopyWithImpl<$Res>
    extends _$RecurrenceRuleTableCopyWithImpl<$Res>
    implements _$RecurrenceRuleTableCopyWith<$Res> {
  __$RecurrenceRuleTableCopyWithImpl(
      _RecurrenceRuleTable _value, $Res Function(_RecurrenceRuleTable) _then)
      : super(_value, (v) => _then(v as _RecurrenceRuleTable));

  @override
  _RecurrenceRuleTable get _value => super._value as _RecurrenceRuleTable;

  @override
  $Res call({
    Object? recurrenceFrequency = freezed,
    Object? interval = freezed,
    Object? dayOfWeeks = freezed,
    Object? dayOfMonths = freezed,
    Object? monthOfYears = freezed,
    Object? endDate = freezed,
    Object? count = freezed,
  }) {
    return _then(_RecurrenceRuleTable(
      recurrenceFrequency: recurrenceFrequency == freezed
          ? _value.recurrenceFrequency
          : recurrenceFrequency // ignore: cast_nullable_to_non_nullable
              as int,
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfWeeks: dayOfWeeks == freezed
          ? _value.dayOfWeeks
          : dayOfWeeks // ignore: cast_nullable_to_non_nullable
              as BuiltList<int>?,
      dayOfMonths: dayOfMonths == freezed
          ? _value.dayOfMonths
          : dayOfMonths // ignore: cast_nullable_to_non_nullable
              as BuiltList<int>?,
      monthOfYears: monthOfYears == freezed
          ? _value.monthOfYears
          : monthOfYears // ignore: cast_nullable_to_non_nullable
              as BuiltList<int>?,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_RecurrenceRuleTable extends _RecurrenceRuleTable
    with DiagnosticableTreeMixin {
  _$_RecurrenceRuleTable(
      {required this.recurrenceFrequency,
      required this.interval,
      this.dayOfWeeks,
      this.dayOfMonths,
      this.monthOfYears,
      this.endDate,
      this.count})
      : super._();

  @override
  final int recurrenceFrequency;
  @override
  final int interval;
  @override

  /// when weekly
  final BuiltList<int>? dayOfWeeks;
  @override

  /// when monthly
  final BuiltList<int>? dayOfMonths;
  @override

  /// when yearly
  final BuiltList<int>? monthOfYears;
  @override

  /// 終了日
  /// [endDate]か[count]によって定まる
  /// どちらも存在しなければ、終了日はない
  final Timestamp? endDate;
  @override

  /// 終了日
  /// [endDate]か[count]によって定まる
  /// どちらも存在しなければ、終了日はない
  final int? count;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecurrenceRuleTable(recurrenceFrequency: $recurrenceFrequency, interval: $interval, dayOfWeeks: $dayOfWeeks, dayOfMonths: $dayOfMonths, monthOfYears: $monthOfYears, endDate: $endDate, count: $count)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecurrenceRuleTable'))
      ..add(DiagnosticsProperty('recurrenceFrequency', recurrenceFrequency))
      ..add(DiagnosticsProperty('interval', interval))
      ..add(DiagnosticsProperty('dayOfWeeks', dayOfWeeks))
      ..add(DiagnosticsProperty('dayOfMonths', dayOfMonths))
      ..add(DiagnosticsProperty('monthOfYears', monthOfYears))
      ..add(DiagnosticsProperty('endDate', endDate))
      ..add(DiagnosticsProperty('count', count));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecurrenceRuleTable &&
            (identical(other.recurrenceFrequency, recurrenceFrequency) ||
                const DeepCollectionEquality()
                    .equals(other.recurrenceFrequency, recurrenceFrequency)) &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.dayOfWeeks, dayOfWeeks) ||
                const DeepCollectionEquality()
                    .equals(other.dayOfWeeks, dayOfWeeks)) &&
            (identical(other.dayOfMonths, dayOfMonths) ||
                const DeepCollectionEquality()
                    .equals(other.dayOfMonths, dayOfMonths)) &&
            (identical(other.monthOfYears, monthOfYears) ||
                const DeepCollectionEquality()
                    .equals(other.monthOfYears, monthOfYears)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(recurrenceFrequency) ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(dayOfWeeks) ^
      const DeepCollectionEquality().hash(dayOfMonths) ^
      const DeepCollectionEquality().hash(monthOfYears) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$RecurrenceRuleTableCopyWith<_RecurrenceRuleTable> get copyWith =>
      __$RecurrenceRuleTableCopyWithImpl<_RecurrenceRuleTable>(
          this, _$identity);
}

abstract class _RecurrenceRuleTable extends RecurrenceRuleTable {
  factory _RecurrenceRuleTable(
      {required int recurrenceFrequency,
      required int interval,
      BuiltList<int>? dayOfWeeks,
      BuiltList<int>? dayOfMonths,
      BuiltList<int>? monthOfYears,
      Timestamp? endDate,
      int? count}) = _$_RecurrenceRuleTable;
  _RecurrenceRuleTable._() : super._();

  @override
  int get recurrenceFrequency => throw _privateConstructorUsedError;
  @override
  int get interval => throw _privateConstructorUsedError;
  @override

  /// when weekly
  BuiltList<int>? get dayOfWeeks => throw _privateConstructorUsedError;
  @override

  /// when monthly
  BuiltList<int>? get dayOfMonths => throw _privateConstructorUsedError;
  @override

  /// when yearly
  BuiltList<int>? get monthOfYears => throw _privateConstructorUsedError;
  @override

  /// 終了日
  /// [endDate]か[count]によって定まる
  /// どちらも存在しなければ、終了日はない
  Timestamp? get endDate => throw _privateConstructorUsedError;
  @override

  /// 終了日
  /// [endDate]か[count]によって定まる
  /// どちらも存在しなければ、終了日はない
  int? get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecurrenceRuleTableCopyWith<_RecurrenceRuleTable> get copyWith =>
      throw _privateConstructorUsedError;
}
