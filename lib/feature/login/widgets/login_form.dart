import 'package:coodig_mobile/components/form/email_text_field.dart';
import 'package:coodig_mobile/components/form/password_text_field.dart';
import 'package:coodig_mobile/components/greeting_box.dart';
import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:coodig_mobile/feature/login/state/login_state_notifier.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final notifier = ref.read(loginStateNotifierProvider.notifier);

    return Form(
      key: formKey,
      child: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final errors = ref.watch(loginStateNotifierProvider).errors;
            return Column(
              children: [
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GreetingBox(message: errors['non_field_errors'])),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      EmailTextField(emailController, errors['email']),
                      const SizedBox(height: 10),
                      PasswordTextField(passwordController, errors['password']),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              String email = emailController.text;
                              String password = passwordController.text;

                              notifier.setLoading(true);

                              try {
                                await ref
                                    .read(authStateProvider.notifier)
                                    .login(email, password);
                              } on ApiException catch (e) {
                                notifier.setMessage(e.errors);
                              } catch (e) {
                                Snackbar.showError(context, e.toString());
                              } finally {
                                notifier.setLoading(false);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: CoodigColors.buttonPrimary,
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
