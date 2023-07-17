import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'URI_SECRET_KEY', obfuscate: true)
  static final String uriSecretKey = _Env.uriSecretKey;
}
