import 'package:flutter/material.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/utils/custom_button.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/utils/custom_text_field.dart';
import 'dart:math';

class EMICalc extends StatefulWidget {
  const EMICalc({super.key});

  @override
  State<EMICalc> createState() => _EMICalcState();
}

class _EMICalcState extends State<EMICalc> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _loanAmountController = TextEditingController();
  TextEditingController _interestController = TextEditingController();
  TextEditingController _tenureController = TextEditingController();
  double emi = 0.0;

  void calcEmi() {
    double loanAmount = double.tryParse(_loanAmountController.text) ?? 0.0;
    int tenureMonths = int.tryParse(_tenureController.text) ?? 0;
    double interstRate = double.tryParse(_interestController.text) ?? 0.0;

    if (loanAmount > 0 && tenureMonths > 0 && interstRate > 0) {
      double monthlyInterestRate = (interstRate / 12) / 100;
      double numerator = loanAmount * monthlyInterestRate;
      double denominator =
          1 - (1 / (pow(1 + monthlyInterestRate, tenureMonths)));
      double emi = numerator / denominator;

      setState(() {
        this.emi = emi;
      });
    } else {
      setState(() {
        this.emi = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Emi Calculator", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Eg. Home loan, Electronics, etc',
                controller: _nameController,
                logo: Icon(Icons.accessibility_sharp),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Loan Amount',
                controller: _loanAmountController,
                logo: Icon(Icons.attach_money_outlined),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Tenure (in Months)',
                controller: _tenureController,
                logo: Icon(
                  Icons.calendar_month,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Interest in %',
                controller: _interestController,
                logo: Icon(
                  Icons.percent_outlined,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(label: 'Calculate', onPressed: calcEmi),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 400,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade400,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Your loan details as specified by you ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Loan Amount', style: TextStyle(fontSize: 20)),
                            Text('₹${_loanAmountController.text}',
                                style: TextStyle(
                                    color: Colors.blue.shade400, fontSize: 24)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tenure',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '${_tenureController.text}',
                              style: TextStyle(
                                  color: Colors.blue.shade400, fontSize: 24),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Interest Rate ',
                                style: TextStyle(fontSize: 20)),
                            Text('${_interestController.text}',
                                style: TextStyle(
                                    color: Colors.blue.shade400, fontSize: 24)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Emi (per month) :  ',
                                style: TextStyle(fontSize: 20)),
                            Text('₹${emi}',
                                style: TextStyle(
                                    color: Colors.blue.shade400, fontSize: 24)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
