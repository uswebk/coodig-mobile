import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/signup_provider.dart';
import 'package:coodig_mobile/view/dashboard/dashboard_screen.dart';
import 'package:coodig_mobile/view/login/login_screen.dart';
import 'package:coodig_mobile/view/otp/otp_screen.dart';
import 'package:coodig_mobile/view/signup/widget/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../launch/launch_screen.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isEmailVerified = ref.watch(isEmailVerifiedProvider) ?? false;
      bool hasAccount = ref.watch(hasAccountProvider) ?? false;
      if (isEmailVerified) {
        Get.off(const DashboardScreen());
      } else if (hasAccount) {
        Get.off(const OtpScreen());
      }
    });

    SignupState state = ref.watch(signupStateProvider);

    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.to(const LaunchScreen());
            },
          ),
          backgroundColor: Colors.orangeAccent,
          title: const Text('SignUp'),
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(flex: 2, child: Container()),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SignupForm(),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Already have an account? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          child: const Text('Sign in'),
                          onPressed: () {
                            Get.to(LoginScreen());
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(flex: 2, child: Container()),
          ],
        ),
      ),
      ModalProgressHUD(
        inAsyncCall: state.isLoading,
        child: Container(),
      ),
    ]);
  }
}
