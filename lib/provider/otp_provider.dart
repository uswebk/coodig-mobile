import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final otpStateProvider =
    StateNotifierProvider<OtpStateNotifier, OtpState>((ref) {
  final controllers = List.generate(
      6, (index) => TextEditingController(text: ''),
      growable: false);
  return OtpStateNotifier(OtpState(controllers));
});

class OtpState {
  final List<TextEditingController> controllers;
  final String otp;
  final bool isButtonEnabled;
  final bool isLoading;

  OtpState(this.controllers,
      {this.otp = '', this.isButtonEnabled = false, this.isLoading = false});
}

class OtpStateNotifier extends StateNotifier<OtpState> {
  OtpStateNotifier(OtpState state) : super(state);

  void update() {
    String otp = state.controllers.map((controller) => controller.text).join();
    bool isButtonEnabled =
        state.controllers.every((controller) => controller.text.isNotEmpty);
    state =
        OtpState(state.controllers, otp: otp, isButtonEnabled: isButtonEnabled);
  }

  void setLoading(bool isLoading) {
    state = OtpState(state.controllers,
        otp: state.otp,
        isButtonEnabled: state.isButtonEnabled,
        isLoading: isLoading);
  }

  Future<void> send() async {
    // Execute Otp API
    await Future.delayed(const Duration(seconds: 3));
  }
}
