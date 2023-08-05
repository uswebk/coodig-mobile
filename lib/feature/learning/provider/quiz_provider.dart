import 'package:coodig_mobile/exception/quiz_exception.dart';
import 'package:coodig_mobile/model/quiz.dart';
import 'package:coodig_mobile/provider/quiz_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizFutureProvider = FutureProvider<Quiz>((ref) async {
  List<Quiz> quiz = await ref.watch(quizStateNotifierProvider);

  if (quiz.isEmpty) {
    throw QuizNotFoundException();
  }

  return quiz[0];
});
