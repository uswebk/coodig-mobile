import 'dart:convert';

import 'package:coodig_mobile/core/datetime.dart';
import 'package:coodig_mobile/core/environment.dart';
import 'package:coodig_mobile/feature/password_reset/password_reset_page.dart';
import 'package:coodig_mobile/feature/splash/splash_screen.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

final deeplinkServiceProvider =
    Provider<DeeplinkService>((ref) => DeeplinkService(ref.watch(environmentProvider), ref.watch(dateTimeProvider)));

class DeeplinkService {
  DeeplinkService(this._environment, this._dateTime);

  final Environment _environment;
  final DateTimeCore _dateTime;

  Future<String?> getLink() async {
    return await getInitialLink();
  }

  void initDeeplink() {
    linkStream.listen((String? link) {
      if (link != null && link.isNotEmpty) {
        Widget screen = getScreen(link);
        Get.offAll<dynamic>(screen);
      }
    }, onError: (dynamic err) {
      debugPrint('Error listening to links: $err');
    });
  }

  Widget getScreen(String link) {
    Uri uri = Uri.parse(link);

    switch (uri.host) {
      case 'reset-password':
        return PasswordResetPage(link: link);
      default:
        return const SplashScreen();
    }
  }

  bool verifySignedUri(String uri) {
    final segment = uri.split(':');
    final expireTime = double.parse(segment[2]);
    final now = _dateTime.now().millisecondsSinceEpoch / 1000;

    if (now > expireTime) {
      return false;
    }

    String link = '${segment[0]}:${segment[1]}';
    String signedUrl = '$link:$expireTime';
    Hmac hmacSha256 = Hmac(sha256, utf8.encode(_environment.getUriSecretKey()));
    Digest digest = hmacSha256.convert(utf8.encode(signedUrl));

    return digest.toString() == segment[3].toString();
  }
}
