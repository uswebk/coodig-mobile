import 'package:coodig_mobile/core/analytics.dart';
import 'package:coodig_mobile/model/user.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uidProvider = Provider((ref) {
  return Uid(ref.watch(authStateNotifierProvider), ref.watch(firebaseAnalyticsProvider));
});

class Uid {
  Uid(this._user, this._analytics);
  final User? _user;
  final Analytics _analytics;

  Future<void> set() async {
    if (_user != null) {
      await _analytics.setUserId(_user!.id);
    }
  }
}
