import 'package:coodig_mobile/components/form/password_confirm_text_field.dart';
import 'package:coodig_mobile/components/form/password_text_field.dart';
import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:coodig_mobile/feature/login/login_screen.dart';
import 'package:coodig_mobile/feature/password_reset/password_reset_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class PasswordResetForm extends ConsumerWidget {
  const PasswordResetForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    final notifier = ref.read(passwordResetStateNotifierProvider.notifier);
    String link = ref.watch(resetPasswordLinkProvider);

    return Form(
      key: formKey,
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final state = ref.watch(passwordResetStateNotifierProvider);
          return Column(
            children: [
              PasswordTextField(passwordController, state.errors['password']),
              const SizedBox(height: 10),
              PasswordConfirmTextField(
                  confirmPasswordController, state.errors['non_field_errors']),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        String password = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;

                        notifier.setLoading(true);
                        try {
                          await notifier.resetPassword(
                              link, password, confirmPassword);

                          Future.delayed(Duration.zero, () {
                            Snackbar.showSuccess(
                                context, 'change password success');
                          });

                          Get.to(const LoginPage());
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
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: const Text('Change Password')),
              ),
            ],
          );
        },
      ),
    );
  }
}
