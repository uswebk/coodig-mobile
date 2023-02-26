import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../provider/user_provider.dart';
import '../dashboard/dashboard_screen.dart';
import '../login/login_screen.dart';

// ignore: must_be_immutable
class SplashScreen extends ConsumerWidget {
  bool loading;

  SplashScreen({super.key, this.loading = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      loading = true;
      await initialize(ref);

      Timer(const Duration(seconds: 1), () async {
        final bool isAuth = ref.read(isAuthenticatedProvider);
        loading = false;
        if (isAuth) {
          Get.off(const DashboardScreen());
        } else {
          Get.off(const LoginScreen());
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Coodig',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              height: 2,
              child: (loading)
                  ? const LinearProgressIndicator(
                      color: Colors.white,
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Future initialize(WidgetRef ref) async {
    await ref.watch(userNotifierProvider.notifier).fetchUser();
  }
}
