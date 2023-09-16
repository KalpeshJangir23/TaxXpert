import 'package:flutter/material.dart';

class CustomCalcCard extends StatelessWidget {
  String title;
  Widget logo;
  Widget destinationNavigate;
  Color color;
  CustomCalcCard(
      {super.key,
      required this.title,
      required this.logo,
      required this.destinationNavigate,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: Card(
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            logo,
            SizedBox(
              height: double.infinity,
              width: 280,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(color),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return destinationNavigate;
                  }));
                },
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
