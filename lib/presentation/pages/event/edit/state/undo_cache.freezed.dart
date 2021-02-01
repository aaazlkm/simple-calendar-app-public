// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'undo_cache.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UndoCacheTearOff {
  const _$UndoCacheTearOff();

  UndoCacheNote note({required String prevNote}) {
    return UndoCacheNote(
      prevNote: prevNote,
    );
  }

  UndoCacheMultiDates multiDates(
      {required BuiltList<TZDateTime> prevSelectedDays}) {
    return UndoCacheMultiDates(
      prevSelectedDays: prevSelectedDays,
    );
  }
}

/// @nodoc
const $UndoCache = _$UndoCacheTearOff();

/// @nodoc
mixin _$UndoCache {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prevNote) note,
    required TResult Function(BuiltList<TZDateTime> prevSelectedDays)
        multiDates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prevNote)? note,
    TResult Function(BuiltList<TZDateTime> prevSelectedDays)? multiDates,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UndoCacheNote value) note,
    required TResult Function(UndoCacheMultiDates value) multiDates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UndoCacheNote value)? note,
    TResult Function(UndoCacheMultiDates value)? multiDates,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UndoCacheCopyWith<$Res> {
  factory $UndoCacheCopyWith(UndoCache value, $Res Function(UndoCache) then) =
      _$UndoCacheCopyWithImpl<$Res>;
}

/// @nodoc
class _$UndoCacheCopyWithImpl<$Res> implements $UndoCacheCopyWith<$Res> {
  _$UndoCacheCopyWithImpl(this._value, this._then);

  final UndoCache _value;
  // ignore: unused_field
  final $Res Function(UndoCache) _then;
}

/// @nodoc
abstract class $UndoCacheNoteCopyWith<$Res> {
  factory $UndoCacheNoteCopyWith(
          UndoCacheNote value, $Res Function(UndoCacheNote) then) =
      _$UndoCacheNoteCopyWithImpl<$Res>;
  $Res call({String prevNote});
}

/// @nodoc
class _$UndoCacheNoteCopyWithImpl<$Res> extends _$UndoCacheCopyWithImpl<$Res>
    implements $UndoCacheNoteCopyWith<$Res> {
  _$UndoCacheNoteCopyWithImpl(
      UndoCacheNote _value, $Res Function(UndoCacheNote) _then)
      : super(_value, (v) => _then(v as UndoCacheNote));

  @override
  UndoCacheNote get _value => super._value as UndoCacheNote;

  @override
  $Res call({
    Object? prevNote = freezed,
  }) {
    return _then(UndoCacheNote(
      prevNote: prevNote == freezed
          ? _value.prevNote
          : prevNote // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UndoCacheNote extends UndoCacheNote {
  const _$UndoCacheNote({required this.prevNote}) : super._();

  @override
  final String prevNote;

  @override
  String toString() {
    return 'UndoCache.note(prevNote: $prevNote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UndoCacheNote &&
            (identical(other.prevNote, prevNote) ||
                const DeepCollectionEquality()
                    .equals(other.prevNote, prevNote)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(prevNote);

  @JsonKey(ignore: true)
  @override
  $UndoCacheNoteCopyWith<UndoCacheNote> get copyWith =>
      _$UndoCacheNoteCopyWithImpl<UndoCacheNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prevNote) note,
    required TResult Function(BuiltList<TZDateTime> prevSelectedDays)
        multiDates,
  }) {
    return note(prevNote);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prevNote)? note,
    TResult Function(BuiltList<TZDateTime> prevSelectedDays)? multiDates,
    required TResult orElse(),
  }) {
    if (note != null) {
      return note(prevNote);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UndoCacheNote value) note,
    required TResult Function(UndoCacheMultiDates value) multiDates,
  }) {
    return note(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UndoCacheNote value)? note,
    TResult Function(UndoCacheMultiDates value)? multiDates,
    required TResult orElse(),
  }) {
    if (note != null) {
      return note(this);
    }
    return orElse();
  }
}

abstract class UndoCacheNote extends UndoCache {
  const factory UndoCacheNote({required String prevNote}) = _$UndoCacheNote;
  const UndoCacheNote._() : super._();

  String get prevNote => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UndoCacheNoteCopyWith<UndoCacheNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UndoCacheMultiDatesCopyWith<$Res> {
  factory $UndoCacheMultiDatesCopyWith(
          UndoCacheMultiDates value, $Res Function(UndoCacheMultiDates) then) =
      _$UndoCacheMultiDatesCopyWithImpl<$Res>;
  $Res call({BuiltList<TZDateTime> prevSelectedDays});
}

/// @nodoc
class _$UndoCacheMultiDatesCopyWithImpl<$Res>
    extends _$UndoCacheCopyWithImpl<$Res>
    implements $UndoCacheMultiDatesCopyWith<$Res> {
  _$UndoCacheMultiDatesCopyWithImpl(
      UndoCacheMultiDates _value, $Res Function(UndoCacheMultiDates) _then)
      : super(_value, (v) => _then(v as UndoCacheMultiDates));

  @override
  UndoCacheMultiDates get _value => super._value as UndoCacheMultiDates;

  @override
  $Res call({
    Object? prevSelectedDays = freezed,
  }) {
    return _then(UndoCacheMultiDates(
      prevSelectedDays: prevSelectedDays == freezed
          ? _value.prevSelectedDays
          : prevSelectedDays // ignore: cast_nullable_to_non_nullable
              as BuiltList<TZDateTime>,
    ));
  }
}

/// @nodoc

class _$UndoCacheMultiDates extends UndoCacheMultiDates {
  const _$UndoCacheMultiDates({required this.prevSelectedDays}) : super._();

  @override
  final BuiltList<TZDateTime> prevSelectedDays;

  @override
  String toString() {
    return 'UndoCache.multiDates(prevSelectedDays: $prevSelectedDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UndoCacheMultiDates &&
            (identical(other.prevSelectedDays, prevSelectedDays) ||
                const DeepCollectionEquality()
                    .equals(other.prevSelectedDays, prevSelectedDays)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(prevSelectedDays);

  @JsonKey(ignore: true)
  @override
  $UndoCacheMultiDatesCopyWith<UndoCacheMultiDates> get copyWith =>
      _$UndoCacheMultiDatesCopyWithImpl<UndoCacheMultiDates>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String prevNote) note,
    required TResult Function(BuiltList<TZDateTime> prevSelectedDays)
        multiDates,
  }) {
    return multiDates(prevSelectedDays);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String prevNote)? note,
    TResult Function(BuiltList<TZDateTime> prevSelectedDays)? multiDates,
    required TResult orElse(),
  }) {
    if (multiDates != null) {
      return multiDates(prevSelectedDays);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UndoCacheNote value) note,
    required TResult Function(UndoCacheMultiDates value) multiDates,
  }) {
    return multiDates(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UndoCacheNote value)? note,
    TResult Function(UndoCacheMultiDates value)? multiDates,
    required TResult orElse(),
  }) {
    if (multiDates != null) {
      return multiDates(this);
    }
    return orElse();
  }
}

abstract class UndoCacheMultiDates extends UndoCache {
  const factory UndoCacheMultiDates(
          {required BuiltList<TZDateTime> prevSelectedDays}) =
      _$UndoCacheMultiDates;
  const UndoCacheMultiDates._() : super._();

  BuiltList<TZDateTime> get prevSelectedDays =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UndoCacheMultiDatesCopyWith<UndoCacheMultiDates> get copyWith =>
      throw _privateConstructorUsedError;
}
