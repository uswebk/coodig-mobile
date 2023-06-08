import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/dashboard/dashboard_page.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/otp/components/explanation.dart';
import 'package:coodig_mobile/feature/otp/components/otp_field.dart';
import 'package:coodig_mobile/feature/otp/components/reregistration_button.dart';
import 'package:coodig_mobile/feature/otp/components/resend_button.dart';
import 'package:coodig_mobile/feature/otp/components/timer.dart';
import 'package:coodig_mobile/feature/otp/components/verify_button.dart';
import 'package:coodig_mobile/feature/otp/otp_state_notifier.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/otp_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(otpTimerStateNotifierProvider.notifier).startTimer();
      final UserStatus userStatus = ref.watch(userStatusProvider);
      if (userStatus == UserStatus.authenticated) {
        Get.off<dynamic>(const DashboardPage());
      }
    });

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black45,
            ),
            onPressed: () {
              Get.to<dynamic>(const LaunchPage());
            },
          ),
          backgroundColor: Colors.white,
          title: const Text(
            'Otp Verify',
            style: TextStyle(color: Colors.black45),
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Explanation(),
                    Column(
                      children: const [
                        Timer(),
                        ResendButton(),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        Divider(),
                        SizedBox(height: 10),
                        OtpField(),
                        SizedBox(height: 20),
                        VerifyButton(),
                        ReregistrationButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          bool isLoading = ref.watch(otpStateNotifierProvider).isLoading;
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Container(),
          );
        },
      ),
    ]);
  }
}
