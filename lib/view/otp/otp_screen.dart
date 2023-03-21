import 'package:coodig_mobile/provider/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../provider/auth_provider.dart';
import '../dashboard/dashboard_screen.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authNotifierProvider);
    final state = ref.watch(otpStateProvider);
    final controllers = state.controllers;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool isAuthenticated = ref.watch(isEmailVerifiedProvider);
      if (isAuthenticated) {
        Get.off(const DashboardScreen());
      }
    });

    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text('Otp Verify'),
          elevation: 0,
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
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
                              child: Column(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: 'An otp code has been sent to ',
                                          style: TextStyle(
                                              fontSize: 11, color: Colors.grey),
                                        ),
                                        TextSpan(
                                          text: '${user!.email}\n',
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        const WidgetSpan(
                                          child: SizedBox(height: 20),
                                        ),
                                        const TextSpan(
                                          text:
                                              'Please check the code in the email and enter it.\nThe validity period is 10 minutes after the email is sent.',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    // Resend Otp
                                    // Snackbar
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text(
                                        'Resend Otp ',
                                        style: TextStyle(
                                          fontSize: 13,
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
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: (state.errorMessage != '')
                            ? Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(4.0),
                                  border:
                                      Border.all(color: Colors.red.shade100),
                                ),
                                child: Text(
                                  state.errorMessage,
                                  style: TextStyle(color: Colors.red.shade300),
                                ),
                              )
                            : Container(
                                padding: const EdgeInsets.all(10),
                              ),
                      ),
                      const SizedBox(
                        height: 20,
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
                                          color: Colors.black, fontSize: 20.0),
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
                          onPressed: state.isButtonEnabled
                              ? () async {
                                  ref
                                      .read(otpStateProvider.notifier)
                                      .setLoading(true);
                                  bool result = await ref
                                      .read(otpStateProvider.notifier)
                                      .send();
                                  if (result) {
                                    await ref
                                        .read(authNotifierProvider.notifier)
                                        .fetchMe();
                                  }
                                  ref
                                      .read(otpStateProvider.notifier)
                                      .setLoading(false);
                                }
                              : null,
                          child: const Text('Verify'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
      ModalProgressHUD(
        inAsyncCall: state.isLoading,
        child: Container(),
      ),
    ]);
  }
}
