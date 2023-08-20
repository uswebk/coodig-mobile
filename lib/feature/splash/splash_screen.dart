import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/splash/provider/splash_provider.dart';
import 'package:coodig_mobile/provider/uid_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(screenProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (state.hasValue) {
        final Uid uid = ref.watch(uidProvider);
        await uid.setToAnalytics();
        final screen = state.value ?? const LaunchPage();
        Get.off<dynamic>(() => screen);
      }
    });

    return Scaffold(
      backgroundColor: CoodigColors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: SizedBox(width: 250, child: Image.asset('images/icon.png'))),
            const SizedBox(
              width: 150,
              height: 2,
              child: LinearProgressIndicator(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
