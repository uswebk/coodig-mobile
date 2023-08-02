import 'package:coodig_mobile/components/hud.dart';
import 'package:coodig_mobile/feature/learning/widgets/quiz_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LearningPage extends HookConsumerWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Hud(
        isLoading: false,
        child: Scaffold(
          appBar: AppBar(
            leading: TextButton.icon(
              onPressed: () {
                // view dialog
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.cancel),
              label: const Text(''),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(height: 20),
                  QuizPanel(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
