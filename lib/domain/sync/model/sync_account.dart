import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account_id.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account_id.dart';

part 'sync_account.freezed.dart';

// デフォルト引数を持ったコンストラクタを生成したいため
// ignore_for_file: prefer_constructors_over_static_methods

@freezed
class SyncAccount with _$SyncAccount {
  const factory SyncAccount({
    required final SyncAccountId id,
    required final String email,
    required final Map<String, String> authHeaders,
    final String? displayName,
    final String? photoUrl,
  }) = _SyncAccount;

  const SyncAccount._();
}
