import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Explanation extends ConsumerWidget {
  const Explanation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, Widget? child) {
                  final email = ref.watch(authStateNotifierProvider)?.email ?? '';
                  return Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '📩An otp code has been sent to ',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 15),
                            ),
                            TextSpan(
                              text: '$email\n',
                              style: TextStyle(
                                fontSize: 11,
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).textTheme.bodyMedium!.color,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(height: 15),
                            ),
                            const TextSpan(
                              text: '️✅Please check the code in the email and enter it.\n'
                                  '⏱️The validity period is 10 minutes after the email is sent.',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
