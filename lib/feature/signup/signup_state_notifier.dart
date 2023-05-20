import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

final signupStateNotifierProvider1 =
    StateNotifierProvider<SignupStateNotifier, SignupState>(
        (ref) => SignupStateNotifier());

@freezed
class SignupState {
  Map<String, String> errorMessages;
  bool isLoading;

  SignupState(this.errorMessages, this.isLoading);
}

class SignupStateNotifier extends StateNotifier<SignupState> {
  SignupStateNotifier() : super(SignupState({}, false));

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0];
    });

    state = SignupState(errorMessages, false);
  }

  void reset() {
    state = SignupState({}, false);
  }

  void showHUD() {
    state = SignupState(state.errorMessages, true);
  }

  void hideHUD() {
    state = SignupState(state.errorMessages, false);
  }
}

final signupIsLoadingProvider = StateProvider<bool>((ref) => false);
