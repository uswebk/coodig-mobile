import 'package:coodig_mobile/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends ConsumerWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.to(const SplashScreen());
            },
          ),
          backgroundColor: Colors.orangeAccent,
          title: const Text('Forget Password'),
          elevation: 0,
        ),
        body: const Center(
          child: Text('Forget Password'),
        ));
  }
}
