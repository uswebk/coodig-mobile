import 'package:coodig_mobile/components/button/fill_button.dart';
import 'package:coodig_mobile/config/color.dart';
import 'package:coodig_mobile/feature/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteMessage extends StatelessWidget {
  const CompleteMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Column(
            children: const [
              Icon(Icons.check_circle, size: 44, color: CoodigColors.primary),
              SizedBox(height: 20),
              Text('Congratulations 🎉\nCompleted all quizzes',
                  style: TextStyle(fontSize: 22, color: Colors.blueGrey, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: SizedBox(
                      child: FillButton(
                        onPressed: () async => Get.offAll<dynamic>(() => const HomePage()),
                        text: 'Dashboard',
                        color: CoodigColors.buttonPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
