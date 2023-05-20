import 'package:coodig_mobile/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../exception/api_exception.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/login_provider.dart';
import '../../../widget/form/email_text_field.dart';
import '../../../widget/form/password_text_field.dart';
import '../../../widget/greeting_box.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final errors = ref.watch(loginStateProvider).errorMessages;
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: (errors['non_field_errors'] != null)
                      ? GreetingBox(
                          message: errors['non_field_errors'].toString(),
                        )
                      : Container(),
                ),
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

                              ref.read(loginIsLoadingProvider.notifier).state =
                                  true;
                              ref.read(loginStateProvider.notifier).reset();

                              try {
                                await ref
                                    .read(authStateProvider.notifier)
                                    .login(email, password);
                                Future.delayed(Duration.zero, () {
                                  Snackbar.showSuccess(
                                      context, 'Login Success!');
                                });
                              } on ApiException catch (e) {
                                ref
                                    .read(loginStateProvider.notifier)
                                    .setMessage(e.errors);
                              } catch (e) {
                                Snackbar.showError(context, e.toString());
                              }

                              ref.read(loginIsLoadingProvider.notifier).state =
                                  false;
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
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
