import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    required List<TextEditingController> controllers,
    required String otp,
    required bool isButtonEnabled,
  }) = _OtpState;
}
