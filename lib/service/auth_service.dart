import 'dart:convert';

import 'package:coodig_mobile/core/local_storage.dart';
import 'package:coodig_mobile/exception/api_validation_exception.dart';
import 'package:coodig_mobile/model/token.dart';
import 'package:coodig_mobile/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider =
    Provider((ref) => AuthService(ref.watch(authRepositoryProvider), ref.watch(localStorageProvider)));

class AuthService {
  AuthService(this._authRepository, this._localStorage);

  final AuthRepository _authRepository;
  final LocalStorage _localStorage;

  Future<void> login(String email, String password) async {
    final response = await _authRepository.login(email, password);

    if (response.statusCode == 200) {
      Token token = Token.fromJson(json.decode(response.body)['token'] as Map<String, dynamic>);
      await _localStorage.addToken(token);
      return;
    }

    if ([400, 404].contains(response.statusCode)) {
      Map<String, dynamic> errors = json.decode(response.body) as Map<String, dynamic>;
      throw ApiValidationException(errors, response.statusCode);
    }

    throw Exception('Server Error');
  }

  Future<void> signup(String name, String email, String password, String confirmPassword) async {
    final response = await _authRepository.signup(name, email, password, confirmPassword);

    if (response.statusCode == 201) {
      Token token = Token.fromJson(json.decode(response.body)['token'] as Map<String, dynamic>);
      await _localStorage.addToken(token);
      return;
    }

    if (response.statusCode == 400) {
      Map<String, dynamic> errors = json.decode(response.body) as Map<String, dynamic>;
      throw ApiValidationException(errors, response.statusCode);
    }

    throw Exception('Server Error');
  }

  Future<void> refresh() async {
    String refreshToken = await _localStorage.getRefreshToken() ?? '';
    final response = await _authRepository.refresh(refreshToken);

    if (response.statusCode == 200) {
      Map<String, dynamic> body = json.decode(response.body) as Map<String, dynamic>;
      body['refresh'] = refreshToken;
      Token token = Token.fromJson(body);
      await _localStorage.addToken(token);
    }
  }

  Future<void> logout() async {
    await _localStorage.removeToken();
  }

  Future<bool> verify(String otp) async {
    final response = await _authRepository.verify(otp);

    if (response.statusCode == 200) {
      return true;
    }

    if (response.statusCode == 401) {
      await refresh();
      final retryResponse = await _authRepository.verify(otp);

      if (retryResponse.statusCode == 200) {
        return true;
      }

      Map<String, dynamic> errors = json.decode(retryResponse.body) as Map<String, dynamic>;
      if (retryResponse.statusCode == 401) {
        throw Exception(errors['messages'][0]['message'].toString());
      }
      if (retryResponse.statusCode >= 400) {
        throw Exception(errors['messages'].toString());
      }
    }

    if (response.statusCode >= 400) {
      Map<String, dynamic> errors = json.decode(response.body) as Map<String, dynamic>;
      throw Exception(errors['messages'].toString());
    }

    return false;
  }

  Future<void> resendOtp() async {
    final response = await _authRepository.sendOtp();

    if (response.statusCode == 200) {
      return;
    }

    if (response.statusCode == 401) {
      await refresh();
      final retryResponse = await _authRepository.sendOtp();

      if (retryResponse.statusCode == 200) {
        return;
      }
    }
    throw Exception('Send Otp Fail');
  }

  Future<void> sendResetPassword(String email) async {
    final response = await _authRepository.sendResetPassword(email);

    if (response.statusCode == 200) {
      return;
    }

    if (response.statusCode == 400) {
      Map<String, dynamic> errors = json.decode(response.body) as Map<String, dynamic>;
      throw ApiValidationException(errors, response.statusCode);
    }

    throw Exception('Server Error');
  }

  Future<void> resetPassword(String uid, String token, String password, String passwordConfirm) async {
    final response = await _authRepository.resetPassword(uid, token, password, passwordConfirm);

    if (response.statusCode == 200) {
      return;
    }

    if (response.statusCode == 400) {
      Map<String, dynamic> errors = json.decode(response.body) as Map<String, dynamic>;
      throw ApiValidationException(errors, response.statusCode);
    }

    throw Exception('Server Error');
  }
}
