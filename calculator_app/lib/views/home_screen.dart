import 'package:calculator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildMenuCard(
    String title,
    IconData icon,
    VoidCallback onTap){
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
            color: Colors.orange.shade200,
            blurRadius: 8,
            offset: Offset(2, 4),
          )
          ],
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white,
          size: 40),
          SizedBox(height: 12),
          Text(title, textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(title: Text('Calculator Menu', style: TextStyle(color: Colors.white)),
      backgroundColor: kPrimaryColor,
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: GridView.count(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16,
      children: [
        buildMenuCard('Basic Calculator', 
        Icons.calculate_outlined, 
        ()=> Get.toNamed('/basic')),
        buildMenuCard(
          'EMI calculator', 
          Icons.calculate, 
          ()=> Get.toNamed('/emi')),
      ],
      ),
      ),
      );

  }
}