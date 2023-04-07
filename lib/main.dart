import 'package:coodig_mobile/view/dashboard/dashboard_screen.dart';
import 'package:coodig_mobile/view/login/login_screen.dart';
import 'package:coodig_mobile/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coodig',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        textTheme: const TextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ),
      ),
      onGenerateRoute: (settings) {
        return null;
      },
      onGenerateInitialRoutes: (initialRoute) {
        Widget screen;

        if (initialRoute != '/') {
          screen = LoginScreen();
        } else {
          screen = const SplashScreen();
        }

        return [
          MaterialPageRoute(
            builder: (context) {
              initUniLinks(context);
              return screen;
            },
          ),
        ];
      },
    );
  }
}

void initUniLinks(BuildContext context) {
  linkStream.listen((String? link) {
    if (link != null && link.isNotEmpty) {
      Get.to(const DashboardScreen());
    }
  }, onError: (err) {
    print("Error listening to links: $err");
  });
}
