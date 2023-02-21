import 'package:coodig_mobile/service/user_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user.dart';

final service = Provider((ref) => ref.watch(userServiceProvider));

final userNotifierProvider =
    StateNotifierProvider((ref) => UserNotifier(ref.watch(service)));

class UserState {
  UserState();

  late bool isAuth = false;
  late User user = User(name: '', email: '');
}

class UserNotifier extends StateNotifier<UserState> {
  UserNotifier(this._userService) : super(UserState());

  final UserService _userService;

  Future<void> fetchUser() async {
    User? user = await _userService.fetchUser();

    if (user != null) {
      state.isAuth = true;
      state.user = user;
    }
  }
}
