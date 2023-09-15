import 'package:flutter/material.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/emi_calculator.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/gst_calculator.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/income_tax_calculator.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/utils/custom_calc_card.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomCalcCard(
                title: "Income Tax Calculator",
                logo: const Icon(Icons.calculate),
                destinationNavigate: IncomeTaxCalc(),
                color: Colors.greenAccent,
              ),
              CustomCalcCard(
                title: "GST Calculator",
                logo: const Icon(Icons.calculate),
                destinationNavigate: GSTCalc(),
                color: Colors.greenAccent,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomCalcCard(
                title: "Emi Calculator",
                logo: const Icon(Icons.calculate),
                destinationNavigate: EMICalc(),
                color: Colors.greenAccent,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
