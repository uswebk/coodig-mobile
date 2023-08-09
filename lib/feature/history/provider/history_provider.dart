import 'package:coodig_mobile/model/quiz.dart';
import 'package:coodig_mobile/service/quiz_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyFutureProvider = FutureProvider<List<QuizAnswer>>((ref) async {
  return await ref.watch(quizServiceProvider).history();
});
