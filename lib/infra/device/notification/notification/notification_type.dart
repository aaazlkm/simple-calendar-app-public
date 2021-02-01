enum NotificationType {
  dailyRemind,
}

extension NotificationTypeEx on NotificationType {
  static const String _androidChannelIdLeading = 'daily_app_notification_';

  String get androidChannelId => '$_androidChannelIdLeading$_androidChannelId';

  int get id {
    switch (this) {
      case NotificationType.dailyRemind:
        return 0000;
    }
  }

  String get _androidChannelId {
    switch (this) {
      case NotificationType.dailyRemind:
        return 'daily_remind';
    }
  }
}
