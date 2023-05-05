import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));

final resetPasswordStateProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>((ref) {
  return ResetPasswordNotifier(ref.watch(authService));
});

class ResetPasswordState {
  Map<String, String> errorMessages;

  ResetPasswordState(this.errorMessages);
}

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  ResetPasswordNotifier(this._authService) : super(ResetPasswordState({}));

  final AuthService _authService;

  Future<void> sendResetPassword(String email) async {
    state = ResetPasswordState({});
    await _authService.sendResetPassword(email);
  }

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0];
    });

    state = ResetPasswordState(errorMessages);
  }
}

final resetPasswordIsLoadingProvider = StateProvider<bool>((ref) => false);
final resetPasswordPasswordVisibleProvider =
    StateProvider<bool>((ref) => false);
final resetPasswordPasswordConfirmVisibleProvider =
    StateProvider<bool>((ref) => false);
