import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:simple_calendar_app/infra/data/api/client/google_auth_client.dart';

class GoogleDriveApiClient {
  static const spacesInAppDataFolder = 'appDataFolder';

  final _googleSignInWithDriveApi = GoogleSignIn.standard(
    scopes: [drive.DriveApi.driveAppdataScope],
  );

  GoogleSignInAccount? get currentUser => _googleSignInWithDriveApi.currentUser;

  Future<GoogleSignInAccount?> signIn() async => _googleSignInWithDriveApi.signIn();

  Future<GoogleSignInAccount?> signInSilently() async => _googleSignInWithDriveApi.signInSilently();

  Future<GoogleSignInAccount?> signOut() => _googleSignInWithDriveApi.signOut();

  Future<drive.FileList> fetchAllFiles({
    required Map<String, String> authHeaders,
  }) async {
    final driveApi = drive.DriveApi(GoogleAuthClient(authHeaders));
    return driveApi.files.list(
      spaces: spacesInAppDataFolder,
      $fields: 'files(id, name, modifiedTime)',
    );
  }

  Future<drive.File> uploadFile({
    required Map<String, String> authHeaders,
    required String fileName,
    required File uploadFile,
  }) async {
    final driveApi = drive.DriveApi(GoogleAuthClient(authHeaders));
    final fileToUpload = drive.File()
      ..name = fileName
      ..parents = [spacesInAppDataFolder]
      ..modifiedTime = DateTime.now().toUtc();

    final media = drive.Media(
      uploadFile.openRead(),
      uploadFile.lengthSync(),
    );

    return driveApi.files.create(
      fileToUpload,
      uploadMedia: media,
    );
  }

  Future<drive.Media> downloadFile({
    required Map<String, String> authHeaders,
    required String fileId,
  }) async {
    final driveApi = drive.DriveApi(GoogleAuthClient(authHeaders));
    final downloadFile = await driveApi.files.get(
      fileId,
      downloadOptions: drive.DownloadOptions.fullMedia,
    ) as drive.Media;
    return downloadFile;
  }

  Future<void> deleteFile({
    required Map<String, String> authHeaders,
    required String fileId,
  }) async {
    final driveApi = drive.DriveApi(GoogleAuthClient(authHeaders));
    await driveApi.files.delete(fileId);
  }
}
