import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_links/uni_links.dart';

import '../enum/user_status.dart';
import '../view/dashboard/dashboard_screen.dart';
import '../view/launch/launch_screen.dart';
import 'deeplink_service.dart';

class SplashService {
  Future<void> initDeeplink(WidgetRef ref) async {
    String? link = await getInitialLink();

    if (link != null) {
      DeeplinkService().setDeeplink(ref, link);
    }
  }

  Future<Widget> getScreen(UserStatus userStatus) async {
    String? link = await getInitialLink();

    if (link != null) {
      return DeeplinkService().getScreen(link);
    }

    switch (userStatus) {
      case UserStatus.unauthenticated:
        return const LaunchScreen();
      case UserStatus.emailNotVerified:
        return const OtpPage();
      case UserStatus.authenticated:
        return const DashboardScreen();
      default:
        return Container();
    }
  }
}
