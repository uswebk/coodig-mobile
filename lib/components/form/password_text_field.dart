import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordTextField extends HookConsumerWidget {
  const PasswordTextField(this._controller, this._error, {super.key});

  final TextEditingController _controller;
  final String? _error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure = useState(true);

    return TextFormField(
      controller: _controller,
      obscureText: isObscure.value,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(fontSize: 14),
        prefixIcon: const Icon(Icons.lock, size: 22),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        errorText: _error,
        suffixIcon: IconButton(
          icon: Icon(
            isObscure.value ? Icons.visibility_off : Icons.visibility,
            size: 22,
          ),
          onPressed: () => isObscure.value = !isObscure.value,
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
    );
  }
}
