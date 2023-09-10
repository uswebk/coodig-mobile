import 'package:coodig_mobile/components/indicator/loading_indicator.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/history/provider/history_provider.dart';
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
                                    color: answer.isCorrect ? Colors.green : CoodigColors.error,
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
                                    // show detail bottom sheet
                                    await showModalBottomSheet<dynamic>(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(30.0),
                                        ),
                                      ),
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) => Container(
                                        height: screenHeight * 0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.all(40.0),
                                          child: Column(
                                            children: [
                                              const Text('Q'),
                                              Text(answer.question),
                                              Expanded(
                                                child: ListView.builder(
                                                  itemCount: answer.answerChoices.length,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return ListTile(
                                                      title: Text(answer.answerChoices[index].choice),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Text(answer.question),
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
