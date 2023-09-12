import 'package:coodig_mobile/components/indicator/loading_indicator.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/history/provider/history_provider.dart';
import 'package:coodig_mobile/model/quiz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryPage extends HookConsumerWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(historyFutureProvider);
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: CoodigColors.background,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Expanded(
                child: state.when(
                  data: (data) {
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final answer = data[index];
                          return Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white70,
                                  border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    answer.isCorrect ? Icons.check_circle : Icons.cancel,
                                    color: answer.isCorrect ? CoodigColors.success : CoodigColors.error,
                                    size: 18,
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      answer.question.toString(),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text(
                                          'answer date:${answer.createdAt.year}/${answer.createdAt.month}/${answer.createdAt.day}',
                                          style: const TextStyle(fontSize: 11),
                                        )),
                                  ),
                                  onTap: () async {
                                    List<QuizAnswerChoice> answerList =
                                        answer.answerChoices.where((QuizAnswerChoice value) => value.isAnswer).toList();

                                    await showModalBottomSheet<dynamic>(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30.0),
                                        ),
                                      ),
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) => SizedBox(
                                        height: screenHeight * 0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.all(40.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  (answer.isCorrect)
                                                      ? const Chip(
                                                          backgroundColor: CoodigColors.success,
                                                          label: Text('correct', style: TextStyle(color: Colors.white)),
                                                        )
                                                      : const Chip(
                                                          backgroundColor: CoodigColors.error,
                                                          label:
                                                              Text('incorrect', style: TextStyle(color: Colors.white)),
                                                        ),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: const [
                                                  Text('Q.',
                                                      style: TextStyle(
                                                          fontSize: 22,
                                                          color: Colors.blue,
                                                          fontWeight: FontWeight.bold)),
                                                ],
                                              ),
                                              const Divider(),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                                                  child: SingleChildScrollView(child: Text(answer.question)),
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                                                child: Divider(),
                                              ),
                                              Row(
                                                children: const [
                                                  Text(
                                                    'Choices',
                                                    style: TextStyle(
                                                        fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              Expanded(
                                                flex: 2,
                                                child: ListView.builder(
                                                  itemCount: answer.answerChoices.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    final QuizAnswerChoice answerChoice = answer.answerChoices[index];
                                                    return Container(
                                                      decoration: const BoxDecoration(
                                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                                        color: Colors.white,
                                                      ),
                                                      margin: const EdgeInsets.symmetric(vertical: 4),
                                                      child: ListTile(
                                                        title: Text(
                                                          answerChoice.choice,
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  answerChoice.isSelect ? FontWeight.bold : null),
                                                        ),
                                                        subtitle: (answerChoice.isSelect)
                                                            ? const Text('your selected',
                                                                style: TextStyle(color: CoodigColors.primary))
                                                            : null,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                                                child: Divider(),
                                              ),
                                              Row(
                                                children: const [
                                                  Text(
                                                    'Answers',
                                                    style: TextStyle(
                                                        fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 15),
                                              Expanded(
                                                flex: 1,
                                                child: SizedBox(
                                                  child: ListView.builder(
                                                    itemCount: answerList.length,
                                                    itemBuilder: (BuildContext context, int index) {
                                                      return Container(
                                                        decoration: const BoxDecoration(
                                                          borderRadius: BorderRadius.all(Radius.circular(15)),
                                                          color: Colors.white,
                                                        ),
                                                        margin: const EdgeInsets.symmetric(vertical: 4),
                                                        child: ListTile(
                                                          title: Text(
                                                            answerList[index].choice,
                                                            style: const TextStyle(fontSize: 12),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  error: (e, s) => Text('Error: $e'),
                  loading: () => const Center(child: LoadingIndicator()),
                ),
              ),
            ],
          ),
        ));
  }
}
