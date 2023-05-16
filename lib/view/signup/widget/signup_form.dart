import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:coodig_mobile/widget/form/email_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/auth_provider.dart';
import '../../../provider/otp_provider.dart';
import '../../../provider/otp_timer_provider.dart';
import '../../../provider/signup_provider.dart';
import '../../../widget/form/name_text_field.dart';
import '../../../widget/form/password_confirm_text_field.dart';
import '../../../widget/form/password_text_field.dart';
import '../../../widget/snackbar.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Form(
      key: formKey,
      child: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final errors = ref.watch(signupStateProvider).errorMessages;
            return Column(
              children: [
                NameTextField(nameController, errors['name']),
                const SizedBox(
                  height: 10,
                ),
                EmailTextField(emailController, errors['email']),
                const SizedBox(
                  height: 10,
                ),
                PasswordTextField(passwordController, errors['password']),
                const SizedBox(
                  height: 10,
                ),
                PasswordConfirmTextField(
                    confirmPasswordController, errors['non_field_errors']),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          String name = nameController.text;
                          String email = emailController.text;
                          String password = passwordController.text;
                          String confirmPassword =
                              confirmPasswordController.text;

                          ref.read(signupIsLoadingProvider.notifier).state =
                              true;
                          ref.read(signupStateProvider.notifier).reset();
                          ref.read(otpTimerStateProvider.notifier).reset();
                          ref.read(otpStateProvider.notifier).reset();

                          try {
                            await ref
                                .read(authStateProvider.notifier)
                                .signup(name, email, password, confirmPassword);
                            Future.delayed(Duration.zero, () {
                              Snackbar.showSuccess(
                                  context, 'otp sent to your email address');
                            });
                          } on ApiException catch (e) {
                            ref
                                .read(signupStateProvider.notifier)
                                .setMessage(e.errors);
                          } catch (e) {
                            Snackbar.showError(context, e.toString());
                          }
                          ref.watch(signupIsLoadingProvider.notifier).state =
                              false;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                      ),
                      child: const Text('Sign up')),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
