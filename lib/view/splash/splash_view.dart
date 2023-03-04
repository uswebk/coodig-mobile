import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../provider/auth_provider.dart';
import '../../provider/login_message_provider.dart';
import '../dashboard/dashboard_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      await ref.watch(authNotifierProvider.notifier).fetchUser();
      final bool isAuthenticated = ref.read(isAuthenticatedProvider);
      if (isAuthenticated) {
        Get.off(const DashboardScreen());
      } else {
        ref.watch(loginMessageProvider.notifier).resetMessage();
        Get.off(const LoginScreen());
      }
    });

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'Coodig',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
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
