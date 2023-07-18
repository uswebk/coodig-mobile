import 'package:coodig_mobile/core/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final otpRepositoryProvider = Provider((ref) => OtpRepository(ref.watch(httpClientProvider)));

class OtpRepository {
  OtpRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<http.Response> fetch(String accessToken) async {
    return await _httpClient.get('/api/v1/accounts/otp/', {}, accessToken);
  }
}
