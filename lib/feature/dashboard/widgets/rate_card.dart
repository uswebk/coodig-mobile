import 'package:coodig_mobile/components/indicator/loading_indicator.dart';
import 'package:coodig_mobile/model/answer_stats.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RateCard extends HookConsumerWidget {
  const RateCard({super.key, required this.stats});

  final AsyncValue<AnswerStats> stats;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: SizedBox(
            child: stats.when(
              data: (data) {
                final double percent = data.answerCount == 0 ? 0 : data.answerCount / data.total;
                final String percentLabel = '${(percent * 100).round()}%';
                final String score = '${data.answerCount}/${data.total}';

                return CircularPercentIndicator(
                  radius: 50.0,
                  lineWidth: 12.0,
                  percent: percent,
                  animation: true,
                  progressColor: Colors.blueAccent,
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: Colors.black12,
                  center: Text(percentLabel,
                      style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 22)),
                  header: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.bubble_chart_rounded, size: 30, color: Colors.blueAccent),
                        Text(
                          'Achievement Rate',
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  footer: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      score,
                      style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                  ),
                );
              },
              error: (e, s) => Text(e.toString()),
              loading: () => const LoadingIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
