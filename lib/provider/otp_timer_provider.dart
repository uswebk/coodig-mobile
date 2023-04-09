import 'dart:async';

import 'package:coodig_mobile/model/otp.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/otp_service.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));
final otpService = Provider((ref) => ref.watch(otpServiceProvider));

final otpTimerStateProvider =
    StateNotifierProvider<OtpTimerNotifier, OtpState?>((ref) {
  return OtpTimerNotifier(ref.watch(otpService));
});

class OtpState {
  int minutes;
  int seconds;
  bool isCalled;
  Timer? timer;
  OtpState(
      {this.minutes = 0, this.seconds = 0, this.isCalled = false, this.timer});
}

class OtpTimerNotifier extends StateNotifier<OtpState> {
  OtpTimerNotifier(this._otpService) : super(OtpState());

  final OtpService _otpService;

  void reset() {
    if (state.timer != null) {
      state.timer!.cancel();
    }
    state = OtpState();
  }

  Future<void> startTimer() async {
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

    state = OtpState(minutes: minutes, seconds: seconds, isCalled: true);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.isCalled == false) {
        timer.cancel();
      } else if (state.minutes == 0 && state.seconds == 0) {
        timer.cancel();
      } else if (state.seconds == 0) {
        int minutes = state.minutes - 1;
        int seconds = 59;
        state = OtpState(
            minutes: minutes, seconds: seconds, isCalled: true, timer: timer);
      } else {
        int seconds = state.seconds - 1;
        state = OtpState(
            minutes: state.minutes,
            seconds: seconds,
            isCalled: true,
            timer: timer);
      }
    });
  }
}
