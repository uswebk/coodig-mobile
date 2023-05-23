import 'package:coodig_mobile/feature/signup/signup_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupStateNotifierProvider =
    StateNotifierProvider<SignupStateNotifier, SignupState>(
        (ref) => SignupStateNotifier());

class SignupStateNotifier extends StateNotifier<SignupState> {
  SignupStateNotifier()
      : super(const SignupState(errors: {}, isLoading: false));

  void setMessage(Map<String, dynamic> apiErrors) {
    Map<String, String> errors = {};
    apiErrors.forEach((String key, dynamic value) {
      errors[key] = value[0];
    });

    state = state.copyWith(errors: errors, isLoading: false);
  }

  void reset() {
    state = state.copyWith(errors: {}, isLoading: false);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
