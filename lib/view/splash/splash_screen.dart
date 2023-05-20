import 'dart:async';

import 'package:coodig_mobile/enum/user_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../provider/auth_provider.dart';
import '../../service/splash_service.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      final SplashService splashService = SplashService();
      splashService.initDeeplink(ref);

      await ref.read(authStateProvider.notifier).fetchMe();
      final UserStatus userStatus = ref.watch(userStatusProvider);
      Widget screen = await splashService.getScreen(userStatus);
      Get.off(screen);
    });

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Co-odig',
              style: TextStyle(
                color: Colors.white,
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 180,
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
