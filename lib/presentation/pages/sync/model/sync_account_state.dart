import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account.dart';

part 'sync_account_state.freezed.dart';

@freezed
class SyncAccountState with _$SyncAccountState {
  const factory SyncAccountState.signIn(SyncAccount syncAccount) = SyncAccountStateSignIn;

  const factory SyncAccountState.signOut() = SyncAccountStateSignOut;

  const SyncAccountState._();

  bool get isSignIn => map(signIn: (_) => true, signOut: (_) => false);

  bool get isSignOut => !isSignIn;

  SyncAccount? get syncAccountOrNull => map(
        signIn: (signIn) => signIn.syncAccount,
        signOut: (_) => null,
      );
}
