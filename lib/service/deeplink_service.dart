import 'package:coodig_mobile/view/splash/splash_screen.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

import '../view/password_reset/password_reset_screen.dart';

class DeeplinkService {
  void initDeeplink() {
    linkStream.listen((String? link) {
      if (link != null && link.isNotEmpty) {
        handleDeeplink(link);
      }
    }, onError: (err) {
      print("Error listening to links: $err");
    });
  }

  void handleDeeplink(String link) {
    Uri uri = Uri.parse(link);

    switch (uri.host) {
      case 'reset-password':
        Get.to(PasswordResetScreen(link));
        break;

      default:
        Get.off(const SplashScreen());
    }
  }
}
