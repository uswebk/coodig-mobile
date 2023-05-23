import 'package:coodig_mobile/core/http_client.dart';
import 'package:coodig_mobile/core/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final userRepositoryProvider = Provider((ref) => UserRepository(HttpClient()));

class UserRepository {
  UserRepository(this._httpClient);

  final HttpClient _httpClient;
  final _localStorage = LocalStorage();

  Future<http.Response> fetchMe() async {
    String accessToken = await _localStorage.getAccessToken() ?? '';
    return await _httpClient.get('/api/v1/accounts/me/', {}, accessToken);
  }
}
