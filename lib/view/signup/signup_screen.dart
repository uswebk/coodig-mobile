import 'package:coodig_mobile/view/signup/widget/already_have_account_row.dart';
import 'package:coodig_mobile/view/signup/widget/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../enum/user_status.dart';
import '../../provider/auth_provider.dart';
import '../../provider/signup_provider.dart';
import '../dashboard/dashboard_screen.dart';
import '../launch/launch_screen.dart';
import '../otp/otp_screen.dart';

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(signupStateNotifierProvider.notifier).reset();
      final UserStatus userStatus = ref.watch(userStatusProvider);

      if (userStatus == UserStatus.authenticated) {
        Get.off(const DashboardScreen());
      } else if (userStatus == UserStatus.emailNotVerified) {
        Get.off(const OtpScreen());
      }
    });

    final state = ref.watch(signupStateNotifierProvider);

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Get.offAll(const LaunchScreen())),
          backgroundColor: Colors.orangeAccent,
          title: const Text('SignUp'),
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SignupForm(),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey),
                  AlreadyHaveAccountRow(),
                ],
              ),
            ),
          ),
        ),
      ),
      ModalProgressHUD(
        inAsyncCall: state.isLoading,
        child: Container(),
      ),
    ]);
  }
}
