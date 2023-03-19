import 'dart:convert';

import 'package:coodig_mobile/provider/login_provider.dart';
import 'package:coodig_mobile/provider/otp_provider.dart';
import 'package:coodig_mobile/provider/signup_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/local_storage.dart';
import '../model/token.dart';
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
      _ref.read(loginStateProvider.notifier).setMessage(errors);
    }

    if (response.statusCode > 400) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body)['errors']);
      _ref.read(loginStateProvider.notifier).setMessage(errors);
    }

    return false;
  }

  Future<bool> signup(String name, String email, String password,
      String confirmPassword) async {
    final response =
        await _authRepository.signup(name, email, password, confirmPassword);

    if (response.statusCode == 201) {
      Token token = Token.fromJson(json.decode(response.body)['token']);
      await _localStorage.addToken(token);

      return true;
    }

    if (response.statusCode == 400) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body));
      _ref.read(signupStateProvider.notifier).setMessage(errors);
    }

    if (response.statusCode > 400) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body)['errors']);
      _ref.read(signupStateProvider.notifier).setMessage(errors);
    }

    return false;
  }

  Future<void> refresh() async {
    String refreshToken = await _localStorage.getRefreshToken() ?? '';
    final response = await _authRepository.refresh(refreshToken);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body);
      body['refresh'] = refreshToken;
      Token token = Token.fromJson(body);
      await _localStorage.addToken(token);
    }
  }

  Future<void> logout() async {
    await _localStorage.removeToken();
  }

  Future<bool> sendOtp(String otp) async {
    final response = await _authRepository.sendOtp(otp);

    if (response.statusCode == 200) {
      return true;
    }

    if (response.statusCode == 401) {
      await refresh();

      final retryResponse = await _authRepository.sendOtp(otp);
      if (retryResponse.statusCode == 200) {
        return true;
      }

      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body));
      Map<String, dynamic> errorMessage = {
        'message': errors['messages'][0]['message']
      };
      _ref.read(otpStateProvider.notifier).setMessage(errorMessage);
      return false;
    }

    if (response.statusCode >= 400) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body));
      _ref.read(otpStateProvider.notifier).setMessage(errors);
    }

    return false;
  }
}
