import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/dashboard/dashboard_page.dart';
import 'package:coodig_mobile/feature/login/login_page.dart';
import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/feature/signup/signup_page.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LaunchPage extends ConsumerWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserStatus userStatus = ref.watch(userStatusProvider);

    return Scaffold(
      backgroundColor: CoodigColors.secondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: double.infinity,
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
                      SizedBox(height: 10),
                      Text(
                        '- Quiz Application For Engineers -',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 110),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              if (userStatus == UserStatus.authenticated) {
                                Get.off(const DashboardPage());
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
                        const SizedBox(height: 15),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          child: TextButton(
                            onPressed: () {
                              if (userStatus == UserStatus.authenticated) {
                                Get.off(const DashboardPage());
                              } else {
                                Get.to(const LoginPage());
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
