import 'dart:io';

import 'package:coodig_mobile/config/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? const CupertinoActivityIndicator(color: CoodigColors.iosLoading)
        : const CircularProgressIndicator(color: CoodigColors.androidLoading);
  }
}
