import 'package:permission_handler/permission_handler.dart';

extension PermissionEx on Permission {
  Future<SimplePermissionStatus> get simpleStatus async {
    final status = await this.status;
    return status.toSimpleStatus();
  }
}

extension PermissionStatusEx on PermissionStatus {
  SimplePermissionStatus toSimpleStatus() => SimplePermissionStatusFactory.from(this);
}

/// アプリで使いやすいようにPermissionStatusを以下の3つの状態に単純化する
enum SimplePermissionStatus {
  /// パーミッション取得済み
  granted,

  /// パーミッション取得する必要がある
  needPermission,

  /// デバイスの設定画面からパーミッション取得する必要がある
  needPermissionFromDeviceSetting,
}

extension SimplePermissionStatusFactory on SimplePermissionStatus {
  static SimplePermissionStatus from(PermissionStatus permissionStatus) {
    switch (permissionStatus) {
      case PermissionStatus.granted:
        return SimplePermissionStatus.granted;
      case PermissionStatus.denied:
        return SimplePermissionStatus.needPermission;
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
      case PermissionStatus.permanentlyDenied:
        return SimplePermissionStatus.needPermissionFromDeviceSetting;
    }
  }
}

extension SimplePermissionStatusUtil on SimplePermissionStatus {
  bool get isGranted => this == SimplePermissionStatus.granted;

  bool get isNeedPermission => this == SimplePermissionStatus.needPermission;

  bool get isNeedPermissionFromDeviceSetting => this == SimplePermissionStatus.needPermissionFromDeviceSetting;

  void when({
    required Function() granted,
    required Function() needPermission,
    required Function() needPermissionFromDeviceSetting,
  }) {
    switch (this) {
      case SimplePermissionStatus.granted:
        granted();
        break;
      case SimplePermissionStatus.needPermission:
        needPermission();
        break;
      case SimplePermissionStatus.needPermissionFromDeviceSetting:
        needPermissionFromDeviceSetting();
        break;
    }
  }

  T map<T>({
    required T Function() granted,
    required T Function() needPermission,
    required T Function() needPermissionFromDeviceSetting,
  }) {
    switch (this) {
      case SimplePermissionStatus.granted:
        return granted();
      case SimplePermissionStatus.needPermission:
        return needPermission();
      case SimplePermissionStatus.needPermissionFromDeviceSetting:
        return needPermissionFromDeviceSetting();
    }
  }
}
