import 'package:coodig_mobile/components/hud.dart';
import 'package:coodig_mobile/components/indicator/loading_indicator.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/dashboard/provider/answer_stats_provider.dart';
import 'package:coodig_mobile/feature/learning/learning_page.dart';
import 'package:coodig_mobile/provider/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(answerStatsProvider);

    return Hud(
        isLoading: false,
        child: Scaffold(
          backgroundColor: CoodigColors.background,
          body: SingleChildScrollView(
            child: Stack(children: [
              Container(
                height: 250,
                decoration: const BoxDecoration(
                    color: CoodigColors.primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 120),
                      Card(
                        child: SizedBox(
                          width: 200,
                          height: 200,
                          child: Center(
                            child: SizedBox(
                              child: CircularPercentIndicator(
                                radius: 50.0,
                                lineWidth: 12.0,
                                percent: 0.2,
                                progressColor: Colors.blueAccent,
                                circularStrokeCap: CircularStrokeCap.round,
                                backgroundColor: Colors.black12,
                                center: const Text(
                                  '30%',
                                  style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 22),
                                ),
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
                                footer: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    '10 / 30',
                                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.only(left: 10, bottom: 40),
                        child: Row(
                          children: const [
                            Icon(Icons.bar_chart, size: 30, color: CoodigColors.grey),
                            Text('Stats',
                                style: TextStyle(color: CoodigColors.grey, fontSize: 24, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                      state.when(
                        data: (data) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text('Answer',
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 10),
                                        Text(
                                          data.answerCount.toString(),
                                          style: const TextStyle(
                                              color: Colors.black54, fontSize: 60, fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        const Text('Correct',
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                                        const SizedBox(height: 10),
                                        Text(
                                          data.correctCount.toString(),
                                          style: const TextStyle(
                                              color: Colors.black54, fontSize: 60, fontWeight: FontWeight.w600),
                                        ),
                                      ],
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
                  ),
                ),
              ),
            ]),
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: FloatingActionButton.extended(
              onPressed: () async {
                await ref.read(quizStateNotifierProvider.notifier).random(1);

                Get.to<dynamic>(() => const LearningPage());
              },
              label: Row(
                children: const [
                  Text(
                    'Start Learning',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.rocket_launch, size: 20)
                ],
              ),
              icon: null,
              backgroundColor: CoodigColors.primary,
            ),
          ),
        ));
  }
}
