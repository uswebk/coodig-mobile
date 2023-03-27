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
      bool isEmailVerified = ref.watch(isEmailVerifiedProvider);
      bool hasAccount = ref.watch(hasAccountProvider);
      if (isEmailVerified) {
        Get.off(const DashboardScreen());
      } else if (hasAccount) {
        Get.off(const OtpScreen());
      }
    });

    SignupState state = ref.watch(signupStateProvider);

    return Stack(children: [
      Scaffold(
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(labelText: 'Name'),
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
                        decoration: const InputDecoration(labelText: 'Email'),
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
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration:
                            const InputDecoration(labelText: 'Password'),
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
                      TextFormField(
                        controller: confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'Confirm Password'),
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
                    ],
                  ),
                )
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
