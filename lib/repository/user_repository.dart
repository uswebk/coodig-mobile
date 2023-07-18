import 'package:coodig_mobile/core/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final userRepositoryProvider = Provider((ref) => UserRepository(ref.watch(httpClientProvider)));

class UserRepository {
  UserRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<http.Response> fetchMe(String accessToken) async {
    return await _httpClient.get('/api/v1/accounts/me/', {}, accessToken);
  }
}
