import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.grey,
        ),
        child: PieChart(
          PieChartData(
            sections: [
              PieChartSectionData(
                color: Colors.blue,
                value: 30, // Percentage value for this section
                title: 'Blue',
                radius: 120, // Radius of the section
              ),
              PieChartSectionData(
                color: Colors.red,
                value: 40,
                title: 'Red',
                radius: 120,
              ),
              PieChartSectionData(
                color: Colors.green,
                value: 20,
                title: 'Green',
                radius: 120,
              ),
            ],
            borderData: FlBorderData(show: false),
            centerSpaceRadius: 0,
            sectionsSpace: 0,
          ),
        ),
      ),
    );
  }
}
