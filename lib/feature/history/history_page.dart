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

    return Scaffold(
        backgroundColor: CoodigColors.background,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                  children: const [
                    Icon(Icons.history, size: 30, color: CoodigColors.grey),
                    SizedBox(width: 10),
                    Text(
                      'History',
                      style: TextStyle(color: CoodigColors.grey, fontSize: 30, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: state.when(
                  data: (data) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white70,
                              border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
                            ),
                            child: ListTile(
                              leading: Icon(
                                data[index].isCorrect ? Icons.check_circle : Icons.cancel,
                                color: data[index].isCorrect ? Colors.green : CoodigColors.error,
                                size: 18,
                              ),
                              title: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  data[index].question.toString(),
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
                                      'answer date:${data[index].createdAt.year}/${data[index].createdAt.month}/${data[index].createdAt.day}',
                                      style: const TextStyle(fontSize: 11),
                                    )),
                              ),
                              onTap: () {
                                // show detail bottom sheet
                              },
                            ),
                          ),
                        ],
                      ),
                    );
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
