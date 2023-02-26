import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/provider/user_provider.dart';
import 'package:coodig_mobile/view/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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

                          bool isAuthenticated = await ref
                              .watch(authNotifierProvider.notifier)
                              .login(email, password);

                          if (isAuthenticated) {
                            await ref
                                .watch(userNotifierProvider.notifier)
                                .fetchUser();
                            Get.off(const DashboardScreen());
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
    );
  }
}
