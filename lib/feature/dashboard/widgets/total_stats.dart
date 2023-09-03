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
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: const [
                      Icon(Icons.bar_chart, size: 20, color: CoodigColors.grey),
                      Text('Stats', style: TextStyle(color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                stats.when(
                    data: (data) {
                      final double percent = data.correctCount == 0 ? 0 : data.correctCount / data.answerCount;
                      final String percentLabel = '${(percent * 100).round()}';
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _stats(data.answerCount.toString(), '', 'answer'),
                          _stats(data.correctCount.toString(), '', 'correct'),
                          _stats(percentLabel, '%', 'rate'),
                        ],
                      );
                    },
                    error: (e, s) => Text(e.toString()),
                    loading: () => const LoadingIndicator()),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _stats(String value, String suffix, String subtitle) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(value, style: const TextStyle(color: Colors.black87, fontSize: 32, fontWeight: FontWeight.bold)),
                Text(suffix, style: const TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: [
                Text(subtitle, style: const TextStyle(color: Colors.black38, fontSize: 14, fontWeight: FontWeight.bold))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
