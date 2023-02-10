import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future login(String email, String password) async {
    return _authService.login(email, password);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(authSserviceProvider));
});
