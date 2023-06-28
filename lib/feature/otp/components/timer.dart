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
        int minutes = state.minutes;
        int seconds = state.seconds;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
              child: Column(
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    color: Colors.blueGrey,
                    size: 20,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: (minutes == 0 && seconds == 0) ? Colors.grey : Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
