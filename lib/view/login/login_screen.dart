import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/login_provider.dart';
import 'package:coodig_mobile/view/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LoginState state = ref.watch(loginStateProvider);

    print(state.isLoading);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isAuthenticated = ref.watch(isAuthenticatedProvider);
      if (isAuthenticated) {
        Get.off(const DashboardScreen());
      }
    });

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Stack(children: [
      Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state.errorMessage != '')
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
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
                  ),
                ),
              Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      onChanged: (String value) {},
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      onChanged: (String value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            String email = emailController.text;
                            String password = passwordController.text;

                            if (email.isEmpty) return;
                            if (password.isEmpty) return;

                            ref
                                .read(loginStateProvider.notifier)
                                .setLoading(true);
                            await ref
                                .watch(authNotifierProvider.notifier)
                                .login(email, password);
                            ref
                                .read(loginStateProvider.notifier)
                                .setLoading(false);
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
      ModalProgressHUD(
        inAsyncCall: state.isLoading,
        child: Container(),
      ),
    ]);
  }
}
