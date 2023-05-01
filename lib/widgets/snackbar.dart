import 'package:flutter/material.dart';

class Snackbar {
  static void showSuccess(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackbar(message, Colors.green),
    );
  }

  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackbar(message, Colors.red),
    );
  }

  static SnackBar _buildSnackbar(String message, Color backgroundColor) {
    return SnackBar(
      content: Text(message),
      backgroundColor: backgroundColor,
    );
  }
}
