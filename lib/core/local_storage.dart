import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  final _storage = const FlutterSecureStorage();

  Future<void> addToken(Map<String, dynamic> token) async {
    await _storage.write(key: 'accessToken', value: token['access'].toString());
    await _storage.write(
        key: 'refreshToken', value: token['refresh'].toString());
  }

  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key: 'accessToken');
  }
}
