import 'package:coodig_mobile/feature/signup/state/signup_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupStateNotifierProvider =
    StateNotifierProvider.autoDispose<SignupStateNotifier, SignupState>((ref) => SignupStateNotifier());

class SignupStateNotifier extends StateNotifier<SignupState> {
  SignupStateNotifier() : super(const SignupState(isLoading: false));

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
