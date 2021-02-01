// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'undo_button_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UndoButtonStateTearOff {
  const _$UndoButtonStateTearOff();

  UndoButtonStateNote visible({required UndoCacheStore cacheStore}) {
    return UndoButtonStateNote(
      cacheStore: cacheStore,
    );
  }

  UndoButtonStateNone gone() {
    return const UndoButtonStateNone();
  }
}

/// @nodoc
const $UndoButtonState = _$UndoButtonStateTearOff();

/// @nodoc
mixin _$UndoButtonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UndoCacheStore cacheStore) visible,
    required TResult Function() gone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UndoCacheStore cacheStore)? visible,
    TResult Function()? gone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UndoButtonStateNote value) visible,
    required TResult Function(UndoButtonStateNone value) gone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UndoButtonStateNote value)? visible,
    TResult Function(UndoButtonStateNone value)? gone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UndoButtonStateCopyWith<$Res> {
  factory $UndoButtonStateCopyWith(
          UndoButtonState value, $Res Function(UndoButtonState) then) =
      _$UndoButtonStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UndoButtonStateCopyWithImpl<$Res>
    implements $UndoButtonStateCopyWith<$Res> {
  _$UndoButtonStateCopyWithImpl(this._value, this._then);

  final UndoButtonState _value;
  // ignore: unused_field
  final $Res Function(UndoButtonState) _then;
}

/// @nodoc
abstract class $UndoButtonStateNoteCopyWith<$Res> {
  factory $UndoButtonStateNoteCopyWith(
          UndoButtonStateNote value, $Res Function(UndoButtonStateNote) then) =
      _$UndoButtonStateNoteCopyWithImpl<$Res>;
  $Res call({UndoCacheStore cacheStore});
}

/// @nodoc
class _$UndoButtonStateNoteCopyWithImpl<$Res>
    extends _$UndoButtonStateCopyWithImpl<$Res>
    implements $UndoButtonStateNoteCopyWith<$Res> {
  _$UndoButtonStateNoteCopyWithImpl(
      UndoButtonStateNote _value, $Res Function(UndoButtonStateNote) _then)
      : super(_value, (v) => _then(v as UndoButtonStateNote));

  @override
  UndoButtonStateNote get _value => super._value as UndoButtonStateNote;

  @override
  $Res call({
    Object? cacheStore = freezed,
  }) {
    return _then(UndoButtonStateNote(
      cacheStore: cacheStore == freezed
          ? _value.cacheStore
          : cacheStore // ignore: cast_nullable_to_non_nullable
              as UndoCacheStore,
    ));
  }
}

/// @nodoc

class _$UndoButtonStateNote extends UndoButtonStateNote {
  const _$UndoButtonStateNote({required this.cacheStore}) : super._();

  @override
  final UndoCacheStore cacheStore;

  @override
  String toString() {
    return 'UndoButtonState.visible(cacheStore: $cacheStore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UndoButtonStateNote &&
            (identical(other.cacheStore, cacheStore) ||
                const DeepCollectionEquality()
                    .equals(other.cacheStore, cacheStore)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cacheStore);

  @JsonKey(ignore: true)
  @override
  $UndoButtonStateNoteCopyWith<UndoButtonStateNote> get copyWith =>
      _$UndoButtonStateNoteCopyWithImpl<UndoButtonStateNote>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UndoCacheStore cacheStore) visible,
    required TResult Function() gone,
  }) {
    return visible(cacheStore);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UndoCacheStore cacheStore)? visible,
    TResult Function()? gone,
    required TResult orElse(),
  }) {
    if (visible != null) {
      return visible(cacheStore);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UndoButtonStateNote value) visible,
    required TResult Function(UndoButtonStateNone value) gone,
  }) {
    return visible(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UndoButtonStateNote value)? visible,
    TResult Function(UndoButtonStateNone value)? gone,
    required TResult orElse(),
  }) {
    if (visible != null) {
      return visible(this);
    }
    return orElse();
  }
}

abstract class UndoButtonStateNote extends UndoButtonState {
  const factory UndoButtonStateNote({required UndoCacheStore cacheStore}) =
      _$UndoButtonStateNote;
  const UndoButtonStateNote._() : super._();

  UndoCacheStore get cacheStore => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UndoButtonStateNoteCopyWith<UndoButtonStateNote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UndoButtonStateNoneCopyWith<$Res> {
  factory $UndoButtonStateNoneCopyWith(
          UndoButtonStateNone value, $Res Function(UndoButtonStateNone) then) =
      _$UndoButtonStateNoneCopyWithImpl<$Res>;
}

/// @nodoc
class _$UndoButtonStateNoneCopyWithImpl<$Res>
    extends _$UndoButtonStateCopyWithImpl<$Res>
    implements $UndoButtonStateNoneCopyWith<$Res> {
  _$UndoButtonStateNoneCopyWithImpl(
      UndoButtonStateNone _value, $Res Function(UndoButtonStateNone) _then)
      : super(_value, (v) => _then(v as UndoButtonStateNone));

  @override
  UndoButtonStateNone get _value => super._value as UndoButtonStateNone;
}

/// @nodoc

class _$UndoButtonStateNone extends UndoButtonStateNone {
  const _$UndoButtonStateNone() : super._();

  @override
  String toString() {
    return 'UndoButtonState.gone()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UndoButtonStateNone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UndoCacheStore cacheStore) visible,
    required TResult Function() gone,
  }) {
    return gone();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UndoCacheStore cacheStore)? visible,
    TResult Function()? gone,
    required TResult orElse(),
  }) {
    if (gone != null) {
      return gone();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UndoButtonStateNote value) visible,
    required TResult Function(UndoButtonStateNone value) gone,
  }) {
    return gone(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UndoButtonStateNote value)? visible,
    TResult Function(UndoButtonStateNone value)? gone,
    required TResult orElse(),
  }) {
    if (gone != null) {
      return gone(this);
    }
    return orElse();
  }
}

abstract class UndoButtonStateNone extends UndoButtonState {
  const factory UndoButtonStateNone() = _$UndoButtonStateNone;
  const UndoButtonStateNone._() : super._();
}
