import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../config/flavor.dart';

class EnvironmentService {
  Future<void> setting() async {
    await setEnv();
    await setFlavor();
  }

  Future<void> setEnv() async {
    await dotenv.load(fileName: '.env');

    if (dotenv.env['PRODUCTION'] != null &&
        bool.fromEnvironment(dotenv.env['PRODUCTION'].toString())) {
      await dotenv.load(fileName: '.env.pro');
    } else {
      await dotenv.load(fileName: '.env.dev');
    }
  }

  Future<void> setFlavor() async {
    final flavor =
        String.fromEnvironment('FLAVOR', defaultValue: Flavor.development.name);

    flavors[flavor];
  }
}
