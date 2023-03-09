import 'package:coodig_mobile/provider/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends ConsumerWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(otpStateProvider);
    print(state.otp);
    final controllers = state.controllers;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                    controllers.length,
                    (index) => SizedBox(
                      height: 60,
                      width: 50,
                      child: TextFormField(
                        controller: controllers[index],
                        autofocus: true,
                        onChanged: (value) {
                          ref.watch(otpStateProvider.notifier).update();
                          FocusScope.of(context).nextFocus();
                        },
                        decoration: const InputDecoration(
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 20.0),
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
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: state.isButtonEnabled
                    ? () {
                        ref.read(otpStateProvider.notifier).send();
                      }
                    : null,
                child: const Text('Verify'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
