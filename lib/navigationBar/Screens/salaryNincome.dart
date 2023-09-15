import 'package:flutter/material.dart';
import 'package:nfc_iterators/navigationBar/Screens/userSalaryandIncome.dart';

import '../../widgets/TextWithdivider.dart';

class SalaryandIncome extends StatefulWidget {
  const SalaryandIncome({super.key});

  @override
  State<SalaryandIncome> createState() => _SalaryandIncomeState();
}

class _SalaryandIncomeState extends State<SalaryandIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          GestureDetector(
            onDoubleTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserSalaryIncome()), // Navigate to the SecondScreen
              );
            },
            child: const TextWithdivider(
              label: "Salary and Income",
              value: "Taxable Income from business...",
              income: "₹1,20,000",
              showIncome: true,
              showDivider: true,
            ),
          ),
          const TextWithdivider(
            label: "Business and Profession",
            value: "Taxable Income From business...",
            income: "120000",
            showDivider: true,
          ),
          const TextWithdivider(
            label: "Capital Gains",
            value: "Income From Capital Gain...",
            income: "1,20,000",
            showDivider: true,
          ),
          const TextWithdivider(
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
