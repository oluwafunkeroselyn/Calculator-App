import 'package:get/get.dart';
import 'dart:math';

class EmiCalculatorController extends GetxController {
  // Inputs
  var loanAmount = ''.obs;
  var rate = ''.obs;
  var tenure = ''.obs;
  var fees = ''.obs;
  var gst = ''.obs;
  var durationType = "Years".obs; // Default: Years

  // Output
  var emiResult = 0.0.obs;

  void calculateEMI() {
    double p = double.tryParse(loanAmount.value) ?? 0; // principal
    double r = (double.tryParse(rate.value) ?? 0) / 12 / 100; // monthly interest
    int n = int.tryParse(tenure.value) ?? 0; // tenure

    // Convert Years → Months if needed
    if (durationType.value == "Years") {
      n = n * 12;
    }

    // EMI Formula: P × r × (1+r)^n / ((1+r)^n – 1)
    double emi = 0;
    if (r > 0 && n > 0) {
      emi = (p * r * pow(1 + r, n)) / (pow(1 + r, n) - 1);
    }

    // Apply fees (one-time charges spread over months)
    double feePercent = double.tryParse(fees.value) ?? 0;
    double totalFees = (p * feePercent / 100) / n; // per month add-on
    emi += totalFees;

    // Apply GST on interest component
    double gstPercent = double.tryParse(gst.value) ?? 0;
    emi += (emi * gstPercent / 100);

    emiResult.value = emi.isNaN ? 0 : emi;
  }
}
