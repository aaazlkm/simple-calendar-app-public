// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'calendar.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarTearOff {
  const _$CalendarTearOff();

  _Calendar call({required CalendarId id, required String name}) {
    return _Calendar(
      id: id,
      name: name,
    );
  }
}

/// @nodoc
const $Calendar = _$CalendarTearOff();

/// @nodoc
mixin _$Calendar {
  CalendarId get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarCopyWith<Calendar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarCopyWith<$Res> {
  factory $CalendarCopyWith(Calendar value, $Res Function(Calendar) then) =
      _$CalendarCopyWithImpl<$Res>;
  $Res call({CalendarId id, String name});

  $CalendarIdCopyWith<$Res> get id;
}

/// @nodoc
class _$CalendarCopyWithImpl<$Res> implements $CalendarCopyWith<$Res> {
  _$CalendarCopyWithImpl(this._value, this._then);

  final Calendar _value;
  // ignore: unused_field
  final $Res Function(Calendar) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CalendarId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $CalendarIdCopyWith<$Res> get id {
    return $CalendarIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$CalendarCopyWith<$Res> implements $CalendarCopyWith<$Res> {
  factory _$CalendarCopyWith(_Calendar value, $Res Function(_Calendar) then) =
      __$CalendarCopyWithImpl<$Res>;
  @override
  $Res call({CalendarId id, String name});

  @override
  $CalendarIdCopyWith<$Res> get id;
}

/// @nodoc
class __$CalendarCopyWithImpl<$Res> extends _$CalendarCopyWithImpl<$Res>
    implements _$CalendarCopyWith<$Res> {
  __$CalendarCopyWithImpl(_Calendar _value, $Res Function(_Calendar) _then)
      : super(_value, (v) => _then(v as _Calendar));

  @override
  _Calendar get _value => super._value as _Calendar;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_Calendar(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as CalendarId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Calendar extends _Calendar with DiagnosticableTreeMixin {
  const _$_Calendar({required this.id, required this.name}) : super._();

  @override
  final CalendarId id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Calendar(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Calendar'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Calendar &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$CalendarCopyWith<_Calendar> get copyWith =>
      __$CalendarCopyWithImpl<_Calendar>(this, _$identity);
}

abstract class _Calendar extends Calendar {
  const factory _Calendar({required CalendarId id, required String name}) =
      _$_Calendar;
  const _Calendar._() : super._();

  @override
  CalendarId get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CalendarCopyWith<_Calendar> get copyWith =>
      throw _privateConstructorUsedError;
}
