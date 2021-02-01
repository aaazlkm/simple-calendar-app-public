// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'holiday_device_calendar_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HolidayDeviceCalendarListTearOff {
  const _$HolidayDeviceCalendarListTearOff();

  _HolidayDeviceCalendarList call({required BuiltList<DeviceCalendarId> ids}) {
    return _HolidayDeviceCalendarList(
      ids: ids,
    );
  }
}

/// @nodoc
const $HolidayDeviceCalendarList = _$HolidayDeviceCalendarListTearOff();

/// @nodoc
mixin _$HolidayDeviceCalendarList {
  BuiltList<DeviceCalendarId> get ids => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HolidayDeviceCalendarListCopyWith<HolidayDeviceCalendarList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayDeviceCalendarListCopyWith<$Res> {
  factory $HolidayDeviceCalendarListCopyWith(HolidayDeviceCalendarList value,
          $Res Function(HolidayDeviceCalendarList) then) =
      _$HolidayDeviceCalendarListCopyWithImpl<$Res>;
  $Res call({BuiltList<DeviceCalendarId> ids});
}

/// @nodoc
class _$HolidayDeviceCalendarListCopyWithImpl<$Res>
    implements $HolidayDeviceCalendarListCopyWith<$Res> {
  _$HolidayDeviceCalendarListCopyWithImpl(this._value, this._then);

  final HolidayDeviceCalendarList _value;
  // ignore: unused_field
  final $Res Function(HolidayDeviceCalendarList) _then;

  @override
  $Res call({
    Object? ids = freezed,
  }) {
    return _then(_value.copyWith(
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as BuiltList<DeviceCalendarId>,
    ));
  }
}

/// @nodoc
abstract class _$HolidayDeviceCalendarListCopyWith<$Res>
    implements $HolidayDeviceCalendarListCopyWith<$Res> {
  factory _$HolidayDeviceCalendarListCopyWith(_HolidayDeviceCalendarList value,
          $Res Function(_HolidayDeviceCalendarList) then) =
      __$HolidayDeviceCalendarListCopyWithImpl<$Res>;
  @override
  $Res call({BuiltList<DeviceCalendarId> ids});
}

/// @nodoc
class __$HolidayDeviceCalendarListCopyWithImpl<$Res>
    extends _$HolidayDeviceCalendarListCopyWithImpl<$Res>
    implements _$HolidayDeviceCalendarListCopyWith<$Res> {
  __$HolidayDeviceCalendarListCopyWithImpl(_HolidayDeviceCalendarList _value,
      $Res Function(_HolidayDeviceCalendarList) _then)
      : super(_value, (v) => _then(v as _HolidayDeviceCalendarList));

  @override
  _HolidayDeviceCalendarList get _value =>
      super._value as _HolidayDeviceCalendarList;

  @override
  $Res call({
    Object? ids = freezed,
  }) {
    return _then(_HolidayDeviceCalendarList(
      ids: ids == freezed
          ? _value.ids
          : ids // ignore: cast_nullable_to_non_nullable
              as BuiltList<DeviceCalendarId>,
    ));
  }
}

/// @nodoc

class _$_HolidayDeviceCalendarList extends _HolidayDeviceCalendarList
    with DiagnosticableTreeMixin {
  const _$_HolidayDeviceCalendarList({required this.ids}) : super._();

  @override
  final BuiltList<DeviceCalendarId> ids;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HolidayDeviceCalendarList(ids: $ids)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HolidayDeviceCalendarList'))
      ..add(DiagnosticsProperty('ids', ids));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HolidayDeviceCalendarList &&
            (identical(other.ids, ids) ||
                const DeepCollectionEquality().equals(other.ids, ids)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(ids);

  @JsonKey(ignore: true)
  @override
  _$HolidayDeviceCalendarListCopyWith<_HolidayDeviceCalendarList>
      get copyWith =>
          __$HolidayDeviceCalendarListCopyWithImpl<_HolidayDeviceCalendarList>(
              this, _$identity);
}

abstract class _HolidayDeviceCalendarList extends HolidayDeviceCalendarList {
  const factory _HolidayDeviceCalendarList(
          {required BuiltList<DeviceCalendarId> ids}) =
      _$_HolidayDeviceCalendarList;
  const _HolidayDeviceCalendarList._() : super._();

  @override
  BuiltList<DeviceCalendarId> get ids => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$HolidayDeviceCalendarListCopyWith<_HolidayDeviceCalendarList>
      get copyWith => throw _privateConstructorUsedError;
}
