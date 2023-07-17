import 'package:coodig_mobile/config/env.dart';
import 'package:coodig_mobile/config/flavor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final environmentServiceProvider = Provider<EnvironmentService>((ref) => EnvironmentService());

class EnvironmentService {
  static void setFlavor() {
    const flavor = String.fromEnvironment('FLAVOR');
    FlavorConfig.initialize(flavor);
  }

  String getUriSecretKey() {
    return Env.uriSecretKey;
  }
}
