import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));

final resetPasswordStateProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>((ref) {
  return ResetPasswordNotifier(ref.watch(authService));
});

class ResetPasswordState {
  bool isLoading;
  String errorMessage;

  ResetPasswordState({this.isLoading = false, this.errorMessage = ''});
}

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  ResetPasswordNotifier(this._authService) : super(ResetPasswordState());

  final AuthService _authService;

  Future<bool> sendResetPassword(String email) async {
    state = ResetPasswordState(isLoading: true, errorMessage: '');

    try {
      return await _authService.sendResetPassword(email);
    } catch (e) {
      state = ResetPasswordState(isLoading: false, errorMessage: e.toString());
    }
    return false;
  }
}
