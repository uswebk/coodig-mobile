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

  Future<http.Response> answer(int quizId, List<int> choiceIds, bool isCorrect, String accessToken) async {
    Map<String, dynamic> body = <String, dynamic>{'quiz_id': quizId, 'is_correct': isCorrect, 'choices': choiceIds};

    return await _httpClient.post('/api/v1/quizzes/answers/', body, accessToken);
  }

  Future<http.Response> history(String accessToken) async {
    return await _httpClient.get('/api/v1/quizzes/answers/', {}, accessToken);
  }

  Future<http.Response> answerStats(String accessToken) async {
    return await _httpClient.get('/api/v1/quizzes/answers/stats/', {}, accessToken);
  }
}
