import 'package:coodig_mobile/components/form/email_text_field.dart';
import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/exception/api_validation_exception.dart';
import 'package:coodig_mobile/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ForgetPasswordSheet extends HookConsumerWidget {
  final TextEditingController emailController;

  const ForgetPasswordSheet({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);
    double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    final isLoading = useState(false);
    final errors = useState<Map<String, String>?>(null);
    final isMounted = useIsMounted();

    return SizedBox(
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
                          child: Column(
                            children: [
                              EmailTextField(emailController, errors.value?['email']),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String email = emailController.text;

                                    isLoading.value = true;
                                    try {
                                      await authService.sendResetPassword(email);
                                      Future.delayed(Duration.zero, () {
                                        Snackbar.showSuccess(context, 'Sent Reset Password Link');
                                        Navigator.pop(context);
                                      });
                                      emailController.clear();
                                    } on ApiValidationException catch (e) {
                                      errors.value = e.toMap();
                                    } catch (e) {
                                      Snackbar.showError(context, e.toString());
                                    } finally {}
                                    if (isMounted()) isLoading.value = false;
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CoodigColors.buttonPrimary,
                                  ),
                                  child: const Text('Send Email'),
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
          ModalProgressHUD(
            inAsyncCall: isLoading.value,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
