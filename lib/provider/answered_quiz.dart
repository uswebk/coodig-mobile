import 'package:coodig_mobile/model/quiz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final answeredQuizNotifierProvider = StateNotifierProvider<AnsweredQuizNotifier, List<Quiz>>((ref) {
  return AnsweredQuizNotifier();
});

class AnsweredQuizNotifier extends StateNotifier<List<Quiz>> {
  AnsweredQuizNotifier() : super([]);

  Future<void> answer(Quiz quiz) async {
    state = [...state, quiz];
  }
}
