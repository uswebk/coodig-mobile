import 'package:coodig_mobile/core/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../core/http_auth_client.dart';

final userRepositoryProvider =
    Provider((ref) => UserRepository(HttpAuthClient()));

class UserRepository {
  UserRepository(this._httpClient);

  final HttpAuthClient _httpClient;
  final _localStorage = LocalStorage();

  Future<http.Response> fetchUser() async {
    String accessToken = await _localStorage.getAccessToken() ?? '';
    return await _httpClient.get('/api/v1/accounts/me/', {}, accessToken);
  }
}
