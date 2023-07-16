import 'package:coodig_mobile/components/form/email_text_field.dart';
import 'package:coodig_mobile/components/form/name_text_field.dart';
import 'package:coodig_mobile/components/form/password_confirm_text_field.dart';
import 'package:coodig_mobile/components/form/password_text_field.dart';
import 'package:coodig_mobile/components/snackbar.dart';
import 'package:coodig_mobile/exception/api_validation_exception.dart';
import 'package:coodig_mobile/feature/signup/state/signup_state_notifier.dart';
import 'package:coodig_mobile/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupForm extends HookConsumerWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errors = useState<Map<String, String>?>(null);
    final notifier = ref.read(signupStateNotifierProvider.notifier);

    final formKey = GlobalKey<FormState>();
    final TextEditingController nameController = useTextEditingController();
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();
    final TextEditingController confirmPasswordController = useTextEditingController();

    return Form(
      key: formKey,
      child: Center(
        child: Column(
          children: [
            NameTextField(nameController, errors.value?['name']),
            const SizedBox(height: 10),
            EmailTextField(emailController, errors.value?['email']),
            const SizedBox(height: 10),
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
                      String name = nameController.text;
                      String email = emailController.text;
                      String password = passwordController.text;
                      String confirmPassword = confirmPasswordController.text;
                      notifier.setLoading(true);
                      await Future<dynamic>.delayed(const Duration(seconds: 1));
                      try {
                        await ref
                            .read(authStateNotifierProvider.notifier)
                            .signup(name, email, password, confirmPassword);
                        Future.delayed(Duration.zero, () {
                          Snackbar.showSuccess(context, 'Otp sent to your email address');
                        });
                      } on ApiValidationException catch (e) {
                        errors.value = e.toMap();
                      } catch (e) {
                        Future.delayed(Duration.zero, () {
                          Snackbar.showError(context, e.toString());
                        });
                      } finally {
                        notifier.setLoading(false);
                      }
                    }
                  },
                  child: const Text('Sign up')),
            ),
          ],
        ),
      ),
    );
  }
}
