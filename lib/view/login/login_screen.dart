import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/login_provider.dart';
import 'package:coodig_mobile/view/dashboard/dashboard_screen.dart';
import 'package:coodig_mobile/view/otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isEmailVerified = ref.watch(isEmailVerifiedProvider);
      bool hasAccount = ref.watch(hasAccountProvider);
      if (isEmailVerified) {
        Get.off(const OtpScreen());
      } else if (hasAccount) {
        Get.off(const DashboardScreen());
      }
    });

    LoginState state = ref.watch(loginStateProvider);

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Login'),
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: (state.errorMessage != '')
                      ? Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Colors.red.shade100),
                          ),
                          child: Text(
                            state.errorMessage,
                            style: TextStyle(color: Colors.red.shade300),
                          ),
                        )
                      : Container(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
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
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                String email = emailController.text;
                                String password = passwordController.text;
                                ref
                                    .read(loginStateProvider.notifier)
                                    .setLoading(true);
                                await ref
                                    .watch(authStateProvider.notifier)
                                    .login(email, password);
                                ref
                                    .read(loginStateProvider.notifier)
                                    .setLoading(false);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                            ),
                            child: const Text('Login')),
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
