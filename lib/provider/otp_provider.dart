import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/auth_service.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));

final otpStateProvider =
    StateNotifierProvider<OtpStateNotifier, OtpState>((ref) {
  final controllers = List.generate(
      6, (index) => TextEditingController(text: ''),
      growable: false);
  return OtpStateNotifier(OtpState(controllers), ref.watch(authService));
});

class OtpState {
  final List<TextEditingController> controllers;
  final String otp;
  final bool isButtonEnabled;

  OtpState(
    this.controllers, {
    this.otp = '',
    this.isButtonEnabled = false,
  });

  OtpState copyWith({
    List<TextEditingController>? controllers,
    String? otp,
    bool? isButtonEnabled,
  }) {
    return OtpState(
      this.controllers,
      otp: otp ?? this.otp,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}

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
    state = OtpState(controllers);
  }

  Future<bool> verify() async {
    return await _authService.verify(state.otp);
  }

  Future<void> resend() async {
    reset();
    await _authService.resendOtp();
  }
}

final otpErrorMessageProvider = StateProvider<String>((ref) => '');
final otpLoadingProvider = StateProvider<bool>((ref) => false);
