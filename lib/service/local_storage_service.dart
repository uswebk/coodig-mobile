import 'package:coodig_mobile/core/local_storage.dart';
import 'package:coodig_mobile/model/token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageServiceProvider =
    Provider<LocalStorageService>((ref) => LocalStorageService(ref.watch(localStorageProvider)));

class LocalStorageService {
  final String _accessTokenKey = 'accessToken';
  final String _refreshTokenKey = 'refreshToken';

  final LocalStorage _localStorage;

  LocalStorageService(this._localStorage);

  Future<void> addToken(Token token) async {
    await _localStorage.write(_accessTokenKey, token.accessToken.toString());
    await _localStorage.write(_refreshTokenKey, token.refreshToken.toString());
  }

  Future<String> getAccessToken() async {
    return await _localStorage.read(_accessTokenKey) ?? '';
  }

  Future<String> getRefreshToken() async {
    return await _localStorage.read(_refreshTokenKey) ?? '';
  }

  Future<void> removeToken() async {
    await _localStorage.delete(_accessTokenKey);
    await _localStorage.delete(_refreshTokenKey);
  }
}
