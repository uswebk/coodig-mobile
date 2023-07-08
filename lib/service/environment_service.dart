import 'package:coodig_mobile/config/flavor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final environmentServiceProvider = Provider<EnvironmentService>((ref) => EnvironmentService());

class EnvironmentService {
  Future<void> setting() async {
    await setEnv();
    await setFlavor();
  }

  Future<void> setEnv() async {
    await dotenv.load(fileName: '.env');

    if (dotenv.env['PRODUCTION'] != null && bool.fromEnvironment(dotenv.env['PRODUCTION'].toString())) {
      await dotenv.load(fileName: '.env.pro');
    } else {
      await dotenv.load(fileName: '.env.dev');
    }
  }

  String getByKey(String key) {
    return dotenv.env[key] ?? '';
  }

  Future<void> setFlavor() async {
    const flavor = String.fromEnvironment('FLAVOR');

    FlavorConfig.initialize(flavor);
  }
}
