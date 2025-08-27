import 'package:calculator_app/binding/calculator_binding.dart';
import 'package:calculator_app/views/basic_calculator_screen.dart';
import 'package:calculator_app/views/basic_emi.dart';
import 'package:calculator_app/views/emi_calculator_screen.dart';
import 'package:calculator_app/views/home_screen.dart';
import 'package:get/get.dart';

final routes = [
  GetPage(name: '/', 
  page: () => HomeScreen(),
  transition: Transition.rightToLeft),
  GetPage(name: '/basic', 
  page: () => BasicCalculatorScreen(),
  binding: CalculatorBinding(),
  transition: Transition.rightToLeft),
  GetPage(name: '/emi', 
  page: () => EmiDashboard(),
  binding: CalculatorBinding(),
  transition: Transition.rightToLeft),
  GetPage(name: '/advancedEmi', 
  page: () => AdvancedEmiCalculatorScreen(),
  binding: CalculatorBinding(),
  transition: Transition.rightToLeft),
];
