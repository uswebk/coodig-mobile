import 'package:coodig_mobile/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(userNotifierProvider);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Dashboard'),
              Text('${state.name} (${state.email})'),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      // Todo: Reset Token & push LoginScreen
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    child: const Text('Logout')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
