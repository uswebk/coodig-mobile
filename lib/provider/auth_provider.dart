import 'package:coodig_mobile/service/auth_service.dart';
import 'package:coodig_mobile/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));
final userService = Provider((ref) => ref.watch(userServiceProvider));

final authStateProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier(ref.watch(authService), ref.watch(userService));
});

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier(this._authService, this._userService) : super(null);

  final AuthService _authService;
  final UserService _userService;

  Future<void> fetchMe() async {
    state = await _userService.fetchMe();
  }

  Future<void> resetUser() async {
    state = null;
  }

  Future<void> login(String email, String password) async {
    await _authService.login(email, password);
    await fetchMe();
  }

  Future<void> signup(String name, String email, String password,
      String confirmPassword) async {
    await _authService.signup(name, email, password, confirmPassword);
    await fetchMe();
  }

  Future<void> reregistration() async {
    await _authService.logout();
    await resetUser();
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}

final hasAccountProvider = Provider<bool>((ref) {
  final User? user = ref.watch(authStateProvider);

  return user != null;
});

final isEmailVerifiedProvider = Provider<bool>((ref) {
  final User? user = ref.watch(authStateProvider);

  if (user == null) return false;

  return user.emailVerifiedAt != null;
});
