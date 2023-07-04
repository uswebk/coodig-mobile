import 'dart:async';

import 'package:coodig_mobile/feature/otp/state/otp_state.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpStateNotifierProvider =
    StateNotifierProvider<OtpStateNotifier, OtpState>((ref) {
  final controllers = List.generate(
      6, (index) => TextEditingController(text: ''),
      growable: false);
  return OtpStateNotifier(
      OtpState(
        controllers: controllers,
        otp: '',
        isButtonEnabled: false,
      ),
      ref.watch(authServiceProvider));
});

class OtpStateNotifier extends StateNotifier<OtpState> {
  final AuthService _authService;

  OtpStateNotifier(OtpState state, this._authService) : super(state);

  void update() {
    String otp = state.controllers.map((controller) => controller.text).join();
    bool isButtonEnabled =
        state.controllers.every((controller) => controller.text.isNotEmpty);
    state = state.copyWith(otp: otp, isButtonEnabled: isButtonEnabled);
  }

  void reset() {
    final controllers = List.generate(
        6, (index) => TextEditingController(text: ''),
        growable: false);
    state = state.copyWith(controllers: controllers);
  }

  Future<bool> verify() async {
    return await _authService.verify(state.otp);
  }

  Future<void> resend() async {
    reset();
    await _authService.resendOtp();
  }
}
