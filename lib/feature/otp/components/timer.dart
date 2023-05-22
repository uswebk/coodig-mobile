import 'package:coodig_mobile/provider/otp_timer_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Timer extends ConsumerWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final state = ref.watch(otpTimerStateNotifierProvider);
        int minutes = state!.minutes;
        int seconds = state.seconds;
        return Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              const Icon(
                Icons.timer_outlined,
                color: Colors.black26,
                size: 24,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: (minutes == 0 && seconds == 0)
                      ? Colors.black38
                      : Colors.green.shade300,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
