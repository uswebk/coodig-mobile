import 'dart:async';

import 'package:coodig_mobile/model/otp.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/otp_service.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));
final otpService = Provider((ref) => ref.watch(otpServiceProvider));

final otpTimerStateNotifierProvider =
    StateNotifierProvider<OtpTimerNotifier, TimerState?>((ref) {
  return OtpTimerNotifier(ref.watch(otpService));
});

class TimerState {
  int minutes;
  int seconds;
  TimerState({this.minutes = 0, this.seconds = 0});
}

class OtpTimerNotifier extends StateNotifier<TimerState> {
  OtpTimerNotifier(this._otpService) : super(TimerState());

  final OtpService _otpService;
  Timer? _timer;

  void reset() {
    _timer?.cancel();
    state = TimerState();
  }

  Future<void> startTimer() async {
    reset();

    Otp? otp = await _otpService.fetch();

    int minutes = 0;
    int seconds = 0;

    if (otp != null) {
      DateTime now = DateTime.parse(DateTime.now()
          .toString()
          .substring(0, DateTime.now().toString().length - 7));
      DateTime expirationAt = DateTime.parse(otp.expirationAt
          .toString()
          .substring(0, otp.expirationAt.toString().length - 5));
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
        state = TimerState(minutes: state.minutes, seconds: seconds);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
