import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String> getEndpoint() async {
  TargetPlatform platform = defaultTargetPlatform;

  if (platform.name == 'iOS') {
    return dotenv.env['ENDPOINT_FOR_IOS'] ?? '';
  }

  return dotenv.env['ENDPOINT_FOR_ANDROID'] ?? '';
}
