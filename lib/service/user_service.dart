import 'dart:convert';

import 'package:coodig_mobile/model/user.dart';
import 'package:coodig_mobile/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/local_storage.dart';

final repository = Provider((ref) => ref.watch(userRepositoryProvider));

final userServiceProvider =
    Provider((ref) => UserService(ref.watch(repository)));

class UserService {
  UserService(this._userRepository);

  final UserRepository _userRepository;
  final _localStorage = LocalStorage();

  Future<User?> fetchUser() async {
    final response = await _userRepository.fetchUser();

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    }

    // retry
    if (response.statusCode == 401) {
      // refresh token

      // final retryResponse = await _userRepository.fetchUser();
      // if (retryResponse.statusCode == 200) {
      //   return User.fromJson(jsonDecode(response.body));
      // }
    }
    return null;
  }
}
