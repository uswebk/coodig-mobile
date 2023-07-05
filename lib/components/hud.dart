import 'package:coodig_mobile/components/indicator/loading_indicator.dart';
import 'package:flutter/material.dart';

class Hud extends StatelessWidget {
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
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: Colors.black87),
        ),
      if (isLoading) const Center(child: LoadingIndicator())
    ]);
  }
}
