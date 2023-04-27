import 'package:flutter_flavor/flutter_flavor.dart';

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
    },
  ),
  Flavor.developmentIos.name: FlavorConfig(
    variables: {
      'apiEndpoint': 'http://127.0.0.1:9999',
    },
  ),
  Flavor.developmentAndroid.name: FlavorConfig(
    variables: {
      'apiEndpoint': 'http://10.0.2.2:9999',
    },
  ),
};
