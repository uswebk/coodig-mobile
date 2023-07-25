import 'package:coodig_mobile/components/modal/forget_password_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgetPasswordButton extends HookConsumerWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordResetEmail = useTextEditingController();
    return TextButton(
      child: const Text('Forget Password?'),
      onPressed: () async {
        await showModalBottomSheet<dynamic>(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.0),
            ),
          ),
          isScrollControlled: true,
          context: context,
          builder: (context) => ForgetPasswordSheet(
            emailController: passwordResetEmail,
          ),
        );
      },
    );
  }
}
