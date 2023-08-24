import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final Text title;
  final SingleChildScrollView description;
  final Text okText;
  final Text ngText;

  const ConfirmationDialog({
    Key? key,
    required this.title,
    required this.description,
    required this.okText,
    required this.ngText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoAlertDialog(title: title, content: description, actions: <Widget>[
            TextButton(child: ngText, onPressed: () => Navigator.of(context).pop(false)),
            TextButton(child: okText, onPressed: () => Navigator.of(context).pop(true)),
          ])
        : AlertDialog(title: title, content: description, actions: <Widget>[
            TextButton(child: ngText, onPressed: () => Navigator.of(context).pop(false)),
            TextButton(child: okText, onPressed: () => Navigator.of(context).pop(true)),
          ]);
  }
}
