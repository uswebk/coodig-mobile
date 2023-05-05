import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));

final forgetPasswordStateProvider =
    StateNotifierProvider<ResetPasswordNotifier, ForgetPasswordState>((ref) {
  return ResetPasswordNotifier(ref.watch(authService));
});

class ForgetPasswordState {
  Map<String, String> errorMessages;

  ForgetPasswordState(this.errorMessages);
}

class ResetPasswordNotifier extends StateNotifier<ForgetPasswordState> {
  ResetPasswordNotifier(this._authService) : super(ForgetPasswordState({}));

  final AuthService _authService;

  Future<void> sendResetPassword(String email) async {
    state = ForgetPasswordState({});
    await _authService.sendResetPassword(email);
  }

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0];
    });

    state = ForgetPasswordState(errorMessages);
  }
}

final forgetPasswordIsLoadingProvider = StateProvider<bool>((ref) => false);
