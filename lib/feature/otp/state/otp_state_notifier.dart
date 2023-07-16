import 'dart:async';

import 'package:coodig_mobile/feature/otp/state/otp_state.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpStateNotifierProvider = StateNotifierProvider<OtpStateNotifier, OtpState>((ref) {
  final controllers = List.generate(6, (index) => TextEditingController(text: ''), growable: false);
  return OtpStateNotifier(OtpState(controllers: controllers, otp: ''), ref.watch(authServiceProvider));
});

class OtpStateNotifier extends StateNotifier<OtpState> {
  final AuthService _authService;

  OtpStateNotifier(OtpState state, this._authService) : super(state);

  void update() {
    String otp = state.controllers.map((controller) => controller.text).join();
    state = state.copyWith(otp: otp);
  }

  void reset() {
    final controllers = List.generate(6, (index) => TextEditingController(text: ''), growable: false);
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

final isButtonEnabledProvider = Provider((ref) {
  List<TextEditingController> controllers = ref.watch(otpStateNotifierProvider).controllers;

  return controllers.every((controller) => controller.text.isNotEmpty);
});
