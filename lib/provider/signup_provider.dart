import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupStateNotifierProvider =
    StateNotifierProvider<SignupNotifier, SignupState>((ref) {
  return SignupNotifier();
});

class SignupState {
  Map<String, String> errorMessages;

  SignupState(this.errorMessages);
}

class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier() : super(SignupState({}));

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0];
    });

    state = SignupState(errorMessages);
  }

  void reset() {
    state = SignupState({});
  }
}

final signupIsLoadingProvider = StateProvider<bool>((ref) => false);
final passwordVisibleProvider = StateProvider<bool>((ref) => false);
final passwordConfirmVisibleProvider = StateProvider<bool>((ref) => false);
