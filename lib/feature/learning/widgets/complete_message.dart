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
              Icon(Icons.done_all_outlined, size: 42, color: CoodigColors.primary),
              SizedBox(height: 20),
              Text('Congratulations 🎉\nCompleted all quizzes',
                  style: TextStyle(fontSize: 24, color: Colors.blueGrey), textAlign: TextAlign.center),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 60,
                    child: SizedBox(
                      child: ElevatedButton(
                          onPressed: () {
                            Get.offAll<dynamic>(const HomePage());
                          },
                          child: const Text('Dashboard')),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
