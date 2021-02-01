// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'holiday_device_calendar_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HolidayDeviceCalendarTableTearOff {
  const _$HolidayDeviceCalendarTableTearOff();

  _HolidayDeviceCalendarTable call({required String id}) {
    return _HolidayDeviceCalendarTable(
      id: id,
    );
  }
}

/// @nodoc
const $HolidayDeviceCalendarTable = _$HolidayDeviceCalendarTableTearOff();

/// @nodoc
mixin _$HolidayDeviceCalendarTable {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HolidayDeviceCalendarTableCopyWith<HolidayDeviceCalendarTable>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayDeviceCalendarTableCopyWith<$Res> {
  factory $HolidayDeviceCalendarTableCopyWith(HolidayDeviceCalendarTable value,
          $Res Function(HolidayDeviceCalendarTable) then) =
      _$HolidayDeviceCalendarTableCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class _$HolidayDeviceCalendarTableCopyWithImpl<$Res>
    implements $HolidayDeviceCalendarTableCopyWith<$Res> {
  _$HolidayDeviceCalendarTableCopyWithImpl(this._value, this._then);

  final HolidayDeviceCalendarTable _value;
  // ignore: unused_field
  final $Res Function(HolidayDeviceCalendarTable) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$HolidayDeviceCalendarTableCopyWith<$Res>
    implements $HolidayDeviceCalendarTableCopyWith<$Res> {
  factory _$HolidayDeviceCalendarTableCopyWith(
          _HolidayDeviceCalendarTable value,
          $Res Function(_HolidayDeviceCalendarTable) then) =
      __$HolidayDeviceCalendarTableCopyWithImpl<$Res>;
  @override
  $Res call({String id});
}

/// @nodoc
class __$HolidayDeviceCalendarTableCopyWithImpl<$Res>
    extends _$HolidayDeviceCalendarTableCopyWithImpl<$Res>
    implements _$HolidayDeviceCalendarTableCopyWith<$Res> {
  __$HolidayDeviceCalendarTableCopyWithImpl(_HolidayDeviceCalendarTable _value,
      $Res Function(_HolidayDeviceCalendarTable) _then)
      : super(_value, (v) => _then(v as _HolidayDeviceCalendarTable));

  @override
  _HolidayDeviceCalendarTable get _value =>
      super._value as _HolidayDeviceCalendarTable;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_HolidayDeviceCalendarTable(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HolidayDeviceCalendarTable extends _HolidayDeviceCalendarTable
    with DiagnosticableTreeMixin {
  const _$_HolidayDeviceCalendarTable({required this.id}) : super._();

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HolidayDeviceCalendarTable(id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HolidayDeviceCalendarTable'))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HolidayDeviceCalendarTable &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$HolidayDeviceCalendarTableCopyWith<_HolidayDeviceCalendarTable>
      get copyWith => __$HolidayDeviceCalendarTableCopyWithImpl<
          _HolidayDeviceCalendarTable>(this, _$identity);
}

abstract class _HolidayDeviceCalendarTable extends HolidayDeviceCalendarTable {
  const factory _HolidayDeviceCalendarTable({required String id}) =
      _$_HolidayDeviceCalendarTable;
  const _HolidayDeviceCalendarTable._() : super._();

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HolidayDeviceCalendarTableCopyWith<_HolidayDeviceCalendarTable>
      get copyWith => throw _privateConstructorUsedError;
}
