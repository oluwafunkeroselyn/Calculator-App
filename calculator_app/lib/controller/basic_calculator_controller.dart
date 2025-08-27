import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class BasicCalculatorController extends GetxController {
  var input1 = ''.obs;
  var input2 = ''.obs;
  var operator = ''.obs;
  var expression = ''.obs;
  var result = '0'.obs;

void onButtonPressed(String value) {
  if (value == 'C') {
    expression.value = '';
    result.value = '0';
  } else if (value == '⌫') {
    if (expression.value.isNotEmpty) {
      expression.value =
          expression.value.substring(0, expression.value.length - 1);
    }
  } else if (value == '=') {
    try {
      if (expression.value.trim().isEmpty) {
        result.value = '0';
        return;
      }

      Parser parser = Parser();
      Expression exp = parser.parse(
        expression.value.replaceAll('x', '*').replaceAll('÷', '/'),
      );
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      // Update the screen
      result.value = eval.toStringAsFixed(2);

      // Show snackbar
      Get.snackbar(
        'Result',
        'The answer is ${result.value}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.black,
        duration: const Duration(seconds: 2),
      );

    } catch (_) {
      result.value = 'Error';
      Get.snackbar(
        'Result',
        'Invalid Expression',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.red,
        duration: const Duration(seconds: 2),
      );
    }
  } else {
    expression.value += value;
  }
}
  // Optional manual calculation (if using input fields)
  void calculate() {
    if (input1.isEmpty || input2.isEmpty || operator.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      return;
    }
    double num1 = double.parse(input1.value);
    double num2 = double.parse(input2.value);
    double ans = 0;

    switch (operator.value) {
      case '+':
        ans = num1 + num2;
        break;
      case '-':
        ans = num1 - num2;
        break;
      case 'x':
        ans = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          Get.snackbar('Error', 'Cannot divide by zero');
          return;
        }
        ans = num1 / num2;
        break;
    }
    result.value = ans.toStringAsFixed(2);
    Get.snackbar('Result', 'The answer is ${result.value}');
  }
}
