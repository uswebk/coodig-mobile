import 'package:coodig_mobile/components/form/password_confirm_text_field.dart';
import 'package:coodig_mobile/components/form/password_text_field.dart';
import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/exception/api_validation_exception.dart';
import 'package:coodig_mobile/feature/login/login_page.dart';
import 'package:coodig_mobile/feature/password_reset/state/password_reset_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordResetForm extends HookConsumerWidget {
  final String? link;

  const PasswordResetForm(this.link, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errors = useState<Map<String, String>?>(null);
    final notifier = ref.read(passwordResetStateNotifierProvider.notifier);

    final formKey = GlobalKey<FormState>();
    final TextEditingController passwordController = useTextEditingController();
    final TextEditingController confirmPasswordController = useTextEditingController();

    return Form(
      key: formKey,
      child: Column(
        children: [
          PasswordTextField(passwordController, errors.value?['password']),
          const SizedBox(height: 10),
          PasswordConfirmTextField(confirmPasswordController, errors.value?['non_field_errors']),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    String password = passwordController.text;
                    String confirmPassword = confirmPasswordController.text;

                    notifier.setLoading(true);
                    try {
                      await notifier.resetPassword(link.toString(), password, confirmPassword);
                      Future.delayed(Duration.zero, () {
                        Snackbar.showSuccess(context, 'change password success');
                      });
                      Get.to<dynamic>(const LoginPage());
                    } on ApiValidationException catch (e) {
                      errors.value = e.toMap();
                    } catch (e) {
                      Snackbar.showError(context, e.toString());
                    } finally {
                      notifier.setLoading(false);
                    }
                  }
                },
                child: const Text('Change Password')),
          ),
        ],
      ),
    );
  }
}
