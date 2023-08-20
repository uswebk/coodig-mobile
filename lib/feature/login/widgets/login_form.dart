import 'package:coodig_mobile/components/button/fill_button.dart';
import 'package:coodig_mobile/components/form/email_text_field.dart';
import 'package:coodig_mobile/components/form/password_text_field.dart';
import 'package:coodig_mobile/components/greeting_box.dart';
import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/exception/api_validation_exception.dart';
import 'package:coodig_mobile/feature/login/state/login_state_notifier.dart';
import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errors = useState<Map<String, String>?>(null);
    final notifier = ref.read(loginStateNotifierProvider.notifier);

    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    return Form(
      key: formKey,
      child: Center(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GreetingBox(message: errors.value?['non_field_errors'])),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  EmailTextField(emailController, errors.value?['email']),
                  const SizedBox(height: 10),
                  PasswordTextField(passwordController, errors.value?['password']),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FillButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          String email = emailController.text;
                          String password = passwordController.text;
                          notifier.setLoading(true);
                          try {
                            await ref.read(authStateNotifierProvider.notifier).login(email, password);
                            final UserStatus userStatus = ref.read(userStatusProvider);
                            if (userStatus == UserStatus.emailNotVerified) {
                              Get.off<dynamic>(const OtpPage());
                            }
                          } on ApiValidationException catch (e) {
                            errors.value = e.toMap();
                          } catch (e) {
                            Snackbar.showError(context, e.toString());
                          } finally {
                            notifier.setLoading(false);
                          }
                        }
                      },
                      color: CoodigColors.buttonPrimary,
                      text: 'Login',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
