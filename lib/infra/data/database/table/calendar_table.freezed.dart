// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'calendar_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CalendarTableTearOff {
  const _$CalendarTableTearOff();

  _CalendarTable call({required String id, required String name}) {
    return _CalendarTable(
      id: id,
      name: name,
    );
  }
}

/// @nodoc
const $CalendarTable = _$CalendarTableTearOff();

/// @nodoc
mixin _$CalendarTable {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarTableCopyWith<CalendarTable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarTableCopyWith<$Res> {
  factory $CalendarTableCopyWith(
          CalendarTable value, $Res Function(CalendarTable) then) =
      _$CalendarTableCopyWithImpl<$Res>;
  $Res call({String id, String name});
}

/// @nodoc
class _$CalendarTableCopyWithImpl<$Res>
    implements $CalendarTableCopyWith<$Res> {
  _$CalendarTableCopyWithImpl(this._value, this._then);

  final CalendarTable _value;
  // ignore: unused_field
  final $Res Function(CalendarTable) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$CalendarTableCopyWith<$Res>
    implements $CalendarTableCopyWith<$Res> {
  factory _$CalendarTableCopyWith(
          _CalendarTable value, $Res Function(_CalendarTable) then) =
      __$CalendarTableCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name});
}

/// @nodoc
class __$CalendarTableCopyWithImpl<$Res>
    extends _$CalendarTableCopyWithImpl<$Res>
    implements _$CalendarTableCopyWith<$Res> {
  __$CalendarTableCopyWithImpl(
      _CalendarTable _value, $Res Function(_CalendarTable) _then)
      : super(_value, (v) => _then(v as _CalendarTable));

  @override
  _CalendarTable get _value => super._value as _CalendarTable;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_CalendarTable(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CalendarTable extends _CalendarTable with DiagnosticableTreeMixin {
  const _$_CalendarTable({required this.id, required this.name}) : super._();

  @override
  final String id;
  @override
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarTable(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarTable'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CalendarTable &&
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
  _$CalendarTableCopyWith<_CalendarTable> get copyWith =>
      __$CalendarTableCopyWithImpl<_CalendarTable>(this, _$identity);
}

abstract class _CalendarTable extends CalendarTable {
  const factory _CalendarTable({required String id, required String name}) =
      _$_CalendarTable;
  const _CalendarTable._() : super._();

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CalendarTableCopyWith<_CalendarTable> get copyWith =>
      throw _privateConstructorUsedError;
}
