import 'dart:convert';

import 'package:coodig_mobile/model/user.dart';
import 'package:coodig_mobile/repository/user_repository.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authService = Provider((ref) => ref.watch(authServiceProvider));
final userRepository = Provider((ref) => ref.watch(userRepositoryProvider));

final userServiceProvider = Provider(
    (ref) => UserService(ref.watch(authService), ref.watch(userRepository)));

class UserService {
  UserService(this._authService, this._userRepository);

  final AuthService _authService;
  final UserRepository _userRepository;

  Future<User?> fetchMe() async {
    final response = await _userRepository.fetchMe();

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }

    if (response.statusCode == 401) {
      await _authService.refresh();

      final retryResponse = await _userRepository.fetchMe();

      if (retryResponse.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      }
    }

    return null;
  }
}
