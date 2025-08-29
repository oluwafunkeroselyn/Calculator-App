import 'package:calculator_app/controller/emi_calculator_controller.dart';
import 'package:calculator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvancedEmiCalculatorScreen extends StatelessWidget {
  const AdvancedEmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmiCalculatorController());

    InputDecoration fieldDecoration() => InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADVANCE EMI CALCULATOR',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Loan Amount
              const Text("Loan Amount"),
              const SizedBox(height: 6),
              TextField(
                decoration: fieldDecoration(),
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.loanAmount.value = val,
              ),
              const SizedBox(height: 16),

              // Interest %
              const Text("Interest %"),
              const SizedBox(height: 6),
              TextField(
                decoration: fieldDecoration(),
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.rate.value = val,
              ),
              const SizedBox(height: 16),

              // Time Duration with Years/Months
             // Time Duration with Years/Months
const Text("Time Duration"),
// Radios row ABOVE the textfield (like in your screenshot)
Obx(() => Row(
  mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Radio<String>(
          value: "Years",
          groupValue: controller.durationType.value,
          onChanged: (val) => controller.durationType.value = val!,
        ),
        const Text("Years"),
        const SizedBox(width: 10),
        Radio<String>(
          value: "Months",
          groupValue: controller.durationType.value,
          onChanged: (val) => controller.durationType.value = val!,
        ),
        const Text("Months"),
      ],
    )),

// Duration input BELOW the radio buttons
TextField(
  decoration: fieldDecoration(),
  keyboardType: TextInputType.number,
  onChanged: (val) => controller.tenure.value = val,
),
const SizedBox(height: 16),

              // Duration input
              TextField(
                decoration: fieldDecoration(),
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.tenure.value = val,
              ),
              const SizedBox(height: 16),

              // Fees
              const Text("Fees and Charges %"),
              const SizedBox(height: 6),
              TextField(
                decoration: fieldDecoration(),
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.fees.value = val,
              ),
              const SizedBox(height: 16),

              // GST
              const Text("GST on Interest %"),
              const SizedBox(height: 6),
              TextField(
                decoration: fieldDecoration(),
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.gst.value = val,
              ),
              const SizedBox(height: 24),

              // Calculate Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  controller.calculateEMI();
                  Get.snackbar(
                    'EMI Result',
                    'Your EMI is ₹${controller.emiResult.value}',
                    backgroundColor: Colors.white,
                    colorText: Colors.black,
                  );
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
