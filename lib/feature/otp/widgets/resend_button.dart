import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/feature/otp/state/otp_state_notifier.dart';
import 'package:coodig_mobile/provider/otp_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ResendButton extends HookConsumerWidget {
  const ResendButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isProcessing = useState(false);
    final isMounted = useIsMounted();

    return TextButton(
      onPressed: () async {
        try {
          if (isProcessing.value) {
            return;
          }
          isProcessing.value = true;

          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          await ref.read(otpStateNotifierProvider.notifier).resend();
          await ref.read(otpTimerStateNotifierProvider.notifier).startTimer();

          Future.delayed(Duration.zero, () {
            Snackbar.showSuccess(context, 'Resent the OTP to your email.');
          });
        } catch (e) {
          Snackbar.showError(context, 'Resent the OTP to your email.');
        } finally {
          if (isMounted()) isProcessing.value = false;
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'Resend Otp ',
            style: TextStyle(fontSize: 14),
          ),
          Icon(
            Icons.send,
            size: 16,
          ),
        ],
      ),
    );
  }
}
