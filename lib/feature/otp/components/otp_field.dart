import 'package:coodig_mobile/feature/otp/otp_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpField extends ConsumerWidget {
  const OtpField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllers = ref.watch(otpStateNotifierProvider).controllers;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...List.generate(
          controllers.length,
          (index) => Expanded(
            flex: 1,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: TextFormField(
                  controller: controllers[index],
                  autofocus: true,
                  onChanged: (value) {
                    ref.read(otpStateNotifierProvider.notifier).update();
                    if (index != controllers.length) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
                    filled: true,
                    fillColor: Colors.white54,
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
