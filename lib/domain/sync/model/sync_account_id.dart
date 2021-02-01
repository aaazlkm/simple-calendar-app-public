import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_account_id.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class SyncAccountId with _$SyncAccountId {
  const factory SyncAccountId({
    required final String value,
  }) = _SyncAccountId;

  const SyncAccountId._();
}
