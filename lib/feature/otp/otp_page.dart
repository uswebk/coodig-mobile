import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/home/home_page.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/otp/widgets/otp_field.dart';
import 'package:coodig_mobile/feature/otp/widgets/reregistration_button.dart';
import 'package:coodig_mobile/feature/otp/widgets/resend_button.dart';
import 'package:coodig_mobile/feature/otp/widgets/timer.dart';
import 'package:coodig_mobile/feature/otp/widgets/verify_button.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/otp_timer_provider.dart';
import 'package:coodig_mobile/provider/uid_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Uid uid = ref.watch(uidProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(otpTimerStateNotifierProvider.notifier).startTimer();
      final UserStatus userStatus = ref.watch(userStatusProvider);
      if (userStatus == UserStatus.authenticated) {
        await uid.setToAnalytics();
        Get.off<dynamic>(const HomePage());
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
            onPressed: () {
              Get.to<dynamic>(const LaunchPage());
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                  child: const Text(
                    'Otp Verification',
                    style: TextStyle(color: CoodigColors.grey, fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: const [
                        SizedBox(height: 10),
                        OtpField(),
                        Divider(),
                        Timer(),
                        ResendButton(),
                        Divider(),
                        VerifyButton(),
                        SizedBox(height: 10),
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
    ]);
  }
}
