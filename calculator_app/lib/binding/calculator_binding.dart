import 'package:calculator_app/controller/basic_calculator_controller.dart';
import 'package:calculator_app/controller/emi_calculator_controller.dart';
import 'package:get/get.dart';
class CalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BasicCalculatorController());
    Get.lazyPut(() => EmiCalculatorController());
  }
}
