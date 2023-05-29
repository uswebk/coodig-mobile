import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/dashboard/dashboard_page.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/feature/signup/components/already_have_account_row.dart';
import 'package:coodig_mobile/feature/signup/components/signup_form.dart';
import 'package:coodig_mobile/feature/signup/signup_state_notifier.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(signupStateNotifierProvider.notifier).reset();
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
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () => Get.offAll(const LaunchPage())),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: CoodigColors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
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
            ],
          ),
        ),
      ),
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final state = ref.watch(signupStateNotifierProvider);
          return ModalProgressHUD(
            inAsyncCall: state.isLoading,
            child: Container(),
          );
        },
      ),
    ]);
  }
}
