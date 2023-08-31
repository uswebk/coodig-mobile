import 'package:coodig_mobile/components/indicator/loading_indicator.dart';
import 'package:coodig_mobile/model/answer_stats.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/color.dart';

class TotalStats extends HookConsumerWidget {
  const TotalStats({super.key, required this.stats});

  final AsyncValue<AnswerStats> stats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, bottom: 40),
          child: Row(
            children: const [
              Icon(Icons.bar_chart, size: 30, color: CoodigColors.grey),
              Text('Total Stats', style: TextStyle(color: CoodigColors.grey, fontSize: 24, fontWeight: FontWeight.w600))
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
                      child: Column(
                        children: [
                          const Text('Answer', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Text(
                            data.answerCount.toString(),
                            style: const TextStyle(color: Colors.black54, fontSize: 60, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text('Correct', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          Text(data.correctCount.toString(),
                              style: const TextStyle(color: Colors.black54, fontSize: 60, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),
                  ],
                ),
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
