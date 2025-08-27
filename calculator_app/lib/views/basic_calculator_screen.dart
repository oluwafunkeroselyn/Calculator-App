import 'package:calculator_app/controller/basic_calculator_controller.dart';
import 'package:calculator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicCalculatorScreen extends StatelessWidget {
  const BasicCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BasicCalculatorController());

    final buttons = [
      'C', '%', '⌫', '÷',
      '7', '8', '9', 'x',
      '4', '5', '6', '-',
      '1', '2', '3', '+',
      'HOME', '.', '0', '=',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Basic Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Expression
            Obx(() => Text(
                  controller.expression.value,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )),
            const SizedBox(height: 10),
            // Result
            Obx(() => Text(
                  controller.result.value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                )),
            const SizedBox(height: 20),
            // Buttons
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  final btnText = buttons[index];

                  // Show icon only for HOME button
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          btnText == '=' ? Colors.deepOrange : kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      if (btnText == 'HOME') {
                        Get.offAllNamed('/'); // ⬅ back to HomeScreen
                      } else {
                        controller.onButtonPressed(btnText);
                      }
                    },
                    child: btnText == 'HOME'
                        ? const Icon(Icons.home, color: Colors.white, size: 28)
                        : Text(
                            btnText,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
