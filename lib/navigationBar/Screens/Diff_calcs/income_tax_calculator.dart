import 'package:flutter/material.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/TaxCalculation/old_tax_slab_calc.dart';
import 'dart:math';

class IncomeTaxCalc extends StatefulWidget {
  const IncomeTaxCalc({super.key});

  @override
  State<IncomeTaxCalc> createState() => _IncomeTaxCalcState();
}

class _IncomeTaxCalcState extends State<IncomeTaxCalc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Income Tax Calculator'),
      ),
    );
  }
}
