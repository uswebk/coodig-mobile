import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicListTile extends StatelessWidget {
  const BasicListTile({super.key, this.leading, required this.title, this.subtitle, this.onTap});

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS)
        ? CupertinoListTile(leading: leading, title: title, subtitle: subtitle, onTap: onTap)
        : ListTile(leading: leading, title: title, subtitle: subtitle, onTap: onTap);
  }
}
