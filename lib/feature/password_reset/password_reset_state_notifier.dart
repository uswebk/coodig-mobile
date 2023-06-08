import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordResetStateNotifierProvider =
    StateNotifierProvider<ResetPasswordStateNotifier, ResetPasswordState>(
        (ref) => ResetPasswordStateNotifier(ref.watch(authServiceProvider)));

class ResetPasswordState {
  Map<String, String> errors;
  bool isLoading;

  ResetPasswordState({this.errors = const {}, this.isLoading = false});
}

class ResetPasswordStateNotifier extends StateNotifier<ResetPasswordState> {
  ResetPasswordStateNotifier(this._authService) : super(ResetPasswordState());

  final AuthService _authService;

  Future<void> resetPassword(
      String link, String password, String confirmPassword) async {
    state = ResetPasswordState();

    Uri uri = Uri.parse(link);
    List<String> pathSegments = uri.pathSegments;
    String uid = pathSegments[0];
    String token = pathSegments[1].split(':')[0];

    await _authService.resetPassword(uid, token, password, confirmPassword);
  }

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0].toString();
    });

    state =
        ResetPasswordState(errors: errorMessages, isLoading: state.isLoading);
  }

  void reset() {
    state = ResetPasswordState();
  }

  void setLoading(bool isLoading) async {
    state = ResetPasswordState(errors: state.errors, isLoading: isLoading);
  }
}

final resetPasswordLinkProvider = StateProvider<String>((ref) => '');
