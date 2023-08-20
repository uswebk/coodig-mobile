import 'package:coodig_mobile/components/button/fill_button.dart';
import 'package:coodig_mobile/components/button/secondary_button.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/core/environment.dart';
import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/home/home_page.dart';
import 'package:coodig_mobile/feature/login/login_page.dart';
import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/feature/signup/signup_page.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LaunchPage extends HookConsumerWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserStatus userStatus = ref.watch(userStatusProvider);
    final environment = ref.watch(environmentProvider);
    final version = useState('');

    useEffect(() {
      void f() async {
        version.value = await environment.getVersion();
      }

      f();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: CoodigColors.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Column(children: const [
                        Text(
                          'Coodig',
                          style: TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Quiz Application For Engineers',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ]),
                      const SizedBox(height: 80),
                      Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 60,
                            child: FillButton(
                              text: 'Sign up',
                              buttonStyle: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: CoodigColors.buttonSecondary,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              ),
                              color: CoodigColors.buttonSecondary,
                              onPressed: () async {
                                if (userStatus == UserStatus.authenticated) {
                                  Get.off<dynamic>(() => const HomePage());
                                } else if (userStatus == UserStatus.emailNotVerified) {
                                  Get.to<dynamic>(() => const OtpPage());
                                } else {
                                  Get.to<dynamic>(() => const SignupPage());
                                }
                              },
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 60,
                            child: SecondaryButton(
                              onPressed: () async {
                                if (userStatus == UserStatus.authenticated) {
                                  Get.off<dynamic>(() => const HomePage());
                                } else {
                                  Get.to<dynamic>(() => const LoginPage());
                                }
                              },
                              buttonStyle: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.white70,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              ),
                              text: 'Sign In',
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(child: Text(version.value, style: const TextStyle(color: Colors.white70))),
          ],
        ),
      ),
    );
  }
}
