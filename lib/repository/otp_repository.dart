import 'package:coodig_mobile/core/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../core/http_client.dart';

final otpRepositoryProvider = Provider((ref) => OtpRepository(HttpClient()));

class OtpRepository {
  OtpRepository(this._httpClient);

  final HttpClient _httpClient;
  final _localStorage = LocalStorage();

  Future<http.Response> fetch() async {
    String accessToken = await _localStorage.getAccessToken() ?? '';
    return await _httpClient.get('/api/v1/accounts/otp/', {}, accessToken);
  }
}
