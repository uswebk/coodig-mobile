import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/feature/otp/state/otp_state_notifier.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerifyButton extends ConsumerWidget {
  const VerifyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(otpStateNotifierProvider.notifier);
    final auth = ref.read(authStateProvider.notifier);
    final state = ref.watch(otpStateNotifierProvider);
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        onPressed: state.isButtonEnabled
            ? () async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                notifier.setLoading(true);
                try {
                  await notifier.verify();
                  await auth.fetchMe();
                } catch (e) {
                  Snackbar.showError(context, e.toString());
                } finally {
                  notifier.setLoading(false);
                }
              }
            : null,
        child: const Text('Verify'),
      ),
    );
  }
}
