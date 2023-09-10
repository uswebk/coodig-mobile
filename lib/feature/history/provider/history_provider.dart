import 'package:coodig_mobile/model/quiz.dart';
import 'package:coodig_mobile/provider/answered_quiz.dart';
import 'package:coodig_mobile/service/quiz_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyFutureProvider = FutureProvider<List<QuizAnswer>>((ref) async {
  ref.watch(answeredQuizNotifierProvider);
  final history = await ref.watch(quizServiceProvider).history();
  return history;
});
