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

  double calculateGSTAmount(double amount) {
    return (amount * gstRate) / 100;
  }

  void calculateGST() {
    setState(() {
      inputAmount = double.tryParse(_gstController.text) ?? 0.0;
      cgstAmount = calculateGSTAmount(inputAmount) / 2;
      sgstAmount = calculateGSTAmount(inputAmount) / 2;
      gstAmount = calculateGSTAmount(inputAmount);
    });
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
        title: Text("GST Calculator"),
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
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [Colors.yellow.shade100, Colors.green.shade500],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'CGST/SGST',
                            style: TextStyle(color: Colors.white),
                          ),
                          Text('CGST: $cgstAmount'),
                          Text('SGST: $sgstAmount'),
                          Text('GST: $gstAmount'),
                          const SizedBox(height: 20.0),
                          // Text(
                          //     'Amount After Adding GST: ${inputAmount + gstAmount}'),
                        ],
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 110,
                      color: Colors.white,
                    ),
                    Text('Yellow'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
