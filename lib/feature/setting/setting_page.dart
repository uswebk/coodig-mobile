import 'package:coodig_mobile/components/hud.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/core/environment.dart';
import 'package:coodig_mobile/feature/splash/splash_screen.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifierProvider);
    final notifier = ref.read(authStateNotifierProvider.notifier);
    final isLoading = useState(false);
    final version = useState('');

    useEffect(() {
      final environment = ref.watch(environmentProvider);
      void f() async {
        version.value = await environment.getVersion();
      }

      f();
      return null;
    }, []);

    return Hud(
      isLoading: isLoading.value,
      child: Scaffold(
        backgroundColor: CoodigColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Name'),
                        Text('${state?.name}'),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.email),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Email'),
                        Text('${state?.email}'),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
                    color: Colors.white,
                  ),
                  child: ListTile(
                      leading: const Icon(Icons.logout, color: CoodigColors.error),
                      title: const Text('Sign out', style: TextStyle(color: CoodigColors.error)),
                      onTap: () async {
                        // Show Dialog

                        isLoading.value = true;
                        await notifier.logout();
                        isLoading.value = false;
                        Get.off<dynamic>(const SplashScreen());
                      }),
                ),
                const Spacer(),
                Container(
                  color: Colors.white,
                  height: 55,
                  child: ListTile(
                    leading: const Icon(Icons.perm_device_info, size: 22),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Version', style: TextStyle(color: CoodigColors.grey, fontSize: 14)),
                        Text(version.value, style: const TextStyle(color: CoodigColors.grey, fontSize: 11)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
