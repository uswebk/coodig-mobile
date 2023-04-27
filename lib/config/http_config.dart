import 'package:flutter_flavor/flutter_flavor.dart';

Future<String> getEndpoint() async {
  return FlavorConfig.instance.variables["apiEndpoint"];
}
