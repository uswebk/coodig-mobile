import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/uid_provider.dart';
import 'package:coodig_mobile/service/splash_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<dynamic>.delayed(const Duration(seconds: 2)).then((dynamic value) async {
      await ref.read(authStateNotifierProvider.notifier).fetchMe();
      final Uid uid = ref.watch(uidProvider);
      await uid.setToAnalytics();
      final UserStatus userStatus = ref.watch(userStatusProvider);
      Widget screen = await ref.watch(splashServiceProvider).getScreen(userStatus);
      Get.off<dynamic>(() => screen);
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
