import 'package:coodig_mobile/model/quiz.dart';
import 'package:coodig_mobile/provider/quiz_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizFutureProvider = FutureProvider.autoDispose<Quiz?>((ref) async {
  List<Quiz> quiz = await ref.watch(quizStateNotifierProvider);

  if (quiz.isEmpty) {
    return null;
  }

  return quiz[0];
});
