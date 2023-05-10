import 'dart:convert';

import 'package:coodig_mobile/provider/password_reset_provider.dart';
import 'package:coodig_mobile/view/splash/splash_screen.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

import '../view/password_reset/password_reset_screen.dart';

class DeeplinkService {
  void initDeeplink(WidgetRef ref) {
    linkStream.listen((String? link) {
      if (link != null && link.isNotEmpty) {
        handleDeeplink(link, ref);
      }
    }, onError: (err) {
      print("Error listening to links: $err");
    });
  }

  void handleDeeplink(String link, WidgetRef ref) {
    Uri uri = Uri.parse(link);

    switch (uri.host) {
      case 'reset-password':
        ref.read(resetPasswordLinkProvider.notifier).state = link;
        Get.offAll(const PasswordResetScreen());
        break;

      default:
        Get.off(const SplashScreen());
    }
  }

  bool verifySignedUri(String uri) {
    final segment = uri.split(':');
    final expireTime = double.parse(segment[2]);
    final now = DateTime.now().millisecondsSinceEpoch / 1000;

    if (now > expireTime) {
      return false;
    }

    String link = '${segment[0]}:${segment[1]}';
    String signedUrl = '$link:$expireTime';

    Hmac hmacSha256 =
        Hmac(sha256, utf8.encode(dotenv.env['URI_SECRET_KEY'].toString()));
    Digest digest = hmacSha256.convert(utf8.encode(signedUrl));

    return digest.toString() == segment[3].toString();
  }
}
