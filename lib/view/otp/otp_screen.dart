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
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                            border: Border.all(color: Colors.red.shade100),
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
                      (index) => SizedBox(
                        height: 60,
                        width: 50,
                        child: TextFormField(
                          controller: controllers[index],
                          autofocus: true,
                          onChanged: (value) {
                            ref.watch(otpStateProvider.notifier).update();
                            FocusScope.of(context).nextFocus();
                          },
                          decoration: const InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                            filled: true,
                            fillColor: Colors.white54,
                          ),
                          style: Theme.of(context).textTheme.headline6,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
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
      ),
      ModalProgressHUD(
        inAsyncCall: state.isLoading,
        child: Container(),
      ),
    ]);
  }
}
