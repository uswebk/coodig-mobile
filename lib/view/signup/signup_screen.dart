import 'package:coodig_mobile/provider/signup_provider.dart';
import 'package:coodig_mobile/view/login/login_screen.dart';
import 'package:coodig_mobile/view/signup/widget/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../provider/auth_provider.dart';
import '../dashboard/dashboard_screen.dart';
import '../launch/launch_screen.dart';
import '../otp/otp_screen.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isEmailVerified = ref.watch(isEmailVerifiedProvider);
      bool hasAccount = ref.watch(hasAccountProvider);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
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
