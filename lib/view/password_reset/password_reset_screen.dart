import 'package:coodig_mobile/service/deeplink_service.dart';
import 'package:coodig_mobile/view/launch/launch_screen.dart';
import 'package:coodig_mobile/view/password_reset/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../exception/api_exception.dart';
import '../../provider/password_reset_provider.dart';
import '../../widget/snackbar.dart';
import '../login/login_screen.dart';

// ignore: must_be_immutable
class PasswordResetScreen extends ConsumerWidget {
  PasswordResetScreen(this.link, {super.key});
  String link;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(resetPasswordStateProvider.notifier).setMessage({});
    });

    final formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.to(const LaunchScreen());
          },
        ),
        backgroundColor: Colors.orangeAccent,
        title: const Text('Password Reset'),
        elevation: 0,
      ),
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  DeeplinkService().verifySignedUri(link)
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child:
                                      (_getErrorText(context, ref, 'message') !=
                                              null)
                                          ? Container(
                                              padding: const EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.red[50],
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                border: Border.all(
                                                    color: Colors.red.shade100),
                                              ),
                                              child: Text(
                                                _getErrorText(
                                                        context, ref, 'message')
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.red.shade300),
                                              ),
                                            )
                                          : Container(
                                              padding: const EdgeInsets.all(10),
                                            ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      Consumer(
                                        builder: (BuildContext context,
                                            WidgetRef ref, Widget? child) {
                                          final passwordVisible = ref.watch(
                                              resetPasswordPasswordVisibleProvider);
                                          return TextFormField(
                                            controller: passwordController,
                                            obscureText: !passwordVisible,
                                            decoration: InputDecoration(
                                              labelText: 'New Password',
                                              filled: true,
                                              fillColor:
                                                  Colors.grey.withOpacity(0.1),
                                              border:
                                                  const OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey
                                                        .withOpacity(0.2)),
                                              ),
                                              errorText: _getErrorText(
                                                  context, ref, 'password'),
                                              prefixIcon:
                                                  const Icon(Icons.lock),
                                              suffixIcon: IconButton(
                                                icon: Icon(passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  ref
                                                      .read(
                                                          resetPasswordPasswordVisibleProvider
                                                              .notifier)
                                                      .state = !passwordVisible;
                                                },
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter your password';
                                              }
                                              return null;
                                            },
                                            onChanged: (String value) {},
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Consumer(
                                        builder: (BuildContext context,
                                            WidgetRef ref, Widget? child) {
                                          final passwordVisible = ref.watch(
                                              resetPasswordPasswordConfirmVisibleProvider);
                                          return TextFormField(
                                            controller:
                                                confirmPasswordController,
                                            obscureText: !passwordVisible,
                                            decoration: InputDecoration(
                                              labelText: 'Confirm New Password',
                                              filled: true,
                                              fillColor:
                                                  Colors.grey.withOpacity(0.1),
                                              border:
                                                  const OutlineInputBorder(),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey
                                                        .withOpacity(0.2)),
                                              ),
                                              errorText: _getErrorText(context,
                                                  ref, 'non_field_errors'),
                                              prefixIcon:
                                                  const Icon(Icons.lock),
                                              suffixIcon: IconButton(
                                                icon: Icon(passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off),
                                                onPressed: () {
                                                  ref
                                                      .read(
                                                          resetPasswordPasswordConfirmVisibleProvider
                                                              .notifier)
                                                      .state = !passwordVisible;
                                                },
                                              ),
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'Please enter your password';
                                              }

                                              if (value.length <= 6) {
                                                return 'Password must be at least 6 characters';
                                              }
                                              return null;
                                            },
                                            onChanged: (String value) {},
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 48,
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                formKey.currentState!.save();

                                                String password =
                                                    passwordController.text;
                                                String confirmPassword =
                                                    confirmPasswordController
                                                        .text;

                                                ref
                                                    .read(
                                                        resetPasswordIsLoadingProvider
                                                            .notifier)
                                                    .state = true;
                                                try {
                                                  await ref
                                                      .read(
                                                          resetPasswordStateProvider
                                                              .notifier)
                                                      .resetPassword(
                                                          link,
                                                          password,
                                                          confirmPassword);

                                                  Future.delayed(Duration.zero,
                                                      () {
                                                    Snackbar.showSuccess(
                                                        context,
                                                        'change password success');
                                                  });

                                                  Get.to(const LoginScreen());
                                                } on ApiException catch (e) {
                                                  ref
                                                      .read(
                                                          resetPasswordStateProvider
                                                              .notifier)
                                                      .setMessage(e.errors);
                                                } catch (e) {
                                                  Snackbar.showError(
                                                      context, e.toString());
                                                }

                                                ref
                                                    .read(
                                                        resetPasswordIsLoadingProvider
                                                            .notifier)
                                                    .state = false;
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.orangeAccent,
                                            ),
                                            child:
                                                const Text('Change Password')),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Column(
                              children: [
                                const Text('Token is Valid or Expired'),
                                TextButton(
                                  child: const Text('Resend link'),
                                  onPressed: () {
                                    Get.to(const ForgetPasswordScreen());
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            bool isLoading = ref.watch(resetPasswordIsLoadingProvider);
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: Container(),
            );
          },
        )
      ]),
    );
  }

  String? _getErrorText(BuildContext context, WidgetRef ref, String key) {
    final state = ref.watch(resetPasswordStateProvider);
    if (state.errorMessages[key] != null) {
      return state.errorMessages[key].toString();
    }
    return null;
  }
}
