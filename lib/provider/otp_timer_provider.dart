import 'dart:async';

import 'package:coodig_mobile/model/otp.dart';
import 'package:coodig_mobile/service/otp_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpTimerStateNotifierProvider = StateNotifierProvider<OtpTimerNotifier, TimerState>((ref) {
  return OtpTimerNotifier(ref.watch(otpServiceProvider));
});

class TimerState {
  int minutes;
  int seconds;
  TimerState({required this.minutes, required this.seconds});
}

class OtpTimerNotifier extends StateNotifier<TimerState> {
  OtpTimerNotifier(this._otpService) : super(TimerState(minutes: 0, seconds: 0));

  final OtpService _otpService;
  Timer? _timer;

  void reset() {
    _timer?.cancel();
    state = TimerState(minutes: 0, seconds: 0);
  }

  Future<void> startTimer() async {
    reset();

    Otp? otp = await _otpService.fetch();

    int minutes = 0;
    int seconds = 0;

    if (otp != null) {
      DateTime now = DateTime.parse(DateTime.now().toString().substring(0, DateTime.now().toString().length - 7));
      DateTime expirationAt =
          DateTime.parse(otp.expirationAt.toString().substring(0, otp.expirationAt.toString().length - 5));
      Duration difference = expirationAt.difference(now);

      if (!difference.isNegative) {
        minutes = difference.inMinutes;
        seconds = difference.inSeconds.remainder(60);
      }
    }

    state = TimerState(minutes: minutes, seconds: seconds);

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.minutes == 0 && state.seconds == 0) {
        timer.cancel();
      } else if (state.seconds == 0) {
        int minutes = state.minutes - 1;
        int seconds = 59;
        state = TimerState(minutes: minutes, seconds: seconds);
      } else {
        int seconds = state.seconds - 1;
        int minutes = state.minutes;
        state = TimerState(minutes: minutes, seconds: seconds);
      }
    });
  }
}
