import 'package:coodig_mobile/provider/otp_provider.dart';
import 'package:coodig_mobile/provider/otp_timer_provider.dart';
import 'package:coodig_mobile/view/otp/widget/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../provider/auth_provider.dart';
import '../dashboard/dashboard_screen.dart';
import '../launch/launch_screen.dart';

final scaffoldMessengerKeyProvider = GlobalKey<ScaffoldMessengerState>();

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final otpState = ref.watch(otpStateProvider);
    final controllers = otpState.controllers;
    final isLoading = ref.watch(otpLoadingProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isAuthenticated = ref.watch(isEmailVerifiedProvider);
      if (isAuthenticated) {
        Get.off(const DashboardScreen());
      }
    });

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.to(const LaunchScreen());
            },
          ),
          backgroundColor: Colors.orangeAccent,
          title: const Text('Otp Verify'),
          elevation: 0,
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Consumer(
                                builder: (BuildContext context, WidgetRef ref,
                                    Widget? child) {
                                  final email =
                                      ref.watch(authStateProvider)?.email ?? '';
                                  return Column(
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text:
                                                  '📩An otp code has been sent to ',
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
                                                decoration:
                                                    TextDecoration.underline,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .color,
                                              ),
                                            ),
                                            const WidgetSpan(
                                              child: SizedBox(height: 15),
                                            ),
                                            const TextSpan(
                                              text:
                                                  '️✅Please check the code in the email and enter it.\n'
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
                    ),
                    Column(
                      children: [
                        const Timer(),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () async {
                                try {
                                  await ref
                                      .read(otpStateProvider.notifier)
                                      .resendOtp();
                                  ref
                                      .read(otpTimerStateProvider.notifier)
                                      .reset();
                                  ref
                                      .watch(otpErrorMessageProvider.notifier)
                                      .state = '';
                                  Future.delayed(Duration.zero, () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Resent the OTP to your email.'),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  });
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(e.toString()),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Resend Otp ',
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  Icon(
                                    Icons.send,
                                    size: 16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Divider(),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: (ref.watch(otpErrorMessageProvider) != '')
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.red[50],
                                    borderRadius: BorderRadius.circular(4.0),
                                    border:
                                        Border.all(color: Colors.red.shade100),
                                  ),
                                  child: Text(
                                    ref.watch(otpErrorMessageProvider),
                                    style:
                                        TextStyle(color: Colors.red.shade300),
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(10),
                                ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ...List.generate(
                              controllers.length,
                              (index) => Expanded(
                                flex: 1,
                                child: SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: TextFormField(
                                      controller: controllers[index],
                                      autofocus: true,
                                      onChanged: (value) {
                                        ref
                                            .watch(otpStateProvider.notifier)
                                            .update();
                                        if (index != controllers.length) {
                                          FocusScope.of(context).nextFocus();
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0),
                                        filled: true,
                                        fillColor: Colors.white54,
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.center,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(1),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 21),
                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                            onPressed: otpState.isButtonEnabled
                                ? () async {
                                    ref
                                        .read(otpLoadingProvider.notifier)
                                        .state = true;

                                    try {
                                      await ref
                                          .read(otpStateProvider.notifier)
                                          .verify();
                                      await ref
                                          .read(authStateProvider.notifier)
                                          .fetchMe();
                                    } catch (e) {
                                      ref
                                          .read(
                                              otpErrorMessageProvider.notifier)
                                          .state = e.toString();
                                    }

                                    ref
                                        .read(otpLoadingProvider.notifier)
                                        .state = false;
                                  }
                                : null,
                            child: const Text('Verify'),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await ref
                                .read(authStateProvider.notifier)
                                .reregistration();
                            ref.read(otpStateProvider.notifier).reset();
                            Get.off(const LaunchScreen());
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Don\'t remember registering? ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'Reregistration',
                                style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(),
      ),
    ]);
  }
}
