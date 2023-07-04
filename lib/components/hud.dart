import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Hud extends HookWidget {
  final bool isLoading;
  final Widget child;

  const Hud({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      if (isLoading)
        const Opacity(
          opacity: 0.7,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
      if (isLoading)
        Center(
          child: (Platform.isIOS)
              ? const CupertinoActivityIndicator(
                  color: Colors.blue,
                )
              : const CircularProgressIndicator(),
        ),
    ]);
  }
}
