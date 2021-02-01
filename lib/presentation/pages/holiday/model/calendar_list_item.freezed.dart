// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'calendar_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarListItemTearOff {
  const _$CalendarListItemTearOff();

  _CalendarListItem call(
      {required DeviceCalendar deviceCalendar, required bool isSelected}) {
    return _CalendarListItem(
      deviceCalendar: deviceCalendar,
      isSelected: isSelected,
    );
  }
}

/// @nodoc
const $CalendarListItem = _$CalendarListItemTearOff();

/// @nodoc
mixin _$CalendarListItem {
  DeviceCalendar get deviceCalendar => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarListItemCopyWith<CalendarListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarListItemCopyWith<$Res> {
  factory $CalendarListItemCopyWith(
          CalendarListItem value, $Res Function(CalendarListItem) then) =
      _$CalendarListItemCopyWithImpl<$Res>;
  $Res call({DeviceCalendar deviceCalendar, bool isSelected});

  $DeviceCalendarCopyWith<$Res> get deviceCalendar;
}

/// @nodoc
class _$CalendarListItemCopyWithImpl<$Res>
    implements $CalendarListItemCopyWith<$Res> {
  _$CalendarListItemCopyWithImpl(this._value, this._then);

  final CalendarListItem _value;
  // ignore: unused_field
  final $Res Function(CalendarListItem) _then;

  @override
  $Res call({
    Object? deviceCalendar = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_value.copyWith(
      deviceCalendar: deviceCalendar == freezed
          ? _value.deviceCalendar
          : deviceCalendar // ignore: cast_nullable_to_non_nullable
              as DeviceCalendar,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $DeviceCalendarCopyWith<$Res> get deviceCalendar {
    return $DeviceCalendarCopyWith<$Res>(_value.deviceCalendar, (value) {
      return _then(_value.copyWith(deviceCalendar: value));
    });
  }
}

/// @nodoc
abstract class _$CalendarListItemCopyWith<$Res>
    implements $CalendarListItemCopyWith<$Res> {
  factory _$CalendarListItemCopyWith(
          _CalendarListItem value, $Res Function(_CalendarListItem) then) =
      __$CalendarListItemCopyWithImpl<$Res>;
  @override
  $Res call({DeviceCalendar deviceCalendar, bool isSelected});

  @override
  $DeviceCalendarCopyWith<$Res> get deviceCalendar;
}

/// @nodoc
class __$CalendarListItemCopyWithImpl<$Res>
    extends _$CalendarListItemCopyWithImpl<$Res>
    implements _$CalendarListItemCopyWith<$Res> {
  __$CalendarListItemCopyWithImpl(
      _CalendarListItem _value, $Res Function(_CalendarListItem) _then)
      : super(_value, (v) => _then(v as _CalendarListItem));

  @override
  _CalendarListItem get _value => super._value as _CalendarListItem;

  @override
  $Res call({
    Object? deviceCalendar = freezed,
    Object? isSelected = freezed,
  }) {
    return _then(_CalendarListItem(
      deviceCalendar: deviceCalendar == freezed
          ? _value.deviceCalendar
          : deviceCalendar // ignore: cast_nullable_to_non_nullable
              as DeviceCalendar,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CalendarListItem
    with DiagnosticableTreeMixin
    implements _CalendarListItem {
  const _$_CalendarListItem(
      {required this.deviceCalendar, required this.isSelected});

  @override
  final DeviceCalendar deviceCalendar;
  @override
  final bool isSelected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarListItem(deviceCalendar: $deviceCalendar, isSelected: $isSelected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarListItem'))
      ..add(DiagnosticsProperty('deviceCalendar', deviceCalendar))
      ..add(DiagnosticsProperty('isSelected', isSelected));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarListItem &&
            (identical(other.deviceCalendar, deviceCalendar) ||
                const DeepCollectionEquality()
                    .equals(other.deviceCalendar, deviceCalendar)) &&
            (identical(other.isSelected, isSelected) ||
                const DeepCollectionEquality()
                    .equals(other.isSelected, isSelected)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(deviceCalendar) ^
      const DeepCollectionEquality().hash(isSelected);

  @JsonKey(ignore: true)
  @override
  _$CalendarListItemCopyWith<_CalendarListItem> get copyWith =>
      __$CalendarListItemCopyWithImpl<_CalendarListItem>(this, _$identity);
}

abstract class _CalendarListItem implements CalendarListItem {
  const factory _CalendarListItem(
      {required DeviceCalendar deviceCalendar,
      required bool isSelected}) = _$_CalendarListItem;

  @override
  DeviceCalendar get deviceCalendar => throw _privateConstructorUsedError;
  @override
  bool get isSelected => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CalendarListItemCopyWith<_CalendarListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
