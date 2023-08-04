import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/learning/widgets/choice_item.dart';
import 'package:coodig_mobile/feature/learning/widgets/expanded_button.dart';
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
      error: (err, stack) => Text('Error: $err'), // TODO: alert or view non item message
      data: (data) {
        correctIds.value = data.choices.where((e) => e.isAnswer == true).map((e) => e.id).toList();
        quizId.value = data.id;

        return Expanded(
          child: Column(
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

                    return (!isAnswer.value)
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
                              isSelected ? Colors.white : Colors.white,
                              Colors.black12,
                              isSelected ? 2 : 1,
                              isSelected
                                  ? const Icon(Icons.check_circle, color: CoodigColors.buttonPrimary)
                                  : const Icon(Icons.circle_outlined, color: Colors.black12),
                              choice.sentence,
                              isSelected ? Colors.black : Colors.black,
                              isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          )
                        : ChoiceItem(
                            isSelected
                                ? (isCorrect ? CoodigColors.correctCard : CoodigColors.incorrectCard)
                                : (isCorrect ? CoodigColors.incorrectCard : null),
                            isSelected
                                ? (isCorrect ? Colors.green : Colors.red)
                                : (isCorrect ? Colors.red : Colors.black12),
                            isSelected ? 2 : 1,
                            isSelected
                                ? (isCorrect
                                    ? const Icon(Icons.check_circle, color: Colors.green)
                                    : const Icon(Icons.cancel, color: Colors.redAccent))
                                : (isCorrect
                                    ? const Icon(Icons.check_circle, color: Colors.redAccent)
                                    : const Icon(Icons.circle_outlined, color: Colors.black12)),
                            choice.sentence,
                            isSelected ? Colors.black87 : Colors.black54,
                            isSelected ? FontWeight.bold : FontWeight.normal,
                          );
                  },
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  (!isAnswer.value)
                      ? ExpandedButton(
                          'Answer',
                          (selectedChoices.value.isNotEmpty)
                              ? () async {
                                  try {
                                    List<int> answerIds = selectedChoices.value;
                                    bool isCorrect = quizService.isCorrectQuiz(correctIds.value, answerIds);
                                    QuizAnswer? result =
                                        await quizService.answer(quizId.value as int, answerIds, isCorrect);

                                    isCorrectAnswer.value = result.isCorrect;
                                  } catch (e) {
                                    debugPrint(e.toString());
                                  } finally {
                                    isAnswer.value = true;
                                  }
                                }
                              : null)
                      : ExpandedButton(
                          'Next',
                          () async {
                            await ref.read(quizStateNotifierProvider.notifier).random(1);
                          },
                        )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
