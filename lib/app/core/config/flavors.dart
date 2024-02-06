enum Flavor {
  local,
  development,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.local:
        return 'holidayapp Local';
      case Flavor.development:
        return 'holidayapp Development';
      case Flavor.production:
        return 'holidayapp Production';
      default:
        return 'title';
    }
  }

  /// Defines the environment variables filename for each flavor
  static String get envFileName => '${appFlavor?.name}.config.json';

}
