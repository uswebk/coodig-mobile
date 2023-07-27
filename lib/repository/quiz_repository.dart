import 'package:coodig_mobile/core/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final quizRepositoryProvider = Provider((ref) => QuizRepository(ref.watch(httpClientProvider)));

class QuizRepository {
  QuizRepository(this._httpClient);

  final HttpClient _httpClient;

  Future<http.Response> random(int limit, String accessToken) async {
    return await _httpClient.get('/api/v1/quizzes/random/', {'limit': limit.toString()}, accessToken);
  }
}
