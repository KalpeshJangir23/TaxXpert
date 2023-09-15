import 'package:flutter/material.dart';

import '../../widgets/TextWithdivider.dart';

class ExmeptionAndDeduction extends StatelessWidget {
  const ExmeptionAndDeduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: const [
          TextWithdivider(
            label: "Salary and Income",
            value: "Taxable Income from business...",
            income: "₹1,20,000",
            showIncome: true,
            showDivider: true,
          ),
          TextWithdivider(
            label: "Business and Profession",
            value: "Taxable Income From business...",
            income: "120000",
            showDivider: true,
          ),
          TextWithdivider(
            label: "Capital Gains",
            value: "Income From Capital Gain...",
            income: "1,20,000",
            showDivider: true,
          ),
          TextWithdivider(
            label: "Other Sources",
            value: "Income from Other Sources...",
            income: "1,20,000",
            showDivider: true,
          ),
        ]),
      ),
    );
  }
}
