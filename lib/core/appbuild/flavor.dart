enum Flavor { development, production }

final Flavor flavor = (() {
  /// アプリ実行の際に[--dart-define=FLAVOR]で渡される
  switch (const String.fromEnvironment('FLAVOR')) {
    case 'development':
      return Flavor.development;
    case 'production':
      return Flavor.production;
    default:
      throw AssertionError('need to pass FLAVOR argument from [--dart-define=FLAVOR=] when build.');
  }
})();
