import 'package:coodig_mobile/components/greeting_box.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/password_reset/components/password_reset_form.dart';
import 'package:coodig_mobile/feature/password_reset/forget_password_page.dart';
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
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.to(const LaunchPage());
          },
        ),
        backgroundColor: Colors.orangeAccent,
        title: const Text('Password Reset'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    DeeplinkService().verifySignedUri(link)
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Consumer(
                                builder: (BuildContext context, WidgetRef ref,
                                    Widget? child) {
                                  final errors = ref
                                      .watch(passwordResetStateNotifierProvider)
                                      .errors;
                                  return Column(
                                    children: [
                                      SizedBox(
                                          width: double.infinity,
                                          child: (errors['message'] != null)
                                              ? GreetingBox(
                                                  message: errors['message']
                                                      .toString())
                                              : null),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const PasswordResetForm(),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Column(
                                children: [
                                  const Text('Token is Valid or Expired'),
                                  TextButton(
                                    child: const Text('Resend link'),
                                    onPressed: () {
                                      Get.to(const ForgetPasswordPage());
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              bool isLoading =
                  ref.watch(passwordResetStateNotifierProvider).isLoading;
              return ModalProgressHUD(
                inAsyncCall: isLoading,
                child: Container(),
              );
            },
          )
        ],
      ),
    );
  }
}
