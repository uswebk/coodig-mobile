import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupStateNotifierProvider =
    StateNotifierProvider<SignupStateNotifier, SignupState>(
        (ref) => SignupStateNotifier());

class SignupState {
  Map<String, String> errors;
  bool isLoading;

  SignupState(this.errors, this.isLoading);
}

class SignupStateNotifier extends StateNotifier<SignupState> {
  SignupStateNotifier() : super(SignupState({}, false));

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errors = {};
    errors.forEach((String key, dynamic value) {
      errors[key] = value[0];
    });

    state = SignupState(errors, false);
  }

  void reset() {
    state = SignupState({}, false);
  }

  void showHUD() {
    state = SignupState(state.errors, true);
  }

  void hideHUD() {
    state = SignupState(state.errors, false);
  }
}

final signupIsLoadingProvider = StateProvider<bool>((ref) => false);
