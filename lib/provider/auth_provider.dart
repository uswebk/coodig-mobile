import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final service = Provider((ref) => ref.watch(authServiceProvider));

final authNotifierProvider =
    StateNotifierProvider((ref) => AuthNotifier(ref.watch(service)));

class AuthNotifier extends StateNotifier {
  AuthNotifier(this._authService) : super(0);

  final AuthService _authService;

  Future<void> login(String email, String password) async {
    final response = _authService.login(email, password);
    // TODO: add Token To Storage
  }
}
