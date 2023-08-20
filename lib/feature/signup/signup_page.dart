import 'package:coodig_mobile/components/hud.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/dashboard/dashboard_page.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/feature/signup/state/signup_state_notifier.dart';
import 'package:coodig_mobile/feature/signup/widgets/already_have_account_row.dart';
import 'package:coodig_mobile/feature/signup/widgets/signup_form.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/uid_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final UserStatus userStatus = ref.watch(userStatusProvider);
      if (userStatus == UserStatus.authenticated) {
        final Uid uid = ref.watch(uidProvider);
        await uid.setToAnalytics();
        Get.off<dynamic>(const DashboardPage());
      } else if (userStatus == UserStatus.emailNotVerified) {
        Get.off<dynamic>(const OtpPage());
      }
    });

    return Hud(
      isLoading: ref.watch(signupStateNotifierProvider).isLoading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () => Get.offAll<dynamic>(() => const LaunchPage())),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: CoodigColors.grey,
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
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
    );
  }
}
