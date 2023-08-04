import 'package:coodig_mobile/components/hud.dart';
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
              children: [
                SizedBox(
                  height: 80,
                  width: 230,
                  child: ElevatedButton(
                    onPressed: () async {
                      await ref.read(quizStateNotifierProvider.notifier).random(1);

                      Get.to<dynamic>(const LearningPage());
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Start Learning',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.rocket_launch, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
