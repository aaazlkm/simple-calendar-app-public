import 'package:google_sign_in/google_sign_in.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account_id.dart';
import 'package:simple_calendar_app/domain/sync/model/sync_account.dart';

class GoogleSignInAccountMapper {
  static Future<SyncAccount> fromData(GoogleSignInAccount googleSignInAccount) async => SyncAccount(
        id: SyncAccountId(value: googleSignInAccount.id),
        email: googleSignInAccount.email,
        displayName: googleSignInAccount.displayName,
        photoUrl: googleSignInAccount.photoUrl,
        authHeaders: await googleSignInAccount.authHeaders,
      );
}
