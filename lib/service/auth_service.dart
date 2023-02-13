import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService {
  Future<String> login(String email, String password) async {
    // TODO API Access
    return 'Token';
  }
}

final authSserviceProvider = Provider<AuthService>((ref) => AuthService());
