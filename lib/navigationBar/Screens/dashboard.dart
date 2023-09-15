import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_iterators/navigationBar/Screens/calculator.dart';
import 'package:nfc_iterators/navigationBar/Screens/exemptionNdeduction.dart';
import 'package:nfc_iterators/navigationBar/Screens/insights.dart';
import 'package:nfc_iterators/navigationBar/Screens/salaryNincome.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  int newRegime = 0;
  int oldRegime = 0;

  @override
  Widget build(BuildContext context) {
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
                      child: Expanded(
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
                                    "₹ 96,908",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                              const Text("Old Regime"),
                              const Divider(
                                thickness: 1,
                              ),
                              Column(
                                children: [
                                  Lottie.asset(
                                    "assets/lottie/money.json",
                                  ),
                                  Text("₹ 96,908"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

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
                          decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(5)),
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
                                  tabs: [
                                    Tab(
                                      text: 'Tab 1',
                                    ),
                                    Tab(
                                      text: 'Tab 1',
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
                            children: [SalaryandIncome(), ExmeptionAndDeduction()],
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
            leading: const Icon(Icons.home),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Calculator'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CalculatorScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('News'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
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
