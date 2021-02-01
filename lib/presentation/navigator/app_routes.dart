enum AppRoutes {
  calendar,
  eventList,
  eventEdit,
  setting,
  notification,
  sync,
}

extension AppRoutesName on AppRoutes {
  String get name {
    switch (this) {
      case AppRoutes.calendar:
        return '/calendar';
      case AppRoutes.eventList:
        return '/event/list';
      case AppRoutes.eventEdit:
        return '/event/edit';
      case AppRoutes.setting:
        return '/setting';
      case AppRoutes.notification:
        return '/notification';
      case AppRoutes.sync:
        return '/sync';
    }
  }
}
