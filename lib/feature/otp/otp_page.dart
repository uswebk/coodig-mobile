import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/otp/components/explanation_box.dart';
import 'package:coodig_mobile/feature/otp/components/otp_field.dart';
import 'package:coodig_mobile/feature/otp/components/reregistration_button.dart';
import 'package:coodig_mobile/feature/otp/components/resend_bottuon.dart';
import 'package:coodig_mobile/feature/otp/components/timer.dart';
import 'package:coodig_mobile/feature/otp/components/verify_button.dart';
import 'package:coodig_mobile/feature/otp/otp_state_notifier.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/otp_timer_provider.dart';
import 'package:coodig_mobile/view/dashboard/dashboard_screen.dart';
import 'package:coodig_mobile/view/launch/launch_screen.dart';
import 'package:coodig_mobile/widget/greeting_box.dart';
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
        Get.off(const DashboardScreen());
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
              Get.to(const LaunchScreen());
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
                    const ExplanationBox(),
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
                      children: [
                        const Divider(),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: (ref.watch(otpErrorMessageProvider) != '')
                              ? GreetingBox(
                                  message: ref.watch(otpErrorMessageProvider))
                              : Container(),
                        ),
                        const SizedBox(height: 10),
                        const OtpField(),
                        const SizedBox(height: 20),
                        const VerifyButton(),
                        const ReregistrationButton(),
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
          bool isLoading = ref.watch(otpLoadingProvider);
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Container(),
          );
        },
      ),
    ]);
  }
}
