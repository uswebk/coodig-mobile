import 'package:coodig_mobile/exception/api_exception.dart';
import 'package:coodig_mobile/provider/forget_password_provider.dart';
import 'package:coodig_mobile/view/launch/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widget/snackbar.dart';

class ForgetPasswordScreen extends ConsumerWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.to(const LaunchScreen());
          },
        ),
        backgroundColor: Colors.orangeAccent,
        title: const Text('Forget Password'),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Enter your email address and we\'ll send you a link to reset your password.',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Form(
                        key: formKey,
                        child: Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            final errors = ref
                                .watch(forgetPasswordStateProvider)
                                .errorMessages;
                            return Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: const Icon(Icons.email),
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.1),
                                    border: const OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.2)),
                                    ),
                                    errorText: errors['email'],
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();

                                        String email = emailController.text;

                                        ref
                                            .read(
                                                forgetPasswordIsLoadingProvider
                                                    .notifier)
                                            .state = true;

                                        try {
                                          await ref
                                              .read(forgetPasswordStateProvider
                                                  .notifier)
                                              .sendResetPassword(email);
                                          Future.delayed(Duration.zero, () {
                                            Snackbar.showSuccess(context,
                                                'Sent Reset Password Link');
                                          });
                                          emailController.clear();
                                        } on ApiException catch (e) {
                                          ref
                                              .read(forgetPasswordStateProvider
                                                  .notifier)
                                              .setMessage(e.errors);
                                        } catch (e) {
                                          Snackbar.showError(
                                              context, e.toString());
                                        }
                                        ref
                                            .read(
                                                forgetPasswordIsLoadingProvider
                                                    .notifier)
                                            .state = false;
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orangeAccent,
                                    ),
                                    child: const Text('Send Email'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 100,
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
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              bool isLoading = ref.watch(forgetPasswordIsLoadingProvider);
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
