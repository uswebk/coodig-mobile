import 'package:coodig_mobile/feature/login/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateNotifierProvider = StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(const LoginState(isLoading: false));

  void setLoading(bool isLoading) async {
    state = state.copyWith(isLoading: isLoading);
  }
}
