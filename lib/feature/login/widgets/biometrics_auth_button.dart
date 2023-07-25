import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/service/biomerics_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BiometricsAuthButton extends HookConsumerWidget {
  const BiometricsAuthButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BiometricsService biometricsService = ref.watch(biometricsServiceProvider);

    return TextButton(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.face_rounded, size: 20),
          Text('/'),
          Icon(Icons.fingerprint, size: 20),
          Text('Biometrics Auth'),
        ],
      ),
      onPressed: () async {
        try {
          if (await biometricsService.canAuthenticate()) {
            final bool didAuthenticate = await biometricsService.authenticate();
            if (didAuthenticate) {
              await ref.read(authStateNotifierProvider.notifier).loginByBiometrics();
            }
          }
        } catch (e) {
          Snackbar.showError(context, 'Fail biometrics authenticate');
        }
      },
    );
  }
}
