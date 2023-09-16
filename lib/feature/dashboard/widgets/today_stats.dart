import 'package:coodig_mobile/components/indicator/loading_indicator.dart';
import 'package:coodig_mobile/model/answer_stats.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/color.dart';

class TodayStats extends HookConsumerWidget {
  const TodayStats({super.key, required this.stats});

  final AsyncValue<AnswerStats> stats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, bottom: 20),
          child: Row(
            children: const [
              Text('Today', style: TextStyle(color: CoodigColors.grey, fontSize: 22, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        stats.when(
          data: (data) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const Text('Answer', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                              const SizedBox(height: 10),
                              Text(data.todayAnswerCount.toString(),
                                  style: const TextStyle(
                                      color: Colors.blueGrey, fontSize: 50, fontWeight: FontWeight.w600)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const Text('Correct', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                              const SizedBox(height: 10),
                              Text(
                                data.todayCorrectCount.toString(),
                                style:
                                    const TextStyle(color: Colors.blueGrey, fontSize: 50, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            );
          },
          error: (e, str) => Text(e.toString()),
          loading: () => const LoadingIndicator(),
        )
      ],
    );
  }
}
