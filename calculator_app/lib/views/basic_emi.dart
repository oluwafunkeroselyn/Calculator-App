import 'package:calculator_app/views/emi_calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiDashboard extends StatelessWidget {
  const EmiDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EMI CALCULATOR"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // EMI Loan Calculator Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "EMI Loan Calculator",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed('/advancedEmi');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                    ),
                    child: const Text("Start Now"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Loan Calculator Section
            const Text(
              "Loan Calculator",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _buildCard("Advanced EMI\nCalculator", Icons.calculate, Colors.orange, () {
                  Get.to(() => const AdvancedEmiCalculatorScreen());
                }),
                _buildCard("Compare Loan", Icons.balance, Colors.blue, () {}),
                _buildCard("Interest Loan", Icons.show_chart, Colors.purple, () {}),
                _buildCard("Loan Tenure\nCalculator", Icons.access_time, Colors.teal, () {}),
                _buildCard("Loan Amount", Icons.money, Colors.green, () {}),
              ],
            ),
            const SizedBox(height: 24),

            // Loan Profile Calculator
            const Text(
              "Loan Profile Calculator",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                _buildCard("Create\nLoan Profile", Icons.create, Colors.blueAccent, () {}),
                _buildCard("View Loan\nProfile", Icons.person, Colors.amber, () {}),
                _buildCard("Loan\nEligibility", Icons.verified, Colors.deepPurple, () {}),
              ],
            ),
            const SizedBox(height: 24),

            // Banking Calculator
            const Text(
              "Banking Calculator",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildCard("Banking Tools", Icons.account_balance, Colors.indigo, () {}),
          ],
        ),
      ),
    );
  }

  // Reusable Card Widget
  Widget _buildCard(String title, IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withAlpha(26),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 36),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder EMI Calculator Screen
class EmiCalculatorScreen extends StatelessWidget {
  const EmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EMI Calculator")),
      body: const Center(child: Text("EMI Calculator Functionality Here")),
    );
  }
}
