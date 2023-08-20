import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final ButtonStyle? buttonStyle;
  final Color color;
  final TextStyle textStyle;
  final Future<void> Function()? onPressed;

  const SecondaryButton({
    Key? key,
    required this.text,
    this.buttonStyle,
    required this.color,
    this.textStyle = const TextStyle(color: Colors.black87, fontSize: 14),
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoButton(color: color, onPressed: onPressed, child: Text(text, style: textStyle))
        : TextButton(onPressed: onPressed, style: buttonStyle, child: Text(text, style: textStyle));
  }
}
