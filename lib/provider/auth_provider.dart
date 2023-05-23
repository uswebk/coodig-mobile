import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/model/user.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:coodig_mobile/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  void reset() {
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

  Future<void> logout() async {
    await _authService.logout();
    reset();
  }
}

final userStatusProvider = Provider<UserStatus>((ref) {
  final User? user = ref.watch(authStateProvider);

  if (user == null) {
    return UserStatus.unauthenticated;
  }

  if (user.emailVerifiedAt == null) {
    return UserStatus.emailNotVerified;
  }

  return UserStatus.authenticated;
});
