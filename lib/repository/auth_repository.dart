import 'package:coodig_mobile/core/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final authRepositoryProvider = Provider((ref) => AuthRepository(HttpClient()));

class AuthRepository {
  AuthRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<http.Response> login(String email, String password) async {
    return await _httpClient.post('/api/v1/accounts/login/', {
      'email': email,
      'password': password,
    });
  }
}
