import 'package:coodig_mobile/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) => AuthRepository());

final loginNotifierProvider = StateNotifierProvider((ref) {
  return LoginNotifier(ref.watch(authRepositoryProvider));
});

class LoginNotifier extends StateNotifier {
  LoginNotifier(this._authRepository) : super(0);

  final AuthRepository _authRepository;

  Future<void> login(String email, String password) async {
    final response = _authRepository.login(email, password);
    // TODO: add Token To Storage
  }
}
