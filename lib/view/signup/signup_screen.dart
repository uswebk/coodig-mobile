import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/signup_provider.dart';
import 'package:coodig_mobile/view/dashboard/dashboard_screen.dart';
import 'package:coodig_mobile/view/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isEmailVerified = ref.watch(isEmailVerifiedProvider) ?? false;
      bool hasAccount = ref.watch(hasAccountProvider) ?? false;
      if (isEmailVerified) {
        Get.off(const DashboardScreen());
      } else if (hasAccount) {
        Get.off(const OtpScreen());
      }
    });

    SignupState state = ref.watch(signupStateProvider);

    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('SignUp'),
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            icon: Icon(Icons.account_box),
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
                            icon: Icon(Icons.email),
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
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            final passwordVisible =
                                ref.watch(passwordVisibleProvider);

                            return TextFormField(
                              controller: passwordController,
                              obscureText: !passwordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                icon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    ref
                                        .read(passwordVisibleProvider.notifier)
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
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            final passwordConfirmVisible =
                                ref.watch(passwordConfirmVisibleProvider);

                            return TextFormField(
                              controller: confirmPasswordController,
                              obscureText: !passwordConfirmVisible,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                icon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(passwordConfirmVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    ref
                                        .read(passwordConfirmVisibleProvider
                                            .notifier)
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
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  String name = nameController.text;
                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  String confirmPassword =
                                      confirmPasswordController.text;

                                  ref
                                      .read(signupStateProvider.notifier)
                                      .setLoading(true);

                                  ref.read(authStateProvider.notifier).signup(
                                      name, email, password, confirmPassword);

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
                        const Divider(
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
          ),
        ),
      ),
      ModalProgressHUD(
        inAsyncCall: state.isLoading,
        child: Container(),
      ),
    ]);
  }
}
