import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService {
  Future<String> login(String email, String password) async {
    return Future.delayed(const Duration(milliseconds: 1000))
        .then((onValue) => 'authToken');

    // TODO API Access
  }
}

final authSserviceProvider = Provider<AuthService>((ref) => AuthService());
