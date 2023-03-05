import 'dart:convert';

import 'package:coodig_mobile/model/user.dart';
import 'package:coodig_mobile/repository/user_repository.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepository = Provider((ref) => ref.watch(userRepositoryProvider));
final authService = Provider((ref) => ref.watch(authServiceProvider));

final userServiceProvider = Provider(
    (ref) => UserService(ref.watch(userRepository), ref.watch(authService)));

class UserService {
  UserService(this._userRepository, this._authService);

  final UserRepository _userRepository;
  final AuthService _authService;

  Future<User?> fetchUser() async {
    final response = await _userRepository.fetchUser();

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }

    if (response.statusCode == 401) {
      await _authService.refresh();

      final retryResponse = await _userRepository.fetchUser();

      if (retryResponse.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
    }

    return null;
  }
}
