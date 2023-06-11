import 'dart:convert';

import 'package:coodig_mobile/model/user.dart';
import 'package:coodig_mobile/repository/user_repository.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userServiceProvider = Provider((ref) => UserService(
    ref.watch(authServiceProvider), ref.watch(userRepositoryProvider)));

class UserService {
  UserService(this._authService, this._userRepository);

  final AuthService _authService;
  final UserRepository _userRepository;

  Future<User?> fetchMe() async {
    final response = await _userRepository.fetchMe();

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    if (response.statusCode == 401) {
      await _authService.refresh();

      final retryResponse = await _userRepository.fetchMe();

      if (retryResponse.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      }
    }

    return null;
  }
}
