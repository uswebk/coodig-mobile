import 'package:coodig_mobile/enum/user_status.dart';
import 'package:coodig_mobile/feature/dashboard/dashboard_page.dart';
import 'package:coodig_mobile/feature/launch/launch_page.dart';
import 'package:coodig_mobile/feature/otp/otp_page.dart';
import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

class SplashService {
  static Future<Widget> getScreen(UserStatus userStatus) async {
    String? link = await getInitialLink();

    if (link != null) {
      return DeeplinkService.getScreen(link);
    }

    switch (userStatus) {
      case UserStatus.unauthenticated:
        return const LaunchPage();
      case UserStatus.emailNotVerified:
        return const OtpPage();
      case UserStatus.authenticated:
        return const DashboardPage();
      default:
        return Container();
    }
  }
}
