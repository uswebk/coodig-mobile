import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupStateProvider =
    StateNotifierProvider<SignupNotifier, SignupState>((ref) {
  return SignupNotifier();
});

class SignupState {
  bool isLoading;
  Map<String, String>? errorMessages;

  SignupState({this.isLoading = false, this.errorMessages});
}

class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier() : super(SignupState());

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0];
    });

    state = SignupState(isLoading: false, errorMessages: errorMessages);
  }

  void setLoading(bool isLoading) {
    state =
        SignupState(isLoading: isLoading, errorMessages: state.errorMessages);
  }
}

final passwordVisibleProvider = StateProvider<bool>((ref) => false);
final passwordConfirmVisibleProvider = StateProvider<bool>((ref) => false);
