import 'package:coodig_mobile/model/token.dart';
import 'package:coodig_mobile/repository/secure_storage_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final secureStorageServiceProvider =
    Provider<SecureStorageService>((ref) => SecureStorageService(ref.watch(secureStorageRepositoryProvider)));

class SecureStorageService {
  final String _accessTokenKey = 'accessToken';
  final String _refreshTokenKey = 'refreshToken';
  final String _refreshTokenForBiometricsKey = 'refreshTokenForBiometrics';

  final SecureStorageRepository _secureStorageRepository;

  SecureStorageService(this._secureStorageRepository);

  Future<void> setToken(Token token) async {
    await _secureStorageRepository.write(_accessTokenKey, token.accessToken.toString());
    await _secureStorageRepository.write(_refreshTokenKey, token.refreshToken.toString());
    await _secureStorageRepository.write(_refreshTokenForBiometricsKey, token.refreshToken.toString());
  }

  Future<String> getAccessToken() async {
    return await _secureStorageRepository.read(_accessTokenKey) ?? '';
  }

  Future<String> getRefreshToken() async {
    return await _secureStorageRepository.read(_refreshTokenKey) ?? '';
  }

  Future<void> deleteToken() async {
    await _secureStorageRepository.delete(_accessTokenKey);
    await _secureStorageRepository.delete(_refreshTokenKey);
  }

  Future<void> deleteAll() async {
    await _secureStorageRepository.deleteAll();
  }
}
