import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../provider/user_provider.dart';
import '../dashboard/dashboard_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool loading = ref.watch(isLoadingProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(isLoadingProvider.notifier).start();
      await ref.watch(userNotifierProvider.notifier).fetchUser();
      Timer(const Duration(seconds: 1), () async {
        final bool isAuth = ref.read(isAuthenticatedProvider);
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
}

final isLoadingProvider =
    StateNotifierProvider.autoDispose<IsLoadingNotifier, bool>((ref) {
  return IsLoadingNotifier();
});

class IsLoadingNotifier extends StateNotifier<bool> {
  IsLoadingNotifier() : super(false);

  void start() {
    state = true;
  }

  void end() {
    state = false;
  }
}
