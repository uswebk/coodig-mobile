import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/auth_repository.dart';

final repository = Provider((ref) => ref.watch(authRepositoryProvider));

final authServiceProvider =
    Provider((ref) => AuthService(ref.watch(repository)));

class AuthService {
  AuthService(this._authRepository);

  final AuthRepository _authRepository;

  Future<String> login(String email, String password) async {
    final response = await _authRepository.login(email, password);

    print(response);
    // TODO: Convert
    return 'hoge';
  }
}
