// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'reminder_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReminderTableTearOff {
  const _$ReminderTableTearOff();

  _ReminderTable call({required String id, required int minutes}) {
    return _ReminderTable(
      id: id,
      minutes: minutes,
    );
  }
}

/// @nodoc
const $ReminderTable = _$ReminderTableTearOff();

/// @nodoc
mixin _$ReminderTable {
  String get id => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReminderTableCopyWith<ReminderTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderTableCopyWith<$Res> {
  factory $ReminderTableCopyWith(
          ReminderTable value, $Res Function(ReminderTable) then) =
      _$ReminderTableCopyWithImpl<$Res>;
  $Res call({String id, int minutes});
}

/// @nodoc
class _$ReminderTableCopyWithImpl<$Res>
    implements $ReminderTableCopyWith<$Res> {
  _$ReminderTableCopyWithImpl(this._value, this._then);

  final ReminderTable _value;
  // ignore: unused_field
  final $Res Function(ReminderTable) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? minutes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ReminderTableCopyWith<$Res>
    implements $ReminderTableCopyWith<$Res> {
  factory _$ReminderTableCopyWith(
          _ReminderTable value, $Res Function(_ReminderTable) then) =
      __$ReminderTableCopyWithImpl<$Res>;
  @override
  $Res call({String id, int minutes});
}

/// @nodoc
class __$ReminderTableCopyWithImpl<$Res>
    extends _$ReminderTableCopyWithImpl<$Res>
    implements _$ReminderTableCopyWith<$Res> {
  __$ReminderTableCopyWithImpl(
      _ReminderTable _value, $Res Function(_ReminderTable) _then)
      : super(_value, (v) => _then(v as _ReminderTable));

  @override
  _ReminderTable get _value => super._value as _ReminderTable;

  @override
  $Res call({
    Object? id = freezed,
    Object? minutes = freezed,
  }) {
    return _then(_ReminderTable(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      minutes: minutes == freezed
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ReminderTable extends _ReminderTable with DiagnosticableTreeMixin {
  _$_ReminderTable({required this.id, required this.minutes}) : super._();

  @override
  final String id;
  @override
  final int minutes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ReminderTable(id: $id, minutes: $minutes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ReminderTable'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('minutes', minutes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReminderTable &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.minutes, minutes) ||
                const DeepCollectionEquality().equals(other.minutes, minutes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(minutes);

  @JsonKey(ignore: true)
  @override
  _$ReminderTableCopyWith<_ReminderTable> get copyWith =>
      __$ReminderTableCopyWithImpl<_ReminderTable>(this, _$identity);
}

abstract class _ReminderTable extends ReminderTable {
  factory _ReminderTable({required String id, required int minutes}) =
      _$_ReminderTable;
  _ReminderTable._() : super._();

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  int get minutes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReminderTableCopyWith<_ReminderTable> get copyWith =>
      throw _privateConstructorUsedError;
}
