import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_iterators/ChatBot/chat_bot_screen.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/TaxCalculation/new_tax_slab_calc.dart';
import 'package:nfc_iterators/navigationBar/Screens/Diff_calcs/TaxCalculation/old_tax_slab_calc.dart';
import 'package:nfc_iterators/navigationBar/Screens/calculator.dart';
import 'package:nfc_iterators/navigationBar/Screens/exemptionNdeduction.dart';
import 'package:nfc_iterators/navigationBar/Screens/insights.dart';
import 'package:nfc_iterators/navigationBar/Screens/salaryNincome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class NewTaxSlab {
  final double lowerLimit;
  final double upperLimit;
  final double rate;

  NewTaxSlab(this.lowerLimit, this.upperLimit, this.rate);
}

class TaxSlab {
  final double lowerLimit;
  final double upperLimit;
  final double rate;

  TaxSlab(this.lowerLimit, this.upperLimit, this.rate);
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    initSharedPreferences();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  double totalSalary = 0.0;

  late SharedPreferences prefs;

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    // Retrieve the totalSalary from SharedPreferences
    double savedTotalSalary = prefs.getDouble('totalSalary') ?? 0.0;
    setState(() {
      totalSalary = savedTotalSalary;
    });
  }

  Future<void> saveTotalSalaryToSharedPreferences(double totalSalary) async {
    // Save the totalSalary to SharedPreferences
    await prefs.setDouble('totalSalary', totalSalary);
  }

  double newRegimeIncomeTaxCalc(
      double totalAnnualIncome, double totalDeductions) {
    double income = totalAnnualIncome - totalDeductions;

    final slabs = [
      NewTaxSlab(0, 250000, 0.05),
      NewTaxSlab(250000, 500000, 0.1),
      NewTaxSlab(500000, 750000, 0.15),
      NewTaxSlab(750000, 1000000, 0.2),
      NewTaxSlab(1000000, 1250000, 0.25),
      NewTaxSlab(1250000, 1500000, 0.3),
    ];

    double tax = 0.0;

    for (final slab in slabs) {
      if (income <= 0) {
        break;
      }

      final slabAmount = min(slab.upperLimit, income) - slab.lowerLimit;
      if (slabAmount > 0) {
        tax += slabAmount * slab.rate;
      }
      income -= slabAmount;
    }

    return tax;
  }

  double oldRegimeIncomeTaxCalc(
      double totalAnnualIncome, double totalDeductions) {
    double income = totalAnnualIncome - totalDeductions;

    final slabs = [
      TaxSlab(0, 250000, 0.05),
      TaxSlab(250000, 500000, 0.2),
      TaxSlab(500000, double.infinity, 0.3),
    ];

    double tax = 0.0;

    for (final slab in slabs) {
      if (income <= 0) {
        break;
      }

      final slabAmount = min(slab.upperLimit, income) - slab.lowerLimit;
      if (slabAmount > 0) {
        tax += slabAmount * slab.rate;
      }
      income -= slabAmount;
    }

    return tax;
  }

  @override
  Widget build(BuildContext context) {
    double oldRegimeTaxRate = 0.30; // 30%
    double newRegimeTaxRate = 0.20; // 20%

    // double oldRegimeTaxAmount = totalSalary * oldRegimeTaxRate;
    // double newRegimeTaxAmount = totalSalary * newRegimeTaxRate;
    // double ans = newRegimeTaxAmount - oldRegimeTaxAmount;

    double oldRegimeTaxAmount = oldRegimeIncomeTaxCalc(totalSalary, 50000);
    double newRegimeTaxAmount = newRegimeIncomeTaxCalc(totalSalary, 50000);
    // if (newRegimeTaxAmount >= oldRegimeTaxAmount) {
    //   double ans = newRegimeTaxAmount - oldRegimeTaxAmount;
    // } else {
    //   double ans = oldRegimeTaxAmount - newRegimeTaxAmount;
    // }
    double ans = oldRegimeTaxAmount - newRegimeTaxAmount;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text("Home"),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.notifications_rounded),
            )
          ],
        ),
        drawer: MyDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatBotScreen()));
          },
          backgroundColor: Colors.white,
          child: CircleAvatar(
            child: Image.asset('assets/chatBot_intructor.png'),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("Welcome back Kalpesh"),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 150,
                        height: 215,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text("Old Regime"),
                            const Divider(
                              thickness: 1,
                            ),
                            Column(
                              children: [
                                Lottie.asset(
                                  "assets/lottie/money.json",
                                ),
                                Text(
                                  '₹${oldRegimeTaxAmount.toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 23),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Expanded(
                        child: Container(
                          width: 150,
                          height: 215,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.blue,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("New Regime"),
                              const Divider(
                                thickness: 1,
                              ),
                              Column(
                                children: [
                                  Lottie.asset(
                                    "assets/lottie/money.json",
                                  ),
                                  Text(
                                      '₹${newRegimeTaxAmount.toStringAsFixed(2)}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Text('₹${ans.toStringAsFixed(2)}'),

                //! On screen Tab bar
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 380,
                    child: Column(
                      children: [
                        SizedBox(height: 18),
                        Container(
                          // height: 50,
                          width: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: TabBar(
                                  unselectedLabelColor: Colors.white,
                                  labelColor: Colors.black,
                                  indicatorColor: Colors.white,
                                  indicatorWeight: 2,
                                  indicator: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  controller: tabController,
                                  tabs: const [
                                    Tab(
                                      child: Text(
                                        "Salary & Income",
                                        softWrap: true,
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'Exmeption & Deduction',
                                        softWrap: true,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: tabController,
                            children: const [
                              SalaryandIncome(),
                              ExmeptionAndDeduction()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: const [
                Text(
                  'App Name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/userPic.jpg'),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('News'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const NewsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            onTap: () {
              Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
        ],
      ),
    );
  }
}
