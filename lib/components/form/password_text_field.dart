import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(this._controller, this._error, {super.key});

  final TextEditingController _controller;
  final String? _error;

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: const TextStyle(
          fontSize: 16,
        ),
        prefixIcon: const Icon(
          Icons.lock,
          size: 22,
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        errorText: widget._error,
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
            size: 22,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
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
    );
  }
}
