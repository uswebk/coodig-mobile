import 'package:coodig_mobile/feature/login/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateNotifierProvider = StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(const LoginState(errors: {}, isLoading: false));

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0].toString();
    });

    state = state.copyWith(errors: errorMessages, isLoading: false);
  }

  void setLoading(bool isLoading) async {
    state = state.copyWith(isLoading: isLoading);
  }
}
