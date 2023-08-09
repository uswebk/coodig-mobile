import 'package:coodig_mobile/enum/screen.dart';
import 'package:coodig_mobile/model/quiz.dart';
import 'package:coodig_mobile/provider/page_index_provider.dart';
import 'package:coodig_mobile/service/quiz_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final historyFutureProvider = FutureProvider<List<QuizAnswer>>((ref) async {
  ScreenItem screen = ref.watch(screenItemProvider);

  if (screen == ScreenItem.history) {
    return await ref.watch(quizServiceProvider).history();
  }

  return [];
});
