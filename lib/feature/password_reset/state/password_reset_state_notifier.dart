import 'package:coodig_mobile/feature/password_reset/state/password_reset_state.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordResetStateNotifierProvider =
    StateNotifierProvider.autoDispose<ResetPasswordStateNotifier, ResetPasswordState>((ref) {
  return ResetPasswordStateNotifier(ref.watch(authServiceProvider));
});

class ResetPasswordStateNotifier extends StateNotifier<ResetPasswordState> {
  ResetPasswordStateNotifier(this._authService) : super(const ResetPasswordState(isLoading: false));

  final AuthService _authService;

  Future<void> resetPassword(String link, String password, String confirmPassword) async {
    Uri uri = Uri.parse(link);
    List<String> pathSegments = uri.pathSegments;
    String uid = pathSegments[0];
    String token = pathSegments[1].split(':')[0];

    await _authService.resetPassword(uid, token, password, confirmPassword);
  }

  void setLoading(bool isLoading) async {
    state = state.copyWith(isLoading: isLoading);
  }
}
