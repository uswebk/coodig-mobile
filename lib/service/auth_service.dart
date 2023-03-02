import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/local_storage.dart';
import '../repository/auth_repository.dart';

final repository = Provider((ref) => ref.watch(authRepositoryProvider));

final authServiceProvider =
    Provider((ref) => AuthService(ref.watch(repository)));

class AuthService {
  AuthService(this._authRepository);

  final AuthRepository _authRepository;
  final _localStorage = LocalStorage();

  Future<bool> login(String email, String password) async {
    final response = await _authRepository.login(email, password);

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      Map<String, dynamic> token = Map<String, dynamic>.from(body['token']);
      await _localStorage.addToken(token);

      return true;
    }

    return false;
  }

  Future<void> logout() async {
    await _localStorage.removeToken();
  }
}
