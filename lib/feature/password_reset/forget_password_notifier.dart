import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final forgetPasswordStateNotifierProvider =
    StateNotifierProvider<ResetPasswordNotifier, ForgetPasswordState>(
        (ref) => ResetPasswordNotifier(ref.watch(authServiceProvider)));

class ForgetPasswordState {
  Map<String, String> errors;
  bool isLoading;

  ForgetPasswordState({this.errors = const {}, this.isLoading = false});
}

class ResetPasswordNotifier extends StateNotifier<ForgetPasswordState> {
  ResetPasswordNotifier(this._authService) : super(ForgetPasswordState());

  final AuthService _authService;

  Future<void> sendResetPassword(String email) async {
    state = ForgetPasswordState(errors: {}, isLoading: state.isLoading);
    await _authService.sendResetPassword(email);
  }

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0];
    });

    state =
        ForgetPasswordState(errors: errorMessages, isLoading: state.isLoading);
  }

  void setLoading(bool isLoading) async {
    state = ForgetPasswordState(errors: state.errors, isLoading: isLoading);
  }
}
