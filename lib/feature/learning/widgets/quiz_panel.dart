import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/exception/quiz_exception.dart';
import 'package:coodig_mobile/feature/learning/provider/quiz_provider.dart';
import 'package:coodig_mobile/feature/learning/widgets/choice_item.dart';
import 'package:coodig_mobile/feature/learning/widgets/complete_message.dart';
import 'package:coodig_mobile/feature/learning/widgets/error_message.dart';
import 'package:coodig_mobile/feature/learning/widgets/floating_button.dart';
import 'package:coodig_mobile/feature/learning/widgets/question.dart';
import 'package:coodig_mobile/model/quiz.dart';
import 'package:coodig_mobile/provider/quiz_provider.dart';
import 'package:coodig_mobile/service/quiz_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuizPanel extends HookConsumerWidget {
  const QuizPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizService = ref.watch(quizServiceProvider);
    final state = ref.watch(quizFutureProvider);
    final selectedChoices = useState<List<int>>([]);
    final correctIds = useState<List<int>>([]);
    final quizId = useState<int?>(null);
    final isAnswer = useState<bool>(false);
    final isCorrectAnswer = useState<bool>(false);

    useEffect(() {
      selectedChoices.value = [];
      isAnswer.value = false;
      return null;
    }, [state]);

    return state.when(
      loading: () => const CircularProgressIndicator(),
      error: (e, stack) {
        if (e is QuizNotFoundException) {
          return const CompleteMessage();
        }

        return const ErrorMessage();
      },
      data: (data) {
        correctIds.value = data.choices.where((e) => e.isAnswer == true).map((e) => e.id).toList();
        quizId.value = data.id;

        return Expanded(
          child: Stack(
            children: [
              Column(
                children: [
                  Question(data.question),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.choices.length,
                      itemBuilder: (context, index) {
                        Choice choice = data.choices[index];
                        bool isSelected = selectedChoices.value.contains(choice.id);
                        bool isCorrect = correctIds.value.contains(choice.id);

                        return Column(
                          children: [
                            (!isAnswer.value)
                                ? InkWell(
                                    onTap: () {
                                      List<int> currentSelectedChoices = selectedChoices.value;
                                      selectedChoices.value = [];
                                      if (isSelected) {
                                        currentSelectedChoices.remove(choice.id);
                                      } else {
                                        currentSelectedChoices.add(choice.id);
                                      }
                                      selectedChoices.value = currentSelectedChoices;
                                    },
                                    child: ChoiceItem(
                                      cardColor: isSelected ? Colors.white : Colors.white,
                                      cardBorderColor: isSelected ? CoodigColors.buttonPrimary : Colors.black12,
                                      cardBorderWidth: isSelected ? 1.5 : 1,
                                      trailing: isSelected
                                          ? const Icon(Icons.check_circle, color: CoodigColors.buttonPrimary)
                                          : const Icon(Icons.circle_outlined, color: Colors.black12),
                                      sentence: choice.sentence,
                                      sentenceColor: isSelected ? Colors.black : Colors.black,
                                      sentenceWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  )
                                : ChoiceItem(
                                    cardColor: isSelected
                                        ? (isCorrect ? CoodigColors.correctCard : CoodigColors.incorrectCard)
                                        : (isCorrect ? CoodigColors.incorrectCard : null),
                                    cardBorderColor: isSelected
                                        ? (isCorrect ? Colors.green : Colors.red)
                                        : (isCorrect ? Colors.red : Colors.black12),
                                    cardBorderWidth: isSelected ? 2 : 1,
                                    trailing: isSelected
                                        ? (isCorrect
                                            ? const Icon(Icons.check_circle, color: Colors.green)
                                            : const Icon(Icons.cancel, color: Colors.redAccent))
                                        : (isCorrect
                                            ? const Icon(Icons.check_circle, color: Colors.redAccent)
                                            : const Icon(Icons.circle_outlined, color: Colors.black12)),
                                    sentence: choice.sentence,
                                    sentenceColor: isSelected ? Colors.black87 : Colors.black54,
                                    sentenceWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                            (index + 1 == data.choices.length) ? const SizedBox(height: 120) : const SizedBox(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: (!isAnswer.value)
                    ? (selectedChoices.value.isNotEmpty)
                        ? FloatingButton('Answer', Icons.question_answer_sharp, () async {
                            try {
                              List<int> answerIds = selectedChoices.value;
                              bool isCorrect = quizService.isCorrectQuiz(correctIds.value, answerIds);
                              QuizAnswer? result = await quizService.answer(quizId.value as int, answerIds, isCorrect);

                              isCorrectAnswer.value = result.isCorrect;
                            } catch (e) {
                              debugPrint(e.toString());
                            } finally {
                              isAnswer.value = true;
                            }
                          })
                        : const SizedBox()
                    : FloatingButton(
                        'Next',
                        Icons.play_arrow_rounded,
                        () async {
                          await ref.read(quizStateNotifierProvider.notifier).random(1);
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
