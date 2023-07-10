import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class ReregistrationButton extends ConsumerWidget {
  const ReregistrationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () async {
        await ref.read(authStateNotifierProvider.notifier).logout();
        Get.off<dynamic>(const LaunchPage());
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'Don\'t remember registering? ',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          Text(
            'Reregistration',
            style: TextStyle(
              fontSize: 13,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
