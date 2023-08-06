import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChoiceItem extends HookConsumerWidget {
  const ChoiceItem({
    super.key,
    this.cardColor,
    required this.cardBorderColor,
    required this.cardBorderWidth,
    this.trailing,
    required this.sentence,
    required this.sentenceColor,
    required this.sentenceWeight,
  });

  final Color? cardColor;
  final Color cardBorderColor;
  final double cardBorderWidth;
  final Icon? trailing;
  final String sentence;
  final Color sentenceColor;
  final FontWeight sentenceWeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1),
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: cardBorderColor,
            width: cardBorderWidth,
          ),
        ),
        child: ListTile(
          trailing: trailing,
          title: Text(
            sentence,
            style: TextStyle(
              color: sentenceColor,
              fontWeight: sentenceWeight,
            ),
          ),
        ),
      ),
    );
  }
}
