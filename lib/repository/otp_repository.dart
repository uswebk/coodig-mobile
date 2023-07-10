import 'package:coodig_mobile/core/http_client.dart';
import 'package:coodig_mobile/core/local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final otpRepositoryProvider = Provider((ref) => OtpRepository(ref.watch(httpClientProvider), ref.watch(localStorageProvider)));

class OtpRepository {
  OtpRepository(this._httpClient, this._localStorage);

  final HttpClient _httpClient;
  final LocalStorage _localStorage;

  Future<http.Response> fetch() async {
    String accessToken = await _localStorage.getAccessToken() ?? '';
    return await _httpClient.get('/api/v1/accounts/otp/', {}, accessToken);
  }
}
