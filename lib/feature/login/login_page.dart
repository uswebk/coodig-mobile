import 'package:coodig_mobile/components/hud.dart';
import 'package:coodig_mobile/components/modal/forget_password_sheet.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/home/home_page.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/login/state/login_state_notifier.dart';
import 'package:coodig_mobile/feature/login/widgets/login_form.dart';
import 'package:coodig_mobile/feature/signup/signup_page.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LocalAuthentication auth = LocalAuthentication();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final UserStatus userStatus = ref.watch(userStatusProvider);
      if (userStatus == UserStatus.authenticated) {
        Get.off<dynamic>(const HomePage());
      }
    });

    final passwordResetEmail = useTextEditingController();

    return Hud(
      isLoading: ref.watch(loginStateNotifierProvider).isLoading,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
              onPressed: () => Get.offAll<dynamic>(const LaunchPage())),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
                child: const Text(
                  'Login',
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
                    const LoginForm(),
                    const SizedBox(height: 5),
                    TextButton(
                      child: const Text('Forget Password?'),
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
                    const Divider(color: Colors.grey),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Don’t have an account? ', style: TextStyle(color: Colors.grey)),
                        TextButton(child: const Text('Sign Up'), onPressed: () => Get.off<dynamic>(const SignupPage())),
                      ],
                    ),
                    TextButton(
                      child: const Text('Bio'),
                      onPressed: () async {
                        try {
                          final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
                          final bool canAuthenticate = canAuthenticateWithBiometrics || await auth.isDeviceSupported();

                          if (canAuthenticate) {
                            final bool didAuthenticate = await auth.authenticate(
                              localizedReason: 'Please authenticate to show account balance',
                              options: const AuthenticationOptions(
                                  biometricOnly: true, useErrorDialogs: true, stickyAuth: true),
                            );
                            if (didAuthenticate) {
                              await ref.watch(authStateNotifierProvider.notifier).loginByBiometrics();
                            }
                          }
                        } catch (e) {
                          debugPrint('error $e');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
