import 'package:flutter/material.dart';

mixin StateLifecycle<T extends StatefulWidget> on State<T>, RouteAware {
  RouteObserver<ModalRoute> get routeObserver;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    onOpened();
  }

  @override
  void didPopNext() {
    onOpened();
  }

  @override
  void didPushNext() {
    onClosed();
  }

  @override
  void didPop() {
    onClosed();
  }

  void onOpened() {}

  void onClosed() {}
}
