import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/local_storage.dart';
import '../model/token.dart';
import '../provider/login_message_provider.dart';
import '../repository/auth_repository.dart';

final repository = Provider((ref) => ref.watch(authRepositoryProvider));

final authServiceProvider =
    Provider((ref) => AuthService(ref, ref.watch(repository), LocalStorage()));

class AuthService {
  AuthService(
    this._ref,
    this._authRepository,
    this._localStorage,
  );

  final ProviderRef _ref;

  final AuthRepository _authRepository;
  final LocalStorage _localStorage;

  Future<bool> login(String email, String password) async {
    final response = await _authRepository.login(email, password);

    if (response.statusCode == 200) {
      Token token = Token.fromJson(json.decode(response.body)['token']);
      await _localStorage.addToken(token);

      return true;
    }

    if (response.statusCode == 400) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body));
      _ref.read(loginMessageProvider.notifier).setMessage(errors);
    }

    if (response.statusCode > 400) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body)['errors']);
      _ref.read(loginMessageProvider.notifier).setMessage(errors);
    }

    return false;
  }

  Future<void> logout() async {
    await _localStorage.removeToken();
  }
}
