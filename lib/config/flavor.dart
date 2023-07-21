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

// Specify the IP address of the local PC when the real device: EX) http://192.168.0.28
final Map<String, FlavorConfig> flavors = <String, FlavorConfig>{
  Flavor.development.name: FlavorConfig(
    variables: <String, String>{
      'apiEndpoint': 'http://192.168.0.28:9999',
    },
  ),
  Flavor.developmentIos.name: FlavorConfig(
    variables: <String, String>{
      'apiEndpoint': 'http://127.0.0.1:9999',
    },
  ),
  Flavor.developmentAndroid.name: FlavorConfig(
    variables: <String, String>{
      'apiEndpoint': 'http://10.0.2.2:9999',
    },
  ),
};

class FlavorConfig {
  final Map<String, dynamic> variables;

  FlavorConfig({required this.variables});

  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    assert(_instance != null, 'Already Exists Instance');
    return _instance!;
  }

  static void initialize(String flavor) {
    final flavorConfig = flavors[flavor];

    assert(flavorConfig != null, 'Not Found Flavor');

    _instance = FlavorConfig(variables: flavorConfig!.variables);
  }
}
