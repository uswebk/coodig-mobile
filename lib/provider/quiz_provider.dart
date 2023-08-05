import 'package:coodig_mobile/model/quiz.dart';
import 'package:coodig_mobile/service/quiz_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizStateNotifierProvider = StateNotifierProvider<QuizNotifier, List<Quiz>>((ref) {
  return QuizNotifier(ref.watch(quizServiceProvider));
});

class QuizNotifier extends StateNotifier<List<Quiz>> {
  QuizNotifier(this._quizService) : super([]);

  final QuizService _quizService;

  Future<void> random(int limit) async {
    state = await _quizService.random(limit);
  }
}
