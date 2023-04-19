import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentService {
  Future<void> setEnv() async {
    await dotenv.load(fileName: '.env');

    if (dotenv.env['PRODUCTION'] != null &&
        bool.fromEnvironment(dotenv.env['PRODUCTION'].toString())) {
      await dotenv.load(fileName: './lib/config/.env.pro');
    } else {
      await dotenv.load(fileName: './lib/config/.env.dev');
    }
  }
}
