import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginMessageProvider =
    StateNotifierProvider<LoginMessageNotifier, String>((ref) {
  return LoginMessageNotifier();
});

class LoginMessageNotifier extends StateNotifier<String> {
  LoginMessageNotifier() : super('');

  void setMessage(Map<String, dynamic> errors) {
    String errorMessage = '';

    errors.forEach((key, value) {
      errorMessage += '${value[0]}\n';
    });

    RegExp exp = RegExp(r'\n+$');

    state = errorMessage.replaceAll(exp, '');
  }

  void resetMessage() {
    state = '';
  }
}
