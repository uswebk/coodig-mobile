import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    required bool isLoading,
  }) = _ResetPasswordState;
}
