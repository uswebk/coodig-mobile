enum Flavor {
  development,
  developmentIos,
  developmentAndroid,
  staging,
  production,
}

extension FlavorExtension on Flavor {
  String get name {
    switch (this) {
      case Flavor.development:
        return 'DEVELOPMENT';
      case Flavor.developmentIos:
        return 'DEVELOPMENT_IOS';
      case Flavor.developmentAndroid:
        return 'DEVELOPMENT_ANDROID';
      case Flavor.staging:
        return 'STAGING';
      case Flavor.production:
        return 'PRODUCTION';
      default:
        return '';
    }
  }
}

final Map<String, FlavorConfig> flavors = {
  Flavor.development.name: FlavorConfig(
    variables: {
      'apiEndpoint': 'http://127.0.0.1:9999',
    } as Map<String, FlavorConfig>,
  ),
  Flavor.developmentIos.name: FlavorConfig(
    variables: {
      'apiEndpoint': 'http://127.0.0.1:9999',
    } as Map<String, FlavorConfig>,
  ),
  Flavor.developmentAndroid.name: FlavorConfig(
    variables: {
      'apiEndpoint': 'http://10.0.2.2:9999',
    } as Map<String, FlavorConfig>,
  ),
};

class FlavorConfig {
  final Map<String, dynamic> variables;

  FlavorConfig({required this.variables});

  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    assert(_instance != null, 'Not Found Instance');
    return _instance!;
  }

  static void initialize(String flavor) {
    final flavorConfig = flavors[flavor];

    assert(flavorConfig != null, 'Not Found Flavor');

    _instance = FlavorConfig(variables: flavorConfig!.variables);
  }
}
