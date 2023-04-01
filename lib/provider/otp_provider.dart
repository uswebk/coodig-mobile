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
  final bool isLoading;
  final String errorMessage;

  OtpState(
    this.controllers, {
    this.otp = '',
    this.isButtonEnabled = false,
    this.isLoading = false,
    this.errorMessage = '',
  });

  OtpState copyWith(
      {List<TextEditingController>? controllers,
      String? otp,
      bool? isButtonEnabled,
      bool? isLoading,
      String? errorMessage}) {
    return OtpState(
      this.controllers,
      otp: otp ?? this.otp,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
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

  void resetState() {
    final controllers = List.generate(
        6, (index) => TextEditingController(text: ''),
        growable: false);
    state = OtpState(controllers);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  Future<bool> verify() async {
    return await _authService.verify(state.otp);
  }

  Future<void> resendOtp() async {
    resetState();
    await _authService.resendOtp();
  }

  void setMessage(Map<String, dynamic> errors) {
    String errorMessage = '';

    errors.forEach((key, value) {
      errorMessage += value;
    });

    state = state.copyWith(errorMessage: errorMessage);
  }
}
