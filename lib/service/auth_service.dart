import 'dart:convert';

import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/local_storage.dart';
import '../model/token.dart';
import '../repository/auth_repository.dart';

final repository = Provider((ref) => ref.watch(authRepositoryProvider));

final authServiceProvider =
    Provider((ref) => AuthService(ref.watch(repository), LocalStorage()));

class AuthService {
  AuthService(this._authRepository, this._localStorage);

  final AuthRepository _authRepository;
  final LocalStorage _localStorage;

  Future<void> login(String email, String password) async {
    final response = await _authRepository.login(email, password);

    if (response.statusCode == 200) {
      Token token = Token.fromJson(json.decode(response.body)['token']);
      await _localStorage.addToken(token);
      return;
    }

    if (response.statusCode == 400 || response.statusCode == 404) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body));
      throw ApiException(errors);
    }

    throw Exception('Server Error');
  }

  Future<void> signup(String name, String email, String password,
      String confirmPassword) async {
    final response =
        await _authRepository.signup(name, email, password, confirmPassword);

    if (response.statusCode == 201) {
      Token token = Token.fromJson(json.decode(response.body)['token']);
      await _localStorage.addToken(token);
      return;
    }

    if (response.statusCode == 400) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body));
      throw ApiException(errors);
    }

    if (response.statusCode > 400) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body)['errors']);
      throw ApiException(errors);
    }
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
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(retryResponse.body));
      if (retryResponse.statusCode == 401) {
        throw Exception(errors['messages'][0]['message'].toString());
      }
      if (retryResponse.statusCode >= 400) {
        throw Exception(errors['messages'].toString());
      }
    }

    if (response.statusCode >= 400) {
      Map<String, dynamic> errors =
          Map<String, dynamic>.from(json.decode(response.body));
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

  Future<bool> sendResetPassword(String email) async {
    final response = await _authRepository.sendResetPassword(email);

    if (response.statusCode == 200) {
      return true;
    }

    Map<String, dynamic> errors =
        Map<String, dynamic>.from(json.decode(response.body));
    if (response.statusCode == 400) {
      throw Exception(getMessageByErrors(errors));
    }
    if (response.statusCode == 404) {
      throw Exception(errors['message'].toString());
    }

    throw Exception('Server Error');
  }

  String getMessageByErrors(Map<String, dynamic> errors) {
    String errorMessage = '';

    errors.forEach((key, value) {
      errorMessage += '${value[0]}\n';
    });

    RegExp exp = RegExp(r'\n+$');
    String message = errorMessage.replaceAll(exp, '');

    return message;
  }
}
