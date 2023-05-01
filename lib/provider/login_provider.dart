import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

class LoginState {
  Map<String, String> errorMessages;

  LoginState(this.errorMessages);
}

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState({}));

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0];
    });

    state = LoginState(errorMessages);
  }

  void reset() {
    state = LoginState({});
  }
}

final loginIsLoadingProvider = StateProvider<bool>((ref) => false);
final loginPasswordVisibleProvider = StateProvider<bool>((ref) => false);
