import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:coodig_mobile/view/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../components/snackbar.dart';
import '../../../provider/password_reset_provider.dart';

class PasswordResetForm extends StatelessWidget {
  const PasswordResetForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Form(
      key: formKey,
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          String link = ref.watch(resetPasswordLinkProvider);
          final errors = ref.watch(resetPasswordStateProvider).errorMessages;
          final passwordVisible =
              ref.watch(resetPasswordPasswordVisibleProvider);
          return Column(
            children: [
              TextFormField(
                controller: passwordController,
                obscureText: !passwordVisible,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                  ),
                  errorText: errors['password'],
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      ref
                          .read(resetPasswordPasswordVisibleProvider.notifier)
                          .state = !passwordVisible;
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final passwordVisible =
                      ref.watch(resetPasswordPasswordConfirmVisibleProvider);
                  return TextFormField(
                    controller: confirmPasswordController,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm New Password',
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.2)),
                      ),
                      errorText: errors['non_field_errors'],
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          ref
                              .read(resetPasswordPasswordConfirmVisibleProvider
                                  .notifier)
                              .state = !passwordVisible;
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }

                      if (value.length <= 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  );
                },
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

                        ref
                            .read(resetPasswordIsLoadingProvider.notifier)
                            .state = true;
                        try {
                          await ref
                              .read(resetPasswordStateProvider.notifier)
                              .resetPassword(link, password, confirmPassword);

                          Future.delayed(Duration.zero, () {
                            Snackbar.showSuccess(
                                context, 'change password success');
                          });

                          Get.to(const LoginScreen());
                        } on ApiException catch (e) {
                          ref
                              .read(resetPasswordStateProvider.notifier)
                              .setMessage(e.errors);
                        } catch (e) {
                          Snackbar.showError(context, e.toString());
                        }

                        ref
                            .read(resetPasswordIsLoadingProvider.notifier)
                            .state = false;
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
