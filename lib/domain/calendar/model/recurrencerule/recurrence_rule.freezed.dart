// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'recurrence_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RecurrenceRuleTearOff {
  const _$RecurrenceRuleTearOff();

  _RecurrenceRuleDaily daily(
      {required int interval,
      RecurrenceFrequency recurrenceFrequency = RecurrenceFrequency.daily,
      TZDateTime? endDate,
      int? count}) {
    return _RecurrenceRuleDaily(
      interval: interval,
      recurrenceFrequency: recurrenceFrequency,
      endDate: endDate,
      count: count,
    );
  }

  _RecurrenceRuleWeekly weekly(
      {required int interval,
      required BuiltList<DayOfWeek> dayOfWeeks,
      RecurrenceFrequency recurrenceFrequency = RecurrenceFrequency.weekly,
      TZDateTime? endDate,
      int? count}) {
    return _RecurrenceRuleWeekly(
      interval: interval,
      dayOfWeeks: dayOfWeeks,
      recurrenceFrequency: recurrenceFrequency,
      endDate: endDate,
      count: count,
    );
  }

  _RecurrenceRuleMonthly monthly(
      {required int interval,
      required BuiltList<int> dayOfMonths,
      RecurrenceFrequency recurrenceFrequency = RecurrenceFrequency.monthly,
      TZDateTime? endDate,
      int? count}) {
    return _RecurrenceRuleMonthly(
      interval: interval,
      dayOfMonths: dayOfMonths,
      recurrenceFrequency: recurrenceFrequency,
      endDate: endDate,
      count: count,
    );
  }

  _RecurrenceRuleYearly yearly(
      {required int interval,
      required BuiltList<MonthOfYear> monthOfYears,
      RecurrenceFrequency recurrenceFrequency = RecurrenceFrequency.yearly,
      TZDateTime? endDate,
      int? count}) {
    return _RecurrenceRuleYearly(
      interval: interval,
      monthOfYears: monthOfYears,
      recurrenceFrequency: recurrenceFrequency,
      endDate: endDate,
      count: count,
    );
  }
}

/// @nodoc
const $RecurrenceRule = _$RecurrenceRuleTearOff();

/// @nodoc
mixin _$RecurrenceRule {
  int get interval => throw _privateConstructorUsedError;
  RecurrenceFrequency get recurrenceFrequency =>
      throw _privateConstructorUsedError;
  TZDateTime? get endDate => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int interval,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        daily,
    required TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        weekly,
    required TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        monthly,
    required TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        yearly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int interval, RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate, int? count)?
        daily,
    TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        weekly,
    TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        monthly,
    TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        yearly,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecurrenceRuleDaily value) daily,
    required TResult Function(_RecurrenceRuleWeekly value) weekly,
    required TResult Function(_RecurrenceRuleMonthly value) monthly,
    required TResult Function(_RecurrenceRuleYearly value) yearly,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecurrenceRuleDaily value)? daily,
    TResult Function(_RecurrenceRuleWeekly value)? weekly,
    TResult Function(_RecurrenceRuleMonthly value)? monthly,
    TResult Function(_RecurrenceRuleYearly value)? yearly,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecurrenceRuleCopyWith<RecurrenceRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurrenceRuleCopyWith<$Res> {
  factory $RecurrenceRuleCopyWith(
          RecurrenceRule value, $Res Function(RecurrenceRule) then) =
      _$RecurrenceRuleCopyWithImpl<$Res>;
  $Res call(
      {int interval,
      RecurrenceFrequency recurrenceFrequency,
      TZDateTime? endDate,
      int? count});
}

