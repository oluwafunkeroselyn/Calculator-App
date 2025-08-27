import 'package:calculator_app/controller/emi_calculator_controller.dart';
import 'package:calculator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvancedEmiCalculatorScreen extends StatelessWidget {
  const AdvancedEmiCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmiCalculatorController());

    InputDecoration fieldDecoration(String label) => InputDecoration(
          labelText: label,
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
            children: [
              // Loan Amount
              TextField(
                decoration: fieldDecoration('Loan Amount'),
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.loanAmount.value = val,
              ),
              const SizedBox(height: 12),

              // Interest %
              TextField(
                decoration: fieldDecoration('Interest %'),
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.rate.value = val,
              ),
              const SizedBox(height: 12),

              // Time Duration + Years/Months toggle
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: fieldDecoration('Time Duration'),
                      keyboardType: TextInputType.number,
                      onChanged: (val) => controller.tenure.value = val,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Obx(() => Row(
                        children: [
                          Radio<String>(
                            value: "Years",
                            groupValue: controller.durationType.value,
                            onChanged: (val) =>
                                controller.durationType.value = val!,
                          ),
                          const Text("Years"),
                          Radio<String>(
                            value: "Months",
                            groupValue: controller.durationType.value,
                            onChanged: (val) =>
                                controller.durationType.value = val!,
                          ),
                          const Text("Months"),
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 12),

              // Fees and Charges %
              TextField(
                decoration: fieldDecoration('Fees and Charges %'),
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.fees.value = val,
              ),
              const SizedBox(height: 12),

              // GST %
              TextField(
                decoration: fieldDecoration('GST on Interest %'),
                keyboardType: TextInputType.number,
                onChanged: (val) => controller.gst.value = val,
              ),
              const SizedBox(height: 20),

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
