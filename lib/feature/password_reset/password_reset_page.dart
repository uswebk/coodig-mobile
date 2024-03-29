import 'package:coodig_mobile/components/hud.dart';
import 'package:coodig_mobile/components/modal/forget_password_sheet.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/password_reset/state/password_reset_state_notifier.dart';
import 'package:coodig_mobile/feature/password_reset/widgets/password_reset_form.dart';
import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordResetPage extends HookConsumerWidget {
  final String link;

  const PasswordResetPage({super.key, required this.link});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deeplinkService = ref.watch(deeplinkServiceProvider);
    final passwordResetEmail = useTextEditingController();

    return Hud(
      isLoading: ref.watch(passwordResetStateNotifierProvider).isLoading,
      child: Scaffold(
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
                        deeplinkService.verifySignedUri(link)
                            ? Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: Center(
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 15),
                                      PasswordResetForm(link),
                                    ],
                                  ),
                                ),
                              )
                            : Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    const Text(
                                      'Token is valid or expired',
                                      style: TextStyle(
                                        color: CoodigColors.secondary,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    TextButton(
                                      child: const Text(
                                        'Resend link',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet<dynamic>(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(30.0),
                                            ),
                                          ),
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) => ForgetPasswordSheet(
                                            emailController: passwordResetEmail,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
