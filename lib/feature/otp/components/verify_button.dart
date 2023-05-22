import 'package:coodig_mobile/feature/otp/otp_state_notifier.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyButton extends ConsumerWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpState = ref.watch(otpStateNotifierProvider);
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: otpState.isButtonEnabled
            ? () async {
                ref.read(otpLoadingProvider.notifier).state = true;

                try {
                  await ref.read(otpStateNotifierProvider.notifier).verify();
                  await ref.read(authStateProvider.notifier).fetchMe();
                } catch (e) {
                  ref.read(otpErrorMessageProvider.notifier).state =
                      e.toString();
                }

                ref.read(otpLoadingProvider.notifier).state = false;
              }
            : null,
        child: const Text('Verify'),
      ),
    );
  }
}
