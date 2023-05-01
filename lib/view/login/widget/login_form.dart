import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../exception/api_exception.dart';
import '../../../provider/auth_provider.dart';
import '../../../provider/login_provider.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: (_getErrorText(context, ref, 'non_field_errors') != null)
                  ? Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: Colors.red.shade100),
                      ),
                      child: Text(
                        _getErrorText(context, ref, 'non_field_errors')
                            .toString(),
                        style: TextStyle(color: Colors.red.shade300),
                      ),
                    )
                  : Container(),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.2)),
                      ),
                      errorText: _getErrorText(context, ref, 'email'),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (String value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final passwordVisible =
                          ref.watch(loginPasswordVisibleProvider);
                      return TextFormField(
                        controller: passwordController,
                        obscureText: !passwordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.2)),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              ref
                                  .read(loginPasswordVisibleProvider.notifier)
                                  .state = !passwordVisible;
                            },
                          ),
                          errorText: _getErrorText(context, ref, 'password'),
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
                        onChanged: (String value) {},
                      );
                    },
                  ),
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
                          String email = emailController.text;
                          String password = passwordController.text;

                          ref.read(loginIsLoadingProvider.notifier).state =
                              true;

                          try {
                            await ref
                                .read(authStateProvider.notifier)
                                .login(email, password);
                          } on ApiException catch (e) {
                            ref
                                .read(loginStateProvider.notifier)
                                .setMessage(e.errors);
                          } catch (e) {
                            // Snackbar
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
        ),
      ),
    );
  }

  String? _getErrorText(BuildContext context, WidgetRef ref, String key) {
    final state = ref.read(loginStateProvider);
    if (state.errorMessages[key] != null) {
      return state.errorMessages[key].toString();
    }
    return null;
  }
}
