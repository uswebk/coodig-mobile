import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProcessingButton extends StatelessWidget {
  final String text;
  final ButtonStyle? buttonStyle;
  final Color color;
  final TextStyle textStyle;
  final bool isProcessing;
  final Future<void> Function()? onPressed;

  const ProcessingButton({
    Key? key,
    required this.text,
    this.buttonStyle,
    required this.color,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 14),
    this.onPressed,
    required this.isProcessing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoButton(
            color: color,
            onPressed: onPressed,
            child: isProcessing
                ? const SizedBox(width: 10, height: 10, child: CupertinoActivityIndicator())
                : Text(text, style: textStyle),
          )
        : ElevatedButton(
            style: buttonStyle,
            onPressed: onPressed,
            child: isProcessing
                ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 3))
                : Text(text, style: textStyle),
          );
  }
}
