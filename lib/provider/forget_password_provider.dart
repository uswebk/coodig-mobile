import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgetPasswordStateNotifierProvider =
    StateNotifierProvider.autoDispose<ResetPasswordNotifier, ForgetPasswordState>((ref) {
  return ResetPasswordNotifier(ref.watch(authServiceProvider));
});

class ForgetPasswordState {
  Map<String, String> errors;

  ForgetPasswordState({this.errors = const {}});
}

class ResetPasswordNotifier extends StateNotifier<ForgetPasswordState> {
  ResetPasswordNotifier(this._authService) : super(ForgetPasswordState());

  final AuthService _authService;

  Future<void> sendResetPassword(String email) async {
    state = ForgetPasswordState(errors: {});
    await _authService.sendResetPassword(email);
  }

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0].toString();
    });

    state = ForgetPasswordState(errors: errorMessages);
  }
}
