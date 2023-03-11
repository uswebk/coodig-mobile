import 'package:coodig_mobile/core/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../core/local_storage.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(HttpClient()));

class AuthRepository {
  AuthRepository(this._httpClient);

  final HttpClient _httpClient;
  final _localStorage = LocalStorage();

  Future<http.Response> login(String email, String password) async {
    return await _httpClient.post(
        '/api/v1/accounts/login/',
        {
          'email': email,
          'password': password,
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

  Future<http.Response> sendOtp(String otp, String email) async {
    String accessToken = await _localStorage.getAccessToken() ?? '';
    return await _httpClient.post('/api/otp/verify/', {}, accessToken);
  }
}
