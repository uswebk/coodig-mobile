import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/feature/otp/state/otp_state_notifier.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VerifyButton extends HookConsumerWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isButtonEnabled = ref.watch(isButtonEnabledProvider);
    final isProcessing = useState(false);
    final isMounted = useIsMounted();

    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
        onPressed: isButtonEnabled && isProcessing.value == false
            ? () async {
                if (isProcessing.value) {
                  return;
                }
                isProcessing.value = true;
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                await Future<dynamic>.delayed(const Duration(seconds: 1));
                try {
                  await ref.read(otpStateNotifierProvider.notifier).verify();
                  await ref.read(authStateNotifierProvider.notifier).fetchMe();
                } catch (e) {
                  Future.delayed(Duration.zero, () {
                    Snackbar.showError(context, e.toString());
                  });
                } finally {
                  if (isMounted()) isProcessing.value = false;
                }
              }
            : null,
        child: isProcessing.value
            ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 3))
            : const Text('Verify'),
      ),
    );
  }
}
