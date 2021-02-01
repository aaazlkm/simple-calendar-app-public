// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sync_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SyncAccountTearOff {
  const _$SyncAccountTearOff();

  _SyncAccount call(
      {required SyncAccountId id,
      required String email,
      required Map<String, String> authHeaders,
      String? displayName,
      String? photoUrl}) {
    return _SyncAccount(
      id: id,
      email: email,
      authHeaders: authHeaders,
      displayName: displayName,
      photoUrl: photoUrl,
    );
  }
}

/// @nodoc
const $SyncAccount = _$SyncAccountTearOff();

/// @nodoc
mixin _$SyncAccount {
  SyncAccountId get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  Map<String, String> get authHeaders => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SyncAccountCopyWith<SyncAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncAccountCopyWith<$Res> {
  factory $SyncAccountCopyWith(
          SyncAccount value, $Res Function(SyncAccount) then) =
      _$SyncAccountCopyWithImpl<$Res>;
  $Res call(
      {SyncAccountId id,
      String email,
      Map<String, String> authHeaders,
      String? displayName,
      String? photoUrl});

  $SyncAccountIdCopyWith<$Res> get id;
}

/// @nodoc
class _$SyncAccountCopyWithImpl<$Res> implements $SyncAccountCopyWith<$Res> {
  _$SyncAccountCopyWithImpl(this._value, this._then);

  final SyncAccount _value;
  // ignore: unused_field
  final $Res Function(SyncAccount) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? authHeaders = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SyncAccountId,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      authHeaders: authHeaders == freezed
          ? _value.authHeaders
          : authHeaders // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $SyncAccountIdCopyWith<$Res> get id {
    return $SyncAccountIdCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value));
    });
  }
}

/// @nodoc
abstract class _$SyncAccountCopyWith<$Res>
    implements $SyncAccountCopyWith<$Res> {
  factory _$SyncAccountCopyWith(
          _SyncAccount value, $Res Function(_SyncAccount) then) =
      __$SyncAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {SyncAccountId id,
      String email,
      Map<String, String> authHeaders,
      String? displayName,
      String? photoUrl});

  @override
  $SyncAccountIdCopyWith<$Res> get id;
}

/// @nodoc
class __$SyncAccountCopyWithImpl<$Res> extends _$SyncAccountCopyWithImpl<$Res>
    implements _$SyncAccountCopyWith<$Res> {
  __$SyncAccountCopyWithImpl(
      _SyncAccount _value, $Res Function(_SyncAccount) _then)
      : super(_value, (v) => _then(v as _SyncAccount));

  @override
  _SyncAccount get _value => super._value as _SyncAccount;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? authHeaders = freezed,
    Object? displayName = freezed,
    Object? photoUrl = freezed,
  }) {
    return _then(_SyncAccount(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SyncAccountId,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      authHeaders: authHeaders == freezed
          ? _value.authHeaders
          : authHeaders // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SyncAccount extends _SyncAccount {
  const _$_SyncAccount(
      {required this.id,
      required this.email,
      required this.authHeaders,
      this.displayName,
      this.photoUrl})
      : super._();

  @override
  final SyncAccountId id;
  @override
  final String email;
  @override
  final Map<String, String> authHeaders;
  @override
  final String? displayName;
  @override
  final String? photoUrl;

  @override
  String toString() {
    return 'SyncAccount(id: $id, email: $email, authHeaders: $authHeaders, displayName: $displayName, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SyncAccount &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.authHeaders, authHeaders) ||
                const DeepCollectionEquality()
                    .equals(other.authHeaders, authHeaders)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(authHeaders) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(photoUrl);

  @JsonKey(ignore: true)
  @override
  _$SyncAccountCopyWith<_SyncAccount> get copyWith =>
      __$SyncAccountCopyWithImpl<_SyncAccount>(this, _$identity);
}

abstract class _SyncAccount extends SyncAccount {
  const factory _SyncAccount(
      {required SyncAccountId id,
      required String email,
      required Map<String, String> authHeaders,
      String? displayName,
      String? photoUrl}) = _$_SyncAccount;
  const _SyncAccount._() : super._();

  @override
  SyncAccountId get id => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  Map<String, String> get authHeaders => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SyncAccountCopyWith<_SyncAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
