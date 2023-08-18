import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:coodig_mobile/service/splash_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final screenProvider = FutureProvider<Widget>((ref) async {
  // await 2 seconds for view splash screen
  await Future<dynamic>.delayed(const Duration(seconds: 2));
  await ref.read(authStateNotifierProvider.notifier).fetchMe();
  final UserStatus userStatus = ref.watch(userStatusProvider);
  Widget screen = await ref.watch(splashServiceProvider).getScreen(userStatus);

  return screen;
});
