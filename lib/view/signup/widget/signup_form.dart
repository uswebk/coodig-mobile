import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/auth_provider.dart';
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

    SignupState state = ref.watch(signupStateProvider);

    return Form(
      key: formKey,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.account_box),
                  filled: true,
                  fillColor: Colors.white60,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onChanged: (String value) {},
              ),
              if (state.errorMessages != null &&
                  state.errorMessages!['name'] != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      state.errorMessages!['name']!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(217, 56, 45, 1.0),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  filled: true,
                  fillColor: Colors.white60,
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (String value) {},
              ),
              if (state.errorMessages != null &&
                  state.errorMessages!['email'] != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      state.errorMessages!['email']!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(217, 56, 45, 1.0),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final passwordVisible = ref.watch(passwordVisibleProvider);

                  return TextFormField(
                    controller: passwordController,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white60,
                      border: InputBorder.none,
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
              if (state.errorMessages != null &&
                  state.errorMessages!['password'] != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      state.errorMessages!['password']!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(217, 56, 45, 1.0),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final passwordConfirmVisible =
                      ref.watch(passwordConfirmVisibleProvider);

                  return TextFormField(
                    controller: confirmPasswordController,
                    obscureText: !passwordConfirmVisible,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.white60,
                      border: InputBorder.none,
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
              if (state.errorMessages != null &&
                  state.errorMessages!['non_field_errors'] != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      state.errorMessages!['non_field_errors']!,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color.fromRGBO(217, 56, 45, 1.0),
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        String name = nameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        String confirmPassword = confirmPasswordController.text;

                        ref.read(signupStateProvider.notifier).setLoading(true);

                        ref
                            .read(authStateProvider.notifier)
                            .signup(name, email, password, confirmPassword);

                        ref
                            .read(signupStateProvider.notifier)
                            .setLoading(false);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                    ),
                    child: const Text('Sign up')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
