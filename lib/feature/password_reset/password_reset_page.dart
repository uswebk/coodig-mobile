import 'package:coodig_mobile/components/greeting_box.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/password_reset/components/password_reset_form.dart';
import 'package:coodig_mobile/feature/password_reset/password_reset_state_notifier.dart';
import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PasswordResetPage extends ConsumerWidget {
  const PasswordResetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(passwordResetStateNotifierProvider.notifier).reset();
    });

    String link = ref.watch(resetPasswordLinkProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Get.to<dynamic>(const LaunchPage());
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                      color: CoodigColors.grey,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      DeeplinkService().verifySignedUri(link)
                          ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: Consumer(
                                  builder: (BuildContext context, WidgetRef ref, Widget? child) {
                                    final errors = ref.watch(passwordResetStateNotifierProvider).errors;
                                    return Column(
                                      children: [
                                        SizedBox(
                                            width: double.infinity,
                                            child: (errors['message'] != null)
                                                ? GreetingBox(message: errors['message'].toString())
                                                : null),
                                        const SizedBox(height: 15),
                                        const PasswordResetForm(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: const [
                                  Text(
                                    'Token is Valid or Expired',
                                    style: TextStyle(
                                      color: CoodigColors.primary,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                bool isLoading = ref.watch(passwordResetStateNotifierProvider).isLoading;
                return ModalProgressHUD(
                  inAsyncCall: isLoading,
                  child: Container(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
