import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingButton extends HookConsumerWidget {
  const FloatingButton(this._text, this._icon, this._onPressed, {super.key});

  final String _text;
  final IconData _icon;
  final Future<void> Function()? _onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isProcessing = useState(false);
    final isMounted = useIsMounted();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: isProcessing.value || _onPressed == null
                ? null
                : () async {
                    if (isProcessing.value) {
                      return;
                    }
                    isProcessing.value = true;
                    try {
                      await _onPressed?.call();
                    } catch (error) {
                      rethrow;
                    } finally {
                      if (isMounted()) isProcessing.value = false;
                    }
                  },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 5),
                  Icon(_icon, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
