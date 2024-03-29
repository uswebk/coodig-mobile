import 'package:coodig_mobile/config/app_theme.dart';
import 'package:coodig_mobile/core/analytics.dart';
import 'package:coodig_mobile/core/firebase.dart';
import 'package:coodig_mobile/feature/splash/splash_screen.dart';
import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:coodig_mobile/service/environment_service.dart';
import 'package:coodig_mobile/service/secure_storage_service.dart';
import 'package:coodig_mobile/service/shared_preference_service.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvironmentService.setFlavor();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deeplinkService = ref.watch(deeplinkServiceProvider);
    final observer = useState<List<FirebaseAnalyticsObserver>>([]);

    useEffect(() {
      // Reset secure storage on first startup
      void f() async {
        final sharedPreferenceService = await ref.watch(sharedPreferenceServiceProvider);
        final secureStorageService = ref.watch(secureStorageServiceProvider);

        if (sharedPreferenceService.isFirstTime()) {
          await secureStorageService.deleteAll();
          sharedPreferenceService.setIsFirstTime(false);
        }

        final firebaseCore = ref.watch(firebaseCoreProvider);
        await firebaseCore.initialize();
        observer.value = ref.watch(analyticsObserver);
      }

      f();
      return null;
    }, []);

    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Coodig',
      theme: appTheme(),
      onGenerateRoute: (settings) {
        return null;
      },
      navigatorObservers: observer.value,
      initialRoute: "/",
      onGenerateInitialRoutes: (initialRoute) {
        return [
          MaterialPageRoute<dynamic>(
            builder: (context) {
              deeplinkService.initDeeplink();
              return const SplashScreen();
            },
          ),
        ];
      },
    );
  }
}
