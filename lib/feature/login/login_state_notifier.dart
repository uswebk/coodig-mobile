import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateNotifierProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

class LoginState {
  Map<String, String> errors;
  bool isLoading;

  LoginState({this.errors = const {}, this.isLoading = false});
}

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState());

  void setMessage(Map<String, dynamic> errors) {
    Map<String, String> errorMessages = {};
    errors.forEach((String key, dynamic value) {
      errorMessages[key] = value[0].toString();
    });

    state = LoginState(errors: errorMessages, isLoading: state.isLoading);
  }

  void reset() {
    state = LoginState();
  }

  void setLoading(bool isLoading) async {
    state = LoginState(errors: state.errors, isLoading: isLoading);
  }
}
