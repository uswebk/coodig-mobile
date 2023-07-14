import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(this._controller, this._error, {super.key});

  final TextEditingController _controller;
  final String? _error;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: const TextStyle(fontSize: 14),
        prefixIcon: const Icon(Icons.email, size: 22),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        errorText: _error,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }
}
