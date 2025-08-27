import 'package:calculator_app/utils/constants.dart';
import 'package:calculator_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: Colors.white, 
     ),
     initialRoute: '/',
     getPages: routes,
         );
  }
}
