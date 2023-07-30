import 'dart:convert';

import 'package:coodig_mobile/model/quiz.dart';
import 'package:coodig_mobile/repository/quiz_repository.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:coodig_mobile/service/secure_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizServiceProvider = Provider((ref) => QuizService(
    ref.watch(authServiceProvider), ref.watch(secureStorageServiceProvider), ref.watch(quizRepositoryProvider)));

class QuizService {
  QuizService(this._authService, this._secureStorageService, this._quizRepository);

  final AuthService _authService;
  final SecureStorageService _secureStorageService;
  final QuizRepository _quizRepository;

  Future<List<Quiz>> random(int limit) async {
    String accessToken = await _secureStorageService.getAccessToken();
    final response = await _quizRepository.random(limit, accessToken);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body).cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;

      return json.map((item) => Quiz.fromJson(item)).toList();
    }

    if (response.statusCode == 401) {
      await _authService.refresh();
      String accessToken = await _secureStorageService.getAccessToken();
      final retryResponse = await _quizRepository.random(limit, accessToken);

      if (retryResponse.statusCode == 200) {
        final json = jsonDecode(retryResponse.body).cast<Map<String, dynamic>>() as List<Map<String, dynamic>>;

        return json.map((item) => Quiz.fromJson(item)).toList();
      }
    }

    return [];
  }
}
