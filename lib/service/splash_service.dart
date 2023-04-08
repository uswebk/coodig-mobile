import 'package:flutter/widgets.dart';
import 'package:uni_links/uni_links.dart';

import '../view/dashboard/dashboard_screen.dart';
import '../view/launch/launch_screen.dart';
import '../view/otp/otp_screen.dart';
import '../view/password_reset/password_reset_screen.dart';

class SplashService {
  Future<Widget> getScreen(bool isEmailVerified, bool hasAccount) async {
    String? initialLink = await getInitialLink();

    if (initialLink != null) {
      return getScreenByDeeplink(initialLink);
    }

    if (isEmailVerified) {
      return const DashboardScreen();
    }

    if (hasAccount) {
      return const OtpScreen();
    }

    return const LaunchScreen();
  }

  Widget getScreenByDeeplink(String link) {
    Uri uri = Uri.parse(link);
    Widget screen;

    switch (uri.host) {
      case 'reset-password':
        screen = PasswordResetScreen(link);
        break;

      default:
        screen = const LaunchScreen();
    }
    return screen;
  }
}
