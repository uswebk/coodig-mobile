import 'package:coodig_mobile/config/env.dart';
import 'package:coodig_mobile/config/flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

final environmentProvider = Provider((ref) => Environment(FlavorConfig.instance));

class Environment {
  Environment(this._flavor);

  final FlavorConfig _flavor;

  String getEndpoint() => _flavor.variables["apiEndpoint"].toString();
  String getUriSecretKey() => Env.uriSecretKey;
  bool isProduction() => _flavor.variables["name"].toString() == 'production';
  Future<String> getVersion() async {
    final info = await PackageInfo.fromPlatform();

    if (isProduction()) {
      return info.version;
    }

    return '${info.version}.dev';
  }
}
