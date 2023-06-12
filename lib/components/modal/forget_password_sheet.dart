import 'package:coodig_mobile/components/form/email_text_field.dart';
import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:coodig_mobile/feature/login/forget_password_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

void showResetPasswordModalBottomSheet(BuildContext context, WidgetRef ref, TextEditingController emailController) {
  final notifier = ref.read(forgetPasswordStateNotifierProvider.notifier);
  double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

  showModalBottomSheet<dynamic>(
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30.0))),
    isScrollControlled: true,
    context: context,
    builder: (context) => SizedBox(
      height: keyboardHeight + 300,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          'Enter your email address',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Form(
                          child: Consumer(
                            builder: (BuildContext context, WidgetRef ref, Widget? child) {
                              final state = ref.watch(forgetPasswordStateNotifierProvider);
                              return Column(
                                children: [
                                  EmailTextField(emailController, state.errors['email']),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        String email = emailController.text;
                                        notifier.setLoading(true);
                                        try {
                                          await notifier.sendResetPassword(email);
                                          Future.delayed(Duration.zero, () {
                                            Snackbar.showSuccess(context, 'Sent Reset Password Link');
                                            Navigator.pop(context);
                                          });
                                          emailController.clear();
                                        } on ApiException catch (e) {
                                          notifier.setMessage(e.errors);
                                        } catch (e) {
                                          Snackbar.showError(context, e.toString());
                                        } finally {
                                          notifier.setLoading(false);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: CoodigColors.buttonPrimary,
                                      ),
                                      child: const Text('Send Email'),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              bool isLoading = ref.watch(forgetPasswordStateNotifierProvider).isLoading;
              return ModalProgressHUD(
                inAsyncCall: isLoading,
                child: Container(),
              );
            },
          ),
        ],
      ),
    ),
  );
}
