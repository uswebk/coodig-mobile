import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uni_links/uni_links.dart';

import '../provider/password_reset_provider.dart';
import '../view/dashboard/dashboard_screen.dart';
import '../view/launch/launch_screen.dart';
import '../view/otp/otp_screen.dart';
import '../view/password_reset/password_reset_screen.dart';

class SplashService {
  Future<Widget> getScreen(
      bool isEmailVerified, bool hasAccount, WidgetRef ref) async {
    String? link = await getInitialLink();

    if (link != null) {
      Uri uri = Uri.parse(link);
      Widget screen;

      switch (uri.host) {
        case 'reset-password':
          ref.read(resetPasswordLinkProvider.notifier).state = link;
          screen = const PasswordResetScreen();
          break;

        default:
          screen = const LaunchScreen();
      }
      return screen;
    }

    if (isEmailVerified) {
      return const DashboardScreen();
    }

    if (hasAccount) {
      return const OtpScreen();
    }

    return const LaunchScreen();
  }
}
