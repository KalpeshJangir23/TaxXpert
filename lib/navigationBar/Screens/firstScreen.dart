import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/utils/custom_button.dart';
import 'package:nfc_iterators/navigationBar/Screens/enterYourbasc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff92B79F),
      body: Column(
        children: [
          Material(
            elevation: 10,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.0), // Adjust the radius as needed
              bottomRight: Radius.circular(50.0), // Adjust the radius as needed
            ),
            child: Container(
              width: 400,
              height: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(50.0), // Adjust the radius as needed
                ),
                color: Color(0xff25472B),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/TAXX-01.png",
                    width: 500,
                    height: 500,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          CustomButton(
            label: "Get Started",
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const EntryTimeScreen();
              }));
            },
          ),
        ],
      ),
    ));
  }
}
