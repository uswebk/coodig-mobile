import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChoiceItem extends HookConsumerWidget {
  const ChoiceItem(
    this._cardColor,
    this._cardBorderColor,
    this._cardBorderWidth,
    this._trailing,
    this._sentence,
    this._sentenceColor,
    this._sentenceWeight, {
    super.key,
  });

  final Color? _cardColor;
  final Color _cardBorderColor;
  final double _cardBorderWidth;
  final Icon? _trailing;
  final String _sentence;
  final Color _sentenceColor;
  final FontWeight _sentenceWeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
      child: Card(
        color: _cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: _cardBorderColor,
            width: _cardBorderWidth,
          ),
        ),
        child: ListTile(
          trailing: _trailing,
          title: Text(
            _sentence,
            style: TextStyle(
              color: _sentenceColor,
              fontWeight: _sentenceWeight,
            ),
          ),
        ),
      ),
    );
  }
}
