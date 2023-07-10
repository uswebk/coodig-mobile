import 'package:coodig_mobile/core/http_client.dart';
import 'package:coodig_mobile/core/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.watch(httpClientProvider), ref.watch(localStorageProvider)));

class AuthRepository {
  AuthRepository(this._httpClient, this._localStorage);

  final HttpClient _httpClient;
  final LocalStorage _localStorage;

  Future<http.Response> login(String email, String password) async {
    return await _httpClient.post(
        '/api/v1/accounts/login/',
        {
          'email': email,
          'password': password,
        },
        '');
  }

  Future<http.Response> signup(String name, String email, String password, String confirmPassword) async {
    return await _httpClient.post(
        '/api/v1/accounts/register/',
        {
          'name': name,
          'email': email,
          'password': password,
          'password2': confirmPassword,
        },
        '');
  }

  Future<http.Response> refresh(String refreshToken) async {
    return await _httpClient.post(
        '/api/token/refresh/',
        {
          'refresh': refreshToken,
        },
        '');
  }

  Future<http.Response> verify(String otp) async {
    String accessToken = await _localStorage.getAccessToken() ?? '';
    return await _httpClient.post('/api/v1/accounts/otp/verify/', {'otp': otp}, accessToken);
  }

  Future<http.Response> sendOtp() async {
    String accessToken = await _localStorage.getAccessToken() ?? '';
    return await _httpClient.post('/api/v1/accounts/otp/send/', {}, accessToken);
  }

  Future<http.Response> sendResetPassword(String email) async {
    return await _httpClient.post('/api/v1/accounts/reset-password/send/', {'email': email}, '');
  }

  Future<http.Response> resetPassword(
    String uid,
    String token,
    String password,
    String confirmPassword,
  ) async {
    return await _httpClient.post('/api/v1/accounts/reset-password/',
        {'uid': uid, 'token': token, 'password': password, 'password2': confirmPassword}, '');
  }
}
