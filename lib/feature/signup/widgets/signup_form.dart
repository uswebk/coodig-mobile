import 'package:coodig_mobile/components/form/email_text_field.dart';
import 'package:coodig_mobile/components/form/name_text_field.dart';
import 'package:coodig_mobile/components/form/password_confirm_text_field.dart';
import 'package:coodig_mobile/components/form/password_text_field.dart';
import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:coodig_mobile/feature/signup/state/signup_state_notifier.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupForm extends ConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController = TextEditingController();

    final notifier = ref.read(signupStateNotifierProvider.notifier);

    return Form(
      key: formKey,
      child: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final state = ref.watch(signupStateNotifierProvider);
            return Column(
              children: [
                NameTextField(nameController, state.errors['name']),
                const SizedBox(height: 10),
                EmailTextField(emailController, state.errors['email']),
                const SizedBox(height: 10),
                PasswordTextField(passwordController, state.errors['password']),
                const SizedBox(height: 10),
                PasswordConfirmTextField(confirmPasswordController, state.errors['non_field_errors']),
                const SizedBox(height: 20),
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
                          String confirmPassword = confirmPasswordController.text;
                          notifier.setLoading(true);
                          try {
                            await ref.read(authStateProvider.notifier).signup(name, email, password, confirmPassword);
                            Future.delayed(Duration.zero, () {
                              Snackbar.showSuccess(context, 'Otp sent to your email address');
                            });
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
