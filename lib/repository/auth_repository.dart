import 'package:coodig_mobile/core/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.watch(httpClientProvider)));

class AuthRepository {
  AuthRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<http.Response> login(String email, String password) async {
    Map<String, dynamic> body = <String, dynamic>{'email': email, 'password': password};
    return await _httpClient.post('/api/v1/accounts/login/', body, '');
  }

  Future<http.Response> signup(String name, String email, String password, String confirmPassword) async {
    Map<String, dynamic> body = <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password2': confirmPassword
    };
    return await _httpClient.post('/api/v1/accounts/register/', body, '');
  }

  Future<http.Response> refresh(String refreshToken) async {
    Map<String, dynamic> body = <String, dynamic>{'refresh': refreshToken};
    return await _httpClient.post('/api/token/refresh/', body, '');
  }

  Future<http.Response> verify(String otp, String accessToken) async {
    Map<String, dynamic> body = <String, dynamic>{'otp': otp};
    return await _httpClient.post('/api/v1/accounts/otp/verify/', body, accessToken);
  }

  Future<http.Response> sendOtp(String accessToken) async {
    Map<String, dynamic> body = <String, dynamic>{};
    return await _httpClient.post('/api/v1/accounts/otp/send/', body, accessToken);
  }

  Future<http.Response> sendResetPassword(String email) async {
    Map<String, dynamic> body = <String, dynamic>{'email': email};
    return await _httpClient.post('/api/v1/accounts/reset-password/send/', body, '');
  }

  Future<http.Response> resetPassword(String uid, String token, String password, String confirmPassword) async {
    Map<String, dynamic> body = <String, dynamic>{
      'uid': uid,
      'token': token,
      'password': password,
      'password2': confirmPassword
    };
    return await _httpClient.post('/api/v1/accounts/reset-password/', body, '');
  }
}
