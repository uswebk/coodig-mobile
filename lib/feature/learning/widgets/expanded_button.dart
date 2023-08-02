import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpandedButton extends HookConsumerWidget {
  const ExpandedButton(this._text, this._onPressed, {super.key});

  final String _text;
  final Future<void> Function()? _onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isProcessing = useState(false);
    final isMounted = useIsMounted();
    return Expanded(
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: ElevatedButton(
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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(_text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
