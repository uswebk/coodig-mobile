import 'package:coodig_mobile/view/login/login_screen.dart';
import 'package:coodig_mobile/view/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../provider/auth_provider.dart';
import '../dashboard/dashboard_screen.dart';
import '../otp/otp_screen.dart';

class LaunchScreen extends ConsumerWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isEmailVerified = ref.read(isEmailVerifiedProvider) ?? false;
    bool hasAccount = ref.read(hasAccountProvider) ?? false;
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Column(children: const [
                    Text(
                      'Coodig',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '- Quiz Application For Engineers -',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (isEmailVerified) {
                                Get.off(const DashboardScreen());
                              } else if (hasAccount) {
                                Get.to(const OtpScreen());
                              } else {
                                Get.to(const SignupScreen());
                              }
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
                            if (isEmailVerified) {
                              Get.off(const DashboardScreen());
                            } else if (hasAccount) {
                              Get.to(const OtpScreen());
                            } else {
                              Get.to(LoginScreen());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
