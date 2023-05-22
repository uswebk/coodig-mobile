import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/feature/signup/signup_page.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/login_provider.dart';
import 'package:coodig_mobile/view/dashboard/dashboard_screen.dart';
import 'package:coodig_mobile/view/login/widget/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../enum/user_status.dart';
import '../launch/launch_screen.dart';
import '../password_reset/forget_password_screen.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(loginStateProvider.notifier).reset();

      final UserStatus userStatus = ref.watch(userStatusProvider);
      if (userStatus == UserStatus.authenticated) {
        Get.off(const DashboardScreen());
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
              Get.offAll(const LaunchScreen());
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
                    Get.to(const ForgetPasswordScreen());
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
          final isLoading = ref.watch(loginIsLoadingProvider);
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Container(),
          );
        },
      ),
    ]);
  }
}
