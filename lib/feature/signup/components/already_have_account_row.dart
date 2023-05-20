import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view/login/login_screen.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          child: const Text('Sign in'),
          onPressed: () {
            Get.to(const LoginScreen());
          },
        ),
      ],
    );
  }
}
