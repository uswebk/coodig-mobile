import 'dart:async';

import 'package:coodig_mobile/provider/login_provider.dart';
import 'package:coodig_mobile/view/launch/launch_screen.dart';
import 'package:coodig_mobile/view/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../provider/auth_provider.dart';
import '../dashboard/dashboard_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      await ref.watch(authStateProvider.notifier).fetchMe();
      final bool isEmailVerified = ref.read(isEmailVerifiedProvider);
      final bool hasAccount = ref.read(hasAccountProvider);
      if (isEmailVerified) {
        Get.off(const DashboardScreen());
      } else if (hasAccount) {
        Get.off(const OtpScreen());
      } else {
        ref.watch(loginStateProvider.notifier).initState();
        Get.off(const LaunchScreen());
      }
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
