import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthRepository {
  Future<String> login(String email, String password) async {
    // TODO: DI
    AuthService authService = AuthService();
    final response = authService.login(email, password);

    // TODO: Convert
    return response;
  }
}

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());
