import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/auth_provider.dart';
import '../../../provider/otp_provider.dart';
import '../../../provider/otp_timer_provider.dart';
import '../../../provider/signup_provider.dart';

class SignupForm extends ConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    return Form(
      key: formKey,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: const Icon(Icons.account_box),
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.1),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.withOpacity(0.2)),
                      ),
                      errorText: _getErrorText(context, ref, 'name'),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onChanged: (String value) {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
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
                          ref.watch(passwordVisibleProvider);

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
                          errorText: _getErrorText(context, ref, 'password'),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              ref.read(passwordVisibleProvider.notifier).state =
                                  !passwordVisible;
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
                        onChanged: (String value) {},
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      final passwordConfirmVisible =
                          ref.watch(passwordConfirmVisibleProvider);

                      return TextFormField(
                        controller: confirmPasswordController,
                        obscureText: !passwordConfirmVisible,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.1),
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0.2)),
                          ),
                          errorText:
                              _getErrorText(context, ref, 'non_field_errors'),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(passwordConfirmVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              ref
                                  .read(passwordConfirmVisibleProvider.notifier)
                                  .state = !passwordConfirmVisible;
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your ConfirmPassword';
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
                              await ref.read(authStateProvider.notifier).signup(
                                  name, email, password, confirmPassword);
                            } on ApiException catch (e) {
                              ref
                                  .read(signupStateProvider.notifier)
                                  .setMessage(e.errors);
                            } catch (e) {
                              // Snackbar
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
      ),
    );
  }

  String? _getErrorText(BuildContext context, WidgetRef ref, String key) {
    final state = ref.watch(signupStateProvider);
    if (state.errorMessages[key] != null) {
      return state.errorMessages[key].toString();
    }
    return null;
  }
}
