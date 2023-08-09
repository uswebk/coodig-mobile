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

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'History',
              style: TextStyle(color: CoodigColors.grey, fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ),
          body: Column(
            children: [
              const SizedBox(height: 30),
              Expanded(
                  child: state.when(
                      data: (data) {
                        return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              ListTile(
                                leading: Icon(
                                  data[index].isCorrect ? Icons.check_circle : Icons.cancel,
                                  color: data[index].isCorrect ? Colors.green : CoodigColors.error,
                                ),
                                title: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(data[index].question.toString()),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                          'answer date:${data[index].createdAt.year}/${data[index].createdAt.month}/${data[index].createdAt.day}')),
                                ),
                                onTap: () {
                                  // show detail bottom sheet
                                },
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      },
                      error: (e, s) {
                        return Text('Error: $e');
                      },
                      loading: () => const Center(child: LoadingIndicator()))),
            ],
          )),
    );
  }
}
