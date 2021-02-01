import 'package:flutter/widgets.dart';

mixin StoreLifecycle {
  @mustCallSuper
  void init() {}

  @mustCallSuper
  void dispose() {}
}

mixin StoreLifecycleWithArgument<ARGUMENT> {
  @mustCallSuper
  void init(ARGUMENT argument) {}

  @mustCallSuper
  void dispose() {}
}
