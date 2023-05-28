import 'dart:async';

import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/service/splash_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Splash extends ConsumerWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      SplashService.initDeeplink(ref);
      await ref.read(authStateProvider.notifier).fetchMe();
      final UserStatus userStatus = ref.watch(userStatusProvider);
      Widget screen = await SplashService.getScreen(userStatus);
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
