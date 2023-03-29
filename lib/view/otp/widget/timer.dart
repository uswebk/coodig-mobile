import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../provider/otp_timer_provider.dart';

class ExpirationTimer extends ConsumerWidget {
  const ExpirationTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(otpTimerStateProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (state!.isCalled == false) {
        ref.read(otpTimerStateProvider.notifier).startTimer();
      }
    });

    int minutes = state!.minutes;
    int seconds = state.seconds;

    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          const Icon(
            Icons.timer_sharp,
            color: Colors.black38,
            size: 26,
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
                  : Colors.green.shade400,
            ),
          ),
        ],
      ),
    );
  }
}
