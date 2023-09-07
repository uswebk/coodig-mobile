import 'package:coodig_mobile/components/hud.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/dashboard/provider/answer_stats_provider.dart';
import 'package:coodig_mobile/feature/dashboard/widgets/learning_button.dart';
import 'package:coodig_mobile/feature/dashboard/widgets/rate_card.dart';
import 'package:coodig_mobile/feature/dashboard/widgets/today_stats.dart';
import 'package:coodig_mobile/feature/dashboard/widgets/total_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 120),
                    Padding(padding: const EdgeInsets.only(bottom: 20), child: RateCard(stats: state)),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 20.0), child: TotalStats(stats: state)),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 20.0), child: TodayStats(stats: state)),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 50))
                  ],
                ),
              ),
            ),
          ]),
        ),
        floatingActionButton: const LearningButton(),
      ),
    );
  }
}
