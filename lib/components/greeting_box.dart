import 'package:flutter/material.dart';

class GreetingBox extends StatelessWidget {
  final String? message;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final TextStyle textStyle;

  const GreetingBox({
    Key? key,
    required this.message,
    this.padding = const EdgeInsets.all(10),
    this.backgroundColor = const Color(0xFFFFEBEE),
    this.borderColor = const Color(0xFFFFE5E5),
    this.borderWidth = 1.0,
    this.borderRadius = 4.0,
    this.textStyle = const TextStyle(
      color: Color(0xFFE57373),
      fontWeight: FontWeight.bold,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (message != null)
        ? Container(
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: borderColor),
            ),
            child: Text(
              message.toString(),
              style: textStyle,
            ),
          )
        : Container();
  }
}
