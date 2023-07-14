import 'package:coodig_mobile/provider/otp_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Timer extends ConsumerWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(otpTimerStateNotifierProvider);
    final isOtpTimeOut = ref.watch(isOtpTimeOutProvider);
    int minutes = state.minutes;
    int seconds = state.seconds;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
          child: Row(
            children: [
              const Text(
                'Code expiration time:',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: (isOtpTimeOut) ? Colors.grey : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
