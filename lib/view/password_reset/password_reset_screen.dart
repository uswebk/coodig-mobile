import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:coodig_mobile/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PasswordResetScreen extends ConsumerWidget {
  PasswordResetScreen(this.link, {super.key});
  String link;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.to(const SplashScreen());
          },
        ),
        backgroundColor: Colors.orangeAccent,
        title: const Text('Password Reset'),
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DeeplinkService().verifySignedUri(link)
              ? Center(child: Text(link))
              : Center(),
        ],
      ),
    );
  }
}
