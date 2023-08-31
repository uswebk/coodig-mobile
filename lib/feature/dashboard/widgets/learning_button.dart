import 'package:coodig_mobile/feature/learning/learning_page.dart';
import 'package:coodig_mobile/provider/quiz_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/color.dart';

class LearningButton extends HookConsumerWidget {
  const LearningButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: FloatingActionButton.extended(
        onPressed: () async {
          await ref.read(quizStateNotifierProvider.notifier).random(1);
          Get.to<dynamic>(() => const LearningPage());
        },
        label: Row(
          children: const [
            Text('Start Learning', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            SizedBox(width: 10),
            Icon(Icons.rocket_launch, size: 20)
          ],
        ),
        icon: null,
        backgroundColor: CoodigColors.primary,
      ),
    );
  }
}
