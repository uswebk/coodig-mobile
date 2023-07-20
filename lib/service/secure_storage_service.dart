import 'package:coodig_mobile/model/token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageServiceProvider =
    Provider<SecureStorageService>((ref) => SecureStorageService(const FlutterSecureStorage()));

class SecureStorageService {
  final String _accessTokenKey = 'accessToken';
  final String _refreshTokenKey = 'refreshToken';
  final String _refreshTokenForBiometricsKey = 'refreshTokenForBiometrics';
  final String _isFirstTImeKey = 'isFirstTime';

  final FlutterSecureStorage _localStorage;

  SecureStorageService(this._localStorage);

  Future<void> setToken(Token token) async {
    await _localStorage.write(key: _accessTokenKey, value: token.accessToken.toString());
    await _localStorage.write(key: _refreshTokenKey, value: token.refreshToken.toString());
    await _localStorage.write(key: _refreshTokenForBiometricsKey, value: token.refreshToken.toString());
  }
  //
  // Future<void> setIsFirstTime(bool isFirstTime) async {
  //   await _localStorage.write(_isFirstTImeKey, isFirstTime.toString());
  // }

  Future<String> getAccessToken() async {
    return await _localStorage.read(key: _accessTokenKey) ?? '';
  }

  Future<String> getRefreshToken() async {
    return await _localStorage.read(key: _refreshTokenKey) ?? '';
  }
  //
  // Future<bool> isFirstTime() async {
  //   String? isFirstTime = await _localStorage.read(_isFirstTImeKey);
  //
  //   if (isFirstTime == null) {
  //     return true;
  //   }
  //
  //   if (isFirstTime == 'true') {
  //     return true;
  //   }
  //
  //   return false;
  // }

  Future<void> deleteToken() async {
    await _localStorage.delete(key: _accessTokenKey);
    await _localStorage.delete(key: _refreshTokenKey);
  }

  Future<void> deleteAll() async {
    await _localStorage.deleteAll();
  }
}