/// @nodoc
class _$RecurrenceRuleCopyWithImpl<$Res>
    implements $RecurrenceRuleCopyWith<$Res> {
  _$RecurrenceRuleCopyWithImpl(this._value, this._then);

  final RecurrenceRule _value;
  // ignore: unused_field
  final $Res Function(RecurrenceRule) _then;

  @override
  $Res call({
    Object? interval = freezed,
    Object? recurrenceFrequency = freezed,
    Object? endDate = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      recurrenceFrequency: recurrenceFrequency == freezed
          ? _value.recurrenceFrequency
          : recurrenceFrequency // ignore: cast_nullable_to_non_nullable
              as RecurrenceFrequency,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as TZDateTime?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$RecurrenceRuleDailyCopyWith<$Res>
    implements $RecurrenceRuleCopyWith<$Res> {
  factory _$RecurrenceRuleDailyCopyWith(_RecurrenceRuleDaily value,
          $Res Function(_RecurrenceRuleDaily) then) =
      __$RecurrenceRuleDailyCopyWithImpl<$Res>;
  @override
  $Res call(
      {int interval,
      RecurrenceFrequency recurrenceFrequency,
      TZDateTime? endDate,
      int? count});
}

/// @nodoc
class __$RecurrenceRuleDailyCopyWithImpl<$Res>
    extends _$RecurrenceRuleCopyWithImpl<$Res>
    implements _$RecurrenceRuleDailyCopyWith<$Res> {
  __$RecurrenceRuleDailyCopyWithImpl(
      _RecurrenceRuleDaily _value, $Res Function(_RecurrenceRuleDaily) _then)
      : super(_value, (v) => _then(v as _RecurrenceRuleDaily));

  @override
  _RecurrenceRuleDaily get _value => super._value as _RecurrenceRuleDaily;

  @override
  $Res call({
    Object? interval = freezed,
    Object? recurrenceFrequency = freezed,
    Object? endDate = freezed,
    Object? count = freezed,
  }) {
    return _then(_RecurrenceRuleDaily(
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      recurrenceFrequency: recurrenceFrequency == freezed
          ? _value.recurrenceFrequency
          : recurrenceFrequency // ignore: cast_nullable_to_non_nullable
              as RecurrenceFrequency,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as TZDateTime?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_RecurrenceRuleDaily extends _RecurrenceRuleDaily {
  const _$_RecurrenceRuleDaily(
      {required this.interval,
      this.recurrenceFrequency = RecurrenceFrequency.daily,
      this.endDate,
      this.count})
      : super._();

  @override
  final int interval;
  @JsonKey(defaultValue: RecurrenceFrequency.daily)
  @override
  final RecurrenceFrequency recurrenceFrequency;
  @override
  final TZDateTime? endDate;
  @override
  final int? count;

  @override
  String toString() {
    return 'RecurrenceRule.daily(interval: $interval, recurrenceFrequency: $recurrenceFrequency, endDate: $endDate, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecurrenceRuleDaily &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.recurrenceFrequency, recurrenceFrequency) ||
                const DeepCollectionEquality()
                    .equals(other.recurrenceFrequency, recurrenceFrequency)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(recurrenceFrequency) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$RecurrenceRuleDailyCopyWith<_RecurrenceRuleDaily> get copyWith =>
      __$RecurrenceRuleDailyCopyWithImpl<_RecurrenceRuleDaily>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int interval,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        daily,
    required TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        weekly,
    required TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        monthly,
    required TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        yearly,
  }) {
    return daily(interval, recurrenceFrequency, endDate, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int interval, RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate, int? count)?
        daily,
    TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        weekly,
    TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        monthly,
    TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        yearly,
    required TResult orElse(),
  }) {
    if (daily != null) {
      return daily(interval, recurrenceFrequency, endDate, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecurrenceRuleDaily value) daily,
    required TResult Function(_RecurrenceRuleWeekly value) weekly,
    required TResult Function(_RecurrenceRuleMonthly value) monthly,
    required TResult Function(_RecurrenceRuleYearly value) yearly,
  }) {
    return daily(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecurrenceRuleDaily value)? daily,
    TResult Function(_RecurrenceRuleWeekly value)? weekly,
    TResult Function(_RecurrenceRuleMonthly value)? monthly,
    TResult Function(_RecurrenceRuleYearly value)? yearly,
    required TResult orElse(),
  }) {
    if (daily != null) {
      return daily(this);
    }
    return orElse();
  }
}

abstract class _RecurrenceRuleDaily extends RecurrenceRule {
  const factory _RecurrenceRuleDaily(
      {required int interval,
      RecurrenceFrequency recurrenceFrequency,
      TZDateTime? endDate,
      int? count}) = _$_RecurrenceRuleDaily;
  const _RecurrenceRuleDaily._() : super._();

  @override
  int get interval => throw _privateConstructorUsedError;
  @override
  RecurrenceFrequency get recurrenceFrequency =>
      throw _privateConstructorUsedError;
  @override
  TZDateTime? get endDate => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecurrenceRuleDailyCopyWith<_RecurrenceRuleDaily> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RecurrenceRuleWeeklyCopyWith<$Res>
    implements $RecurrenceRuleCopyWith<$Res> {
  factory _$RecurrenceRuleWeeklyCopyWith(_RecurrenceRuleWeekly value,
          $Res Function(_RecurrenceRuleWeekly) then) =
      __$RecurrenceRuleWeeklyCopyWithImpl<$Res>;
  @override
  $Res call(
      {int interval,
      BuiltList<DayOfWeek> dayOfWeeks,
      RecurrenceFrequency recurrenceFrequency,
      TZDateTime? endDate,
      int? count});
}

/// @nodoc
class __$RecurrenceRuleWeeklyCopyWithImpl<$Res>
    extends _$RecurrenceRuleCopyWithImpl<$Res>
    implements _$RecurrenceRuleWeeklyCopyWith<$Res> {
  __$RecurrenceRuleWeeklyCopyWithImpl(
      _RecurrenceRuleWeekly _value, $Res Function(_RecurrenceRuleWeekly) _then)
      : super(_value, (v) => _then(v as _RecurrenceRuleWeekly));

  @override
  _RecurrenceRuleWeekly get _value => super._value as _RecurrenceRuleWeekly;

  @override
  $Res call({
    Object? interval = freezed,
    Object? dayOfWeeks = freezed,
    Object? recurrenceFrequency = freezed,
    Object? endDate = freezed,
    Object? count = freezed,
  }) {
    return _then(_RecurrenceRuleWeekly(
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfWeeks: dayOfWeeks == freezed
          ? _value.dayOfWeeks
          : dayOfWeeks // ignore: cast_nullable_to_non_nullable
              as BuiltList<DayOfWeek>,
      recurrenceFrequency: recurrenceFrequency == freezed
          ? _value.recurrenceFrequency
          : recurrenceFrequency // ignore: cast_nullable_to_non_nullable
              as RecurrenceFrequency,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as TZDateTime?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_RecurrenceRuleWeekly extends _RecurrenceRuleWeekly {
  const _$_RecurrenceRuleWeekly(
      {required this.interval,
      required this.dayOfWeeks,
      this.recurrenceFrequency = RecurrenceFrequency.weekly,
      this.endDate,
      this.count})
      : super._();

  @override
  final int interval;
  @override
  final BuiltList<DayOfWeek> dayOfWeeks;
  @JsonKey(defaultValue: RecurrenceFrequency.weekly)
  @override
  final RecurrenceFrequency recurrenceFrequency;
  @override
  final TZDateTime? endDate;
  @override
  final int? count;

  @override
  String toString() {
    return 'RecurrenceRule.weekly(interval: $interval, dayOfWeeks: $dayOfWeeks, recurrenceFrequency: $recurrenceFrequency, endDate: $endDate, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecurrenceRuleWeekly &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.dayOfWeeks, dayOfWeeks) ||
                const DeepCollectionEquality()
                    .equals(other.dayOfWeeks, dayOfWeeks)) &&
            (identical(other.recurrenceFrequency, recurrenceFrequency) ||
                const DeepCollectionEquality()
                    .equals(other.recurrenceFrequency, recurrenceFrequency)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(dayOfWeeks) ^
      const DeepCollectionEquality().hash(recurrenceFrequency) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$RecurrenceRuleWeeklyCopyWith<_RecurrenceRuleWeekly> get copyWith =>
      __$RecurrenceRuleWeeklyCopyWithImpl<_RecurrenceRuleWeekly>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int interval,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        daily,
    required TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        weekly,
    required TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        monthly,
    required TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        yearly,
  }) {
    return weekly(interval, dayOfWeeks, recurrenceFrequency, endDate, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int interval, RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate, int? count)?
        daily,
    TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        weekly,
    TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        monthly,
    TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        yearly,
    required TResult orElse(),
  }) {
    if (weekly != null) {
      return weekly(interval, dayOfWeeks, recurrenceFrequency, endDate, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecurrenceRuleDaily value) daily,
    required TResult Function(_RecurrenceRuleWeekly value) weekly,
    required TResult Function(_RecurrenceRuleMonthly value) monthly,
    required TResult Function(_RecurrenceRuleYearly value) yearly,
  }) {
    return weekly(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecurrenceRuleDaily value)? daily,
    TResult Function(_RecurrenceRuleWeekly value)? weekly,
    TResult Function(_RecurrenceRuleMonthly value)? monthly,
    TResult Function(_RecurrenceRuleYearly value)? yearly,
    required TResult orElse(),
  }) {
    if (weekly != null) {
      return weekly(this);
    }
    return orElse();
  }
}

abstract class _RecurrenceRuleWeekly extends RecurrenceRule {
  const factory _RecurrenceRuleWeekly(
      {required int interval,
      required BuiltList<DayOfWeek> dayOfWeeks,
      RecurrenceFrequency recurrenceFrequency,
      TZDateTime? endDate,
      int? count}) = _$_RecurrenceRuleWeekly;
  const _RecurrenceRuleWeekly._() : super._();

  @override
  int get interval => throw _privateConstructorUsedError;
  BuiltList<DayOfWeek> get dayOfWeeks => throw _privateConstructorUsedError;
  @override
  RecurrenceFrequency get recurrenceFrequency =>
      throw _privateConstructorUsedError;
  @override
  TZDateTime? get endDate => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecurrenceRuleWeeklyCopyWith<_RecurrenceRuleWeekly> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RecurrenceRuleMonthlyCopyWith<$Res>
    implements $RecurrenceRuleCopyWith<$Res> {
  factory _$RecurrenceRuleMonthlyCopyWith(_RecurrenceRuleMonthly value,
          $Res Function(_RecurrenceRuleMonthly) then) =
      __$RecurrenceRuleMonthlyCopyWithImpl<$Res>;
  @override
  $Res call(
      {int interval,
      BuiltList<int> dayOfMonths,
      RecurrenceFrequency recurrenceFrequency,
      TZDateTime? endDate,
      int? count});
}

/// @nodoc
class __$RecurrenceRuleMonthlyCopyWithImpl<$Res>
    extends _$RecurrenceRuleCopyWithImpl<$Res>
    implements _$RecurrenceRuleMonthlyCopyWith<$Res> {
  __$RecurrenceRuleMonthlyCopyWithImpl(_RecurrenceRuleMonthly _value,
      $Res Function(_RecurrenceRuleMonthly) _then)
      : super(_value, (v) => _then(v as _RecurrenceRuleMonthly));

  @override
  _RecurrenceRuleMonthly get _value => super._value as _RecurrenceRuleMonthly;

  @override
  $Res call({
    Object? interval = freezed,
    Object? dayOfMonths = freezed,
    Object? recurrenceFrequency = freezed,
    Object? endDate = freezed,
    Object? count = freezed,
  }) {
    return _then(_RecurrenceRuleMonthly(
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfMonths: dayOfMonths == freezed
          ? _value.dayOfMonths
          : dayOfMonths // ignore: cast_nullable_to_non_nullable
              as BuiltList<int>,
      recurrenceFrequency: recurrenceFrequency == freezed
          ? _value.recurrenceFrequency
          : recurrenceFrequency // ignore: cast_nullable_to_non_nullable
              as RecurrenceFrequency,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as TZDateTime?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_RecurrenceRuleMonthly extends _RecurrenceRuleMonthly {
  const _$_RecurrenceRuleMonthly(
      {required this.interval,
      required this.dayOfMonths,
      this.recurrenceFrequency = RecurrenceFrequency.monthly,
      this.endDate,
      this.count})
      : super._();

  @override
  final int interval;
  @override
  final BuiltList<int> dayOfMonths;
  @JsonKey(defaultValue: RecurrenceFrequency.monthly)
  @override
  final RecurrenceFrequency recurrenceFrequency;
  @override
  final TZDateTime? endDate;
  @override
  final int? count;

  @override
  String toString() {
    return 'RecurrenceRule.monthly(interval: $interval, dayOfMonths: $dayOfMonths, recurrenceFrequency: $recurrenceFrequency, endDate: $endDate, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecurrenceRuleMonthly &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.dayOfMonths, dayOfMonths) ||
                const DeepCollectionEquality()
                    .equals(other.dayOfMonths, dayOfMonths)) &&
            (identical(other.recurrenceFrequency, recurrenceFrequency) ||
                const DeepCollectionEquality()
                    .equals(other.recurrenceFrequency, recurrenceFrequency)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(dayOfMonths) ^
      const DeepCollectionEquality().hash(recurrenceFrequency) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$RecurrenceRuleMonthlyCopyWith<_RecurrenceRuleMonthly> get copyWith =>
      __$RecurrenceRuleMonthlyCopyWithImpl<_RecurrenceRuleMonthly>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int interval,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        daily,
    required TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        weekly,
    required TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        monthly,
    required TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        yearly,
  }) {
    return monthly(interval, dayOfMonths, recurrenceFrequency, endDate, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int interval, RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate, int? count)?
        daily,
    TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        weekly,
    TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        monthly,
    TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        yearly,
    required TResult orElse(),
  }) {
    if (monthly != null) {
      return monthly(
          interval, dayOfMonths, recurrenceFrequency, endDate, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecurrenceRuleDaily value) daily,
    required TResult Function(_RecurrenceRuleWeekly value) weekly,
    required TResult Function(_RecurrenceRuleMonthly value) monthly,
    required TResult Function(_RecurrenceRuleYearly value) yearly,
  }) {
    return monthly(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecurrenceRuleDaily value)? daily,
    TResult Function(_RecurrenceRuleWeekly value)? weekly,
    TResult Function(_RecurrenceRuleMonthly value)? monthly,
    TResult Function(_RecurrenceRuleYearly value)? yearly,
    required TResult orElse(),
  }) {
    if (monthly != null) {
      return monthly(this);
    }
    return orElse();
  }
}

abstract class _RecurrenceRuleMonthly extends RecurrenceRule {
  const factory _RecurrenceRuleMonthly(
      {required int interval,
      required BuiltList<int> dayOfMonths,
      RecurrenceFrequency recurrenceFrequency,
      TZDateTime? endDate,
      int? count}) = _$_RecurrenceRuleMonthly;
  const _RecurrenceRuleMonthly._() : super._();

  @override
  int get interval => throw _privateConstructorUsedError;
  BuiltList<int> get dayOfMonths => throw _privateConstructorUsedError;
  @override
  RecurrenceFrequency get recurrenceFrequency =>
      throw _privateConstructorUsedError;
  @override
  TZDateTime? get endDate => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecurrenceRuleMonthlyCopyWith<_RecurrenceRuleMonthly> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$RecurrenceRuleYearlyCopyWith<$Res>
    implements $RecurrenceRuleCopyWith<$Res> {
  factory _$RecurrenceRuleYearlyCopyWith(_RecurrenceRuleYearly value,
          $Res Function(_RecurrenceRuleYearly) then) =
      __$RecurrenceRuleYearlyCopyWithImpl<$Res>;
  @override
  $Res call(
      {int interval,
      BuiltList<MonthOfYear> monthOfYears,
      RecurrenceFrequency recurrenceFrequency,
      TZDateTime? endDate,
      int? count});
}

/// @nodoc
class __$RecurrenceRuleYearlyCopyWithImpl<$Res>
    extends _$RecurrenceRuleCopyWithImpl<$Res>
    implements _$RecurrenceRuleYearlyCopyWith<$Res> {
  __$RecurrenceRuleYearlyCopyWithImpl(
      _RecurrenceRuleYearly _value, $Res Function(_RecurrenceRuleYearly) _then)
      : super(_value, (v) => _then(v as _RecurrenceRuleYearly));

  @override
  _RecurrenceRuleYearly get _value => super._value as _RecurrenceRuleYearly;

  @override
  $Res call({
    Object? interval = freezed,
    Object? monthOfYears = freezed,
    Object? recurrenceFrequency = freezed,
    Object? endDate = freezed,
    Object? count = freezed,
  }) {
    return _then(_RecurrenceRuleYearly(
      interval: interval == freezed
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      monthOfYears: monthOfYears == freezed
          ? _value.monthOfYears
          : monthOfYears // ignore: cast_nullable_to_non_nullable
              as BuiltList<MonthOfYear>,
      recurrenceFrequency: recurrenceFrequency == freezed
          ? _value.recurrenceFrequency
          : recurrenceFrequency // ignore: cast_nullable_to_non_nullable
              as RecurrenceFrequency,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as TZDateTime?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_RecurrenceRuleYearly extends _RecurrenceRuleYearly {
  const _$_RecurrenceRuleYearly(
      {required this.interval,
      required this.monthOfYears,
      this.recurrenceFrequency = RecurrenceFrequency.yearly,
      this.endDate,
      this.count})
      : super._();

  @override
  final int interval;
  @override
  final BuiltList<MonthOfYear> monthOfYears;
  @JsonKey(defaultValue: RecurrenceFrequency.yearly)
  @override
  final RecurrenceFrequency recurrenceFrequency;
  @override
  final TZDateTime? endDate;
  @override
  final int? count;

  @override
  String toString() {
    return 'RecurrenceRule.yearly(interval: $interval, monthOfYears: $monthOfYears, recurrenceFrequency: $recurrenceFrequency, endDate: $endDate, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RecurrenceRuleYearly &&
            (identical(other.interval, interval) ||
                const DeepCollectionEquality()
                    .equals(other.interval, interval)) &&
            (identical(other.monthOfYears, monthOfYears) ||
                const DeepCollectionEquality()
                    .equals(other.monthOfYears, monthOfYears)) &&
            (identical(other.recurrenceFrequency, recurrenceFrequency) ||
                const DeepCollectionEquality()
                    .equals(other.recurrenceFrequency, recurrenceFrequency)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.count, count) ||
                const DeepCollectionEquality().equals(other.count, count)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(interval) ^
      const DeepCollectionEquality().hash(monthOfYears) ^
      const DeepCollectionEquality().hash(recurrenceFrequency) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(count);

  @JsonKey(ignore: true)
  @override
  _$RecurrenceRuleYearlyCopyWith<_RecurrenceRuleYearly> get copyWith =>
      __$RecurrenceRuleYearlyCopyWithImpl<_RecurrenceRuleYearly>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int interval,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        daily,
    required TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        weekly,
    required TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        monthly,
    required TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)
        yearly,
  }) {
    return yearly(interval, monthOfYears, recurrenceFrequency, endDate, count);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int interval, RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate, int? count)?
        daily,
    TResult Function(
            int interval,
            BuiltList<DayOfWeek> dayOfWeeks,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        weekly,
    TResult Function(
            int interval,
            BuiltList<int> dayOfMonths,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        monthly,
    TResult Function(
            int interval,
            BuiltList<MonthOfYear> monthOfYears,
            RecurrenceFrequency recurrenceFrequency,
            TZDateTime? endDate,
            int? count)?
        yearly,
    required TResult orElse(),
  }) {
    if (yearly != null) {
      return yearly(
          interval, monthOfYears, recurrenceFrequency, endDate, count);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecurrenceRuleDaily value) daily,
    required TResult Function(_RecurrenceRuleWeekly value) weekly,
    required TResult Function(_RecurrenceRuleMonthly value) monthly,
    required TResult Function(_RecurrenceRuleYearly value) yearly,
  }) {
    return yearly(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecurrenceRuleDaily value)? daily,
    TResult Function(_RecurrenceRuleWeekly value)? weekly,
    TResult Function(_RecurrenceRuleMonthly value)? monthly,
    TResult Function(_RecurrenceRuleYearly value)? yearly,
    required TResult orElse(),
  }) {
    if (yearly != null) {
      return yearly(this);
    }
    return orElse();
  }
}

abstract class _RecurrenceRuleYearly extends RecurrenceRule {
  const factory _RecurrenceRuleYearly(
      {required int interval,
      required BuiltList<MonthOfYear> monthOfYears,
      RecurrenceFrequency recurrenceFrequency,
      TZDateTime? endDate,
      int? count}) = _$_RecurrenceRuleYearly;
  const _RecurrenceRuleYearly._() : super._();

  @override
  int get interval => throw _privateConstructorUsedError;
  BuiltList<MonthOfYear> get monthOfYears => throw _privateConstructorUsedError;
  @override
  RecurrenceFrequency get recurrenceFrequency =>
      throw _privateConstructorUsedError;
  @override
  TZDateTime? get endDate => throw _privateConstructorUsedError;
  @override
  int? get count => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RecurrenceRuleYearlyCopyWith<_RecurrenceRuleYearly> get copyWith =>
      throw _privateConstructorUsedError;
}
