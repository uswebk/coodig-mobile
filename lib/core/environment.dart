import 'package:coodig_mobile/config/flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final environmentProvider = Provider((ref) => Environment(FlavorConfig.instance));

class Environment {
  Environment(this._flavor);

  final FlavorConfig _flavor;

  String getEndpoint() => _flavor.variables["apiEndpoint"].toString();
  bool isProduction() => _flavor.variables["name"].toString() == 'production';
}
