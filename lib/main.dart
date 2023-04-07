import 'package:coodig_mobile/view/login/login_screen.dart';
import 'package:coodig_mobile/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      title: 'Coodig',
      theme: ThemeData(
        primaryColor: Colors.orangeAccent,
        textTheme: const TextTheme(),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ),
      ),
      // home: const SplashScreen(),
      onGenerateRoute: (settings) {
        if (settings.name!.startsWith('/login')) {
          return MaterialPageRoute(
            builder: (context) => LoginScreen(),
          );
        }
        return null;
      },
      onGenerateInitialRoutes: (initialRoute) {
        return [
          MaterialPageRoute(
            builder: (context) {
              initUniLinks(context);
              return const SplashScreen();
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
      Navigator.of(context).pushNamed(link);
    }
  }, onError: (err) {
    print("Error listening to links: $err");
  });
}
