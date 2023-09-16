import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/utils/custom_button.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/utils/custom_text_field.dart';

class GSTCalc extends StatefulWidget {
  const GSTCalc({super.key});

  @override
  State<GSTCalc> createState() => _GSTCalcState();
}

class _GSTCalcState extends State<GSTCalc> {
  TextEditingController _gstController = TextEditingController();
  double inputAmount = 0.0;
  double gstRate = 18.0;
  double cgstAmount = 0.0;
  double sgstAmount = 0.0;
  double gstAmount = 0.0;
  double totalAmount = 0.0;

  double calculateGSTAmount(double amount) {
    return (amount * gstRate) / 100;
  }

  void calculateGST() {
    setState(() {
      inputAmount = double.tryParse(_gstController.text) ?? 0.0;
      cgstAmount = calculateGSTAmount(inputAmount) / 2;
      sgstAmount = calculateGSTAmount(inputAmount) / 2;
      gstAmount = calculateGSTAmount(inputAmount);

      totalAmount = inputAmount + gstAmount;
    });

    Map<String, double> dataMap = {
      'CGST': cgstAmount,
      'SGST': sgstAmount,
      'InputAmount': inputAmount,
    };
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _gstController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("GST Calculator", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(top: 30),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Enter Amount',
              controller: _gstController,
              logo: const Icon(
                Icons.monetization_on,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(label: 'Calculate', onPressed: calculateGST),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: 400,
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade400,
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'CGST',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text('₹$cgstAmount',
                              style: TextStyle(
                                  color: Colors.blue.shade400, fontSize: 24)),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'SGST',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text('₹$sgstAmount',
                              style: TextStyle(
                                  color: Colors.blue.shade400, fontSize: 24)),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GST',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text('₹$gstAmount',
                              style: TextStyle(
                                  color: Colors.blue.shade400, fontSize: 24)),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Text('₹$totalAmount',
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
    );
  }
}
