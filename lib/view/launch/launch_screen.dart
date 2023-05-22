import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../enum/user_status.dart';
import '../../feature/signup/signup_page.dart';
import '../../provider/auth_provider.dart';
import '../dashboard/dashboard_screen.dart';

class LaunchScreen extends ConsumerWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    height: 220,
                  ),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final UserStatus userStatus =
                          ref.watch(userStatusProvider);
                      return Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (userStatus == UserStatus.authenticated) {
                                  Get.off(const DashboardScreen());
                                } else if (userStatus ==
                                    UserStatus.emailNotVerified) {
                                  Get.to(const OtpPage());
                                } else {
                                  Get.to(const SignupPage());
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                              ),
                              child: const Text('Sign Up'),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                if (userStatus == UserStatus.authenticated) {
                                  Get.off(const DashboardScreen());
                                } else {
                                  Get.to(const LoginScreen());
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white70,
                              ),
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
