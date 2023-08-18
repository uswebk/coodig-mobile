import 'package:coodig_mobile/components/hud.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/learning/learning_page.dart';
import 'package:coodig_mobile/provider/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Hud(
        isLoading: false,
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Number of Responses'),
                SizedBox(height: 10),
                Text(
                  '2', // TODO: fetch from api
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
                ),
              ],
            ),
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
