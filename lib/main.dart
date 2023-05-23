import 'package:coodig_mobile/feature/splash/splash.dart';
import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:coodig_mobile/service/environment_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

void main() async {
  await EnvironmentService().setting();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
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
        return [
          MaterialPageRoute(
            builder: (context) {
              DeeplinkService().initDeeplink(ref);
              return const Splash();
            },
          ),
        ];
      },
    );
  }
}
