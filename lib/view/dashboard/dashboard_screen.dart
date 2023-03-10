import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authNotifierProvider);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Dashboard'),
              Text('${state?.name} (${state?.email})'),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      ref.watch(authNotifierProvider.notifier).logout();
                      Get.off(const SplashScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text('Logout')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
