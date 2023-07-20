import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageRepositoryProvider = Provider((ref) => SecureStorageRepository(const FlutterSecureStorage()));

class SecureStorageRepository {
  SecureStorageRepository(this._secureStorage);

  final FlutterSecureStorage _secureStorage;

  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }
}
