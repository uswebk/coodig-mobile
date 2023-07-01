import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/feature/otp/otp_state_notifier.dart';
import 'package:coodig_mobile/provider/otp_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResendButton extends ConsumerWidget {
  const ResendButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'Resend Otp ',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Icon(
            Icons.send,
            size: 16,
          ),
        ],
      ),
      onPressed: () async {
        try {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          await ref.read(otpStateNotifierProvider.notifier).resend();
          await ref.read(otpTimerStateNotifierProvider.notifier).startTimer();

          Future.delayed(Duration.zero, () {
            Snackbar.showSuccess(context, 'Resent the OTP to your email.');
          });
        } catch (e) {
          Snackbar.showError(context, 'Resent the OTP to your email.');
        }
      },
    );
  }
}
