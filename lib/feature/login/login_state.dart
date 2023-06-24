import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required Map<String, String> errors,
    required bool isLoading,
  }) = _LoginState;
}
