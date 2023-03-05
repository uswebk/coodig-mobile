import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/token.dart';

class LocalStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> addToken(Token token) async {
    await _storage.write(key: 'accessToken', value: token.accessToken);
    await _storage.write(key: 'refreshToken', value: token.refreshToken);
  }

  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: 'refreshToken');
  }

  Future<void> removeToken() async {
    await _storage.delete(key: 'accessToken');
    await _storage.delete(key: 'refreshToken');
  }
}
