import 'dart:convert';

import 'package:coodig_mobile/model/user.dart';
import 'package:coodig_mobile/repository/user_repository.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:coodig_mobile/service/secure_storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userServiceProvider = Provider((ref) => UserService(
    ref.watch(authServiceProvider), ref.watch(secureStorageServiceProvider), ref.watch(userRepositoryProvider)));

class UserService {
  UserService(this._authService, this._secureStorageService, this._userRepository);

  final AuthService _authService;
  final SecureStorageService _secureStorageService;
  final UserRepository _userRepository;

  Future<User?> fetchMe() async {
    String accessToken = await _secureStorageService.getAccessToken();
    final response = await _userRepository.fetchMe(accessToken);

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    if (response.statusCode == 401) {
      await _authService.refresh();
      String accessToken = await _secureStorageService.getAccessToken();
      final retryResponse = await _userRepository.fetchMe(accessToken);

      if (retryResponse.statusCode == 200) {
        return User.fromJson(jsonDecode(retryResponse.body) as Map<String, dynamic>);
      }
    }

    return null;
  }
}
