import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final biometricsServiceProvider = Provider((ref) => BiometricsService(LocalAuthentication()));

class BiometricsService {
  BiometricsService(this._localAuthentication);

  final LocalAuthentication _localAuthentication;

  Future<bool> canAuthenticate() async {
    final bool canAuthenticateWithBiometrics = await _localAuthentication.canCheckBiometrics;

    return canAuthenticateWithBiometrics || await _localAuthentication.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    return await _localAuthentication.authenticate(
      localizedReason: 'Please authenticate to show account balance',
      options: const AuthenticationOptions(biometricOnly: true, useErrorDialogs: true, stickyAuth: true),
    );
  }
}
