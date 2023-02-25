import 'package:coodig_mobile/service/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

final service = Provider((ref) => ref.watch(userServiceProvider));

final userNotifierProvider =
    StateNotifierProvider<UserNotifier, UserState>((ref) {
  return UserNotifier(ref.watch(service));
});

@immutable
class UserState {
  const UserState(this.isAuth, this.name, this.email);

  final bool isAuth;
  final String name;
  final String email;
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this._userService) : super(const UserState(false, '', ''));

  final UserService _userService;

  Future<User?> fetchUser() async {
    User? user = await _userService.fetchUser();

    if (user != null) {
      state = UserState(true, user.name, user.email);
    }

    return user;
  }
}
