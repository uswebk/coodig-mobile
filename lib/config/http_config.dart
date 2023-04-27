import 'flavor.dart';

Future<String> getEndpoint() async {
  return FlavorConfig.instance.variables["apiEndpoint"];
}
