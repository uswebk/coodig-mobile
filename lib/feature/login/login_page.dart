import 'package:coodig_mobile/feature/dashboard/dashboard_page.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/login/components/login_form.dart';
import 'package:coodig_mobile/feature/login/login_state_notifier.dart';
import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/feature/password_reset/forget_password_page.dart';
import 'package:coodig_mobile/feature/signup/signup_page.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../enum/user_status.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(loginStateNotifierProvider.notifier).reset();

      final UserStatus userStatus = ref.watch(userStatusProvider);
      if (userStatus == UserStatus.authenticated) {
        Get.off(const DashboardPage());
      } else if (userStatus == UserStatus.emailNotVerified) {
        Get.off(const OtpPage());
      }
    });

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.offAll(const LaunchPage());
            },
          ),
          backgroundColor: Colors.orangeAccent,
          title: const Text('Login'),
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LoginForm(),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                  child: const Text('Forget Password?'),
                  onPressed: () {
                    Get.to(const ForgetPasswordPage());
                  },
                ),
                const Divider(
                  color: Colors.grey,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Don’t have an account? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      child: const Text('Sign Up'),
                      onPressed: () {
                        Get.off(const SignupPage());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final isLoading = ref.watch(loginStateNotifierProvider).isLoading;
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Container(),
          );
        },
      ),
    ]);
  }
}
