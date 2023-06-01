import 'package:coodig_mobile/components/form/email_text_field.dart';
import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:coodig_mobile/feature/password_reset/forget_password_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordSheet extends ConsumerWidget {
  const ForgetPasswordSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

    final notifier = ref.read(forgetPasswordStateNotifierProvider.notifier);

    return SizedBox(
      height: 500,
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
                          'Enter your email address and we\'ll send you a link to reset your password.',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Form(
                          key: formKey,
                          child: Consumer(
                            builder: (BuildContext context, WidgetRef ref,
                                Widget? child) {
                              final state = ref
                                  .watch(forgetPasswordStateNotifierProvider);
                              return Column(
                                children: [
                                  EmailTextField(
                                      emailController, state.errors['email']),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();
                                          String email = emailController.text;

                                          notifier.setLoading(true);

                                          try {
                                            await notifier
                                                .sendResetPassword(email);
                                            Future.delayed(Duration.zero, () {
                                              Snackbar.showSuccess(context,
                                                  'Sent Reset Password Link');
                                            });
                                            emailController.clear();
                                          } on ApiException catch (e) {
                                            notifier.setMessage(e.errors);
                                          } catch (e) {
                                            Snackbar.showError(
                                                context, e.toString());
                                          } finally {
                                            notifier.setLoading(false);
                                          }
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            CoodigColors.buttonPrimary,
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
              bool isLoading =
                  ref.watch(forgetPasswordStateNotifierProvider).isLoading;
              return ModalProgressHUD(
                inAsyncCall: isLoading,
                child: Container(),
              );
            },
          ),
        ],
      ),
    );
  }
}
