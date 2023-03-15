import 'package:coodig_mobile/view/login/login_screen.dart';
import 'package:coodig_mobile/view/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LaunchScreen extends ConsumerWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 20,
              ),
              Column(children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Coodig',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '🎧',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '- Quiz Application For Engineers -',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(SignupScreen());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                        ),
                        child: const Text('Sign Up')),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.black87, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
