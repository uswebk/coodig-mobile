import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginStateProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

class LoginState {
  bool isLoading;
  String errorMessage;

  LoginState({this.isLoading = false, this.errorMessage = ''});
}

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(LoginState());

  void setMessage(Map<String, dynamic> errors) {
    String errorMessage = '';

    errors.forEach((key, value) {
      errorMessage += '${value[0]}\n';
    });

    RegExp exp = RegExp(r'\n+$');
    String message = errorMessage.replaceAll(exp, '');

    state = LoginState(isLoading: false, errorMessage: message);
  }

  void resetMessage() {
    state.errorMessage = '';
  }

  void setLoading(bool isLoading) {
    state = LoginState(isLoading: true, errorMessage: state.errorMessage);
  }

  void initState() {
    state = LoginState(isLoading: false, errorMessage: '');
  }
}
