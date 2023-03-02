import 'package:coodig_mobile/service/auth_service.dart';
import 'package:coodig_mobile/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));
final userService = Provider((ref) => ref.watch(userServiceProvider));

final authNotifierProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier(ref.watch(authService), ref.watch(userService));
});

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier(this._authService, this._userService) : super(null);

  final AuthService _authService;
  final UserService _userService;

  Future<void> fetchUser() async {
    state = await _userService.fetchUser();
  }

  Future<bool> login(String email, String password) async {
    bool isLoggedIn = await _authService.login(email, password);

    await fetchUser();

    return isLoggedIn;
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}

final isAuthenticatedProvider = Provider<bool>((ref) {
  final User? user = ref.watch(authNotifierProvider);

  return user != null;
});
