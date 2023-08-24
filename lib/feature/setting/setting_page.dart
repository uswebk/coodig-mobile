import 'package:coodig_mobile/components/dialog.dart';
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
    final environment = ref.watch(environmentProvider);
    final user = ref.watch(authStateNotifierProvider);
    final isLoading = useState(false);
    final version = useState('');

    useEffect(() {
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
                        Text('${user?.name}'),
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
                        Text('${user?.email}'),
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
                    dense: true,
                    leading: const Icon(Icons.perm_device_info, color: CoodigColors.grey),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('Version', style: TextStyle(color: CoodigColors.grey)),
                        Text(version.value, style: const TextStyle(color: CoodigColors.grey)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
                    color: Colors.white,
                  ),
                  child: ListTile(
                      leading: const Icon(Icons.logout, color: CoodigColors.error),
                      title: const Text('Sign out', style: TextStyle(color: CoodigColors.error)),
                      onTap: () async {
                        final result = await showDialog<bool>(
                          context: context,
                          builder: (BuildContext context) {
                            return ConfirmationDialog(
                              title: const Text('Sign out'),
                              description: SingleChildScrollView(
                                child: ListBody(
                                  children: const <Widget>[
                                    Text('Are you sure you want to sign out?'),
                                  ],
                                ),
                              ),
                              okText: const Text('OK'),
                              ngText: const Text('Cancel'),
                            );
                          },
                        );
                        if (result != null && result) {
                          isLoading.value = true;
                          await ref.read(authStateNotifierProvider.notifier).logout();
                          isLoading.value = false;
                          Get.offAll<dynamic>(() => const SplashScreen());
                        }
                      }),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
