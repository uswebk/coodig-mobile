import 'package:flutter/material.dart';

class NameTextField extends StatelessWidget {
  const NameTextField(this._controller, this._error, {super.key});

  final TextEditingController _controller;
  final String? _error;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: 'Name',
        labelStyle: const TextStyle(
          fontSize: 16,
        ),
        prefixIcon: const Icon(
          Icons.account_box,
          size: 22,
        ),
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
          return 'Please enter your name';
        }
        return null;
      },
    );
  }
}
