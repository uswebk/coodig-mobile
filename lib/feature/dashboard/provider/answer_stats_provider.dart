import 'package:coodig_mobile/model/answer_stats.dart';
import 'package:coodig_mobile/service/quiz_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final answerStatsProvider = FutureProvider<AnswerStats>((ref) async {
  final quizService = ref.watch(quizServiceProvider);
  final stats = await quizService.answerStats();

  return stats;
});
