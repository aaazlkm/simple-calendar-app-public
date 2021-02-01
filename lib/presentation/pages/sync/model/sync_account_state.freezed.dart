// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sync_account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SyncAccountStateTearOff {
  const _$SyncAccountStateTearOff();

  SyncAccountStateSignIn signIn(SyncAccount syncAccount) {
    return SyncAccountStateSignIn(
      syncAccount,
    );
  }

  SyncAccountStateSignOut signOut() {
    return const SyncAccountStateSignOut();
  }
}

/// @nodoc
const $SyncAccountState = _$SyncAccountStateTearOff();

/// @nodoc
mixin _$SyncAccountState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SyncAccount syncAccount) signIn,
    required TResult Function() signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SyncAccount syncAccount)? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncAccountStateSignIn value) signIn,
    required TResult Function(SyncAccountStateSignOut value) signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncAccountStateSignIn value)? signIn,
    TResult Function(SyncAccountStateSignOut value)? signOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncAccountStateCopyWith<$Res> {
  factory $SyncAccountStateCopyWith(
          SyncAccountState value, $Res Function(SyncAccountState) then) =
      _$SyncAccountStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SyncAccountStateCopyWithImpl<$Res>
    implements $SyncAccountStateCopyWith<$Res> {
  _$SyncAccountStateCopyWithImpl(this._value, this._then);

  final SyncAccountState _value;
  // ignore: unused_field
  final $Res Function(SyncAccountState) _then;
}

/// @nodoc
abstract class $SyncAccountStateSignInCopyWith<$Res> {
  factory $SyncAccountStateSignInCopyWith(SyncAccountStateSignIn value,
          $Res Function(SyncAccountStateSignIn) then) =
      _$SyncAccountStateSignInCopyWithImpl<$Res>;
  $Res call({SyncAccount syncAccount});

  $SyncAccountCopyWith<$Res> get syncAccount;
}

/// @nodoc
class _$SyncAccountStateSignInCopyWithImpl<$Res>
    extends _$SyncAccountStateCopyWithImpl<$Res>
    implements $SyncAccountStateSignInCopyWith<$Res> {
  _$SyncAccountStateSignInCopyWithImpl(SyncAccountStateSignIn _value,
      $Res Function(SyncAccountStateSignIn) _then)
      : super(_value, (v) => _then(v as SyncAccountStateSignIn));

  @override
  SyncAccountStateSignIn get _value => super._value as SyncAccountStateSignIn;

  @override
  $Res call({
    Object? syncAccount = freezed,
  }) {
    return _then(SyncAccountStateSignIn(
      syncAccount == freezed
          ? _value.syncAccount
          : syncAccount // ignore: cast_nullable_to_non_nullable
              as SyncAccount,
    ));
  }

  @override
  $SyncAccountCopyWith<$Res> get syncAccount {
    return $SyncAccountCopyWith<$Res>(_value.syncAccount, (value) {
      return _then(_value.copyWith(syncAccount: value));
    });
  }
}

/// @nodoc

class _$SyncAccountStateSignIn extends SyncAccountStateSignIn {
  const _$SyncAccountStateSignIn(this.syncAccount) : super._();

  @override
  final SyncAccount syncAccount;

  @override
  String toString() {
    return 'SyncAccountState.signIn(syncAccount: $syncAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SyncAccountStateSignIn &&
            (identical(other.syncAccount, syncAccount) ||
                const DeepCollectionEquality()
                    .equals(other.syncAccount, syncAccount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(syncAccount);

  @JsonKey(ignore: true)
  @override
  $SyncAccountStateSignInCopyWith<SyncAccountStateSignIn> get copyWith =>
      _$SyncAccountStateSignInCopyWithImpl<SyncAccountStateSignIn>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SyncAccount syncAccount) signIn,
    required TResult Function() signOut,
  }) {
    return signIn(syncAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SyncAccount syncAccount)? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(syncAccount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncAccountStateSignIn value) signIn,
    required TResult Function(SyncAccountStateSignOut value) signOut,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncAccountStateSignIn value)? signIn,
    TResult Function(SyncAccountStateSignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class SyncAccountStateSignIn extends SyncAccountState {
  const factory SyncAccountStateSignIn(SyncAccount syncAccount) =
      _$SyncAccountStateSignIn;
  const SyncAccountStateSignIn._() : super._();

  SyncAccount get syncAccount => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SyncAccountStateSignInCopyWith<SyncAccountStateSignIn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncAccountStateSignOutCopyWith<$Res> {
  factory $SyncAccountStateSignOutCopyWith(SyncAccountStateSignOut value,
          $Res Function(SyncAccountStateSignOut) then) =
      _$SyncAccountStateSignOutCopyWithImpl<$Res>;
}

/// @nodoc
class _$SyncAccountStateSignOutCopyWithImpl<$Res>
    extends _$SyncAccountStateCopyWithImpl<$Res>
    implements $SyncAccountStateSignOutCopyWith<$Res> {
  _$SyncAccountStateSignOutCopyWithImpl(SyncAccountStateSignOut _value,
      $Res Function(SyncAccountStateSignOut) _then)
      : super(_value, (v) => _then(v as SyncAccountStateSignOut));

  @override
  SyncAccountStateSignOut get _value => super._value as SyncAccountStateSignOut;
}

/// @nodoc

class _$SyncAccountStateSignOut extends SyncAccountStateSignOut {
  const _$SyncAccountStateSignOut() : super._();

  @override
  String toString() {
    return 'SyncAccountState.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SyncAccountStateSignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SyncAccount syncAccount) signIn,
    required TResult Function() signOut,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SyncAccount syncAccount)? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncAccountStateSignIn value) signIn,
    required TResult Function(SyncAccountStateSignOut value) signOut,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncAccountStateSignIn value)? signIn,
    TResult Function(SyncAccountStateSignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class SyncAccountStateSignOut extends SyncAccountState {
  const factory SyncAccountStateSignOut() = _$SyncAccountStateSignOut;
  const SyncAccountStateSignOut._() : super._();
}
