import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/home/home_page.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashServiceProvider = Provider<SplashService>((ref) => SplashService(ref.watch(deeplinkServiceProvider)));

class SplashService {
  SplashService(this._deeplinkService);

  final DeeplinkService _deeplinkService;

  Future<Widget> getScreen(UserStatus userStatus) async {
    String? link = await _deeplinkService.getLink();

    if (link != null) {
      return _deeplinkService.getScreen(link);
    }

    switch (userStatus) {
      case UserStatus.unauthenticated:
        return const LaunchPage();
      case UserStatus.emailNotVerified:
        return const OtpPage();
      case UserStatus.authenticated:
        return const HomePage();
      default:
        return Container();
    }
  }
}
