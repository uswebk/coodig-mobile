import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../service/auth_service.dart';

final otpStateNotifierProvider =
    StateNotifierProvider<OtpStateNotifier, OtpState>((ref) {
  final controllers = List.generate(
      6, (index) => TextEditingController(text: ''),
      growable: false);
  return OtpStateNotifier(
      OtpState(controllers), ref.watch(authServiceProvider));
});

class OtpState {
  final List<TextEditingController> controllers;
  final String otp;
  final bool isButtonEnabled;
  final bool isLoading;

  OtpState(
    this.controllers, {
    this.otp = '',
    this.isButtonEnabled = false,
    this.isLoading = false,
  });

  OtpState copyWith({
    List<TextEditingController>? controllers,
    String? otp,
    bool? isButtonEnabled,
    String? errorMessage,
    bool? isLoading,
  }) {
    return OtpState(
      this.controllers,
      otp: otp ?? this.otp,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      isLoading: isLoading ?? this.isLoading,
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

  void setLoading(bool isLoading) async {
    state = state.copyWith(isLoading: isLoading);
  }
}
