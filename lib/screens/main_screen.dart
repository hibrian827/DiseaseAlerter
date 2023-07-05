import 'package:flutter/material.dart';
import 'package:disease_alerter/screens/alert_screen.dart';
import 'package:disease_alerter/screens/statistic_screen.dart';
import 'package:disease_alerter/screens/hospital_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: const <Widget>[
              MainTab(icon: Icons.bar_chart),
              MainTab(icon: Icons.notification_add),
              MainTab(icon: Icons.local_hospital),
            ],
            labelColor: Theme.of(context).splashColor,
            unselectedLabelColor: Theme.of(context).primaryColorLight,
            onTap: (index) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
          ),
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: const TabBarView(
          children: [
            StatisticScreen(),
            AlertScreen(),
            HospitalScreen(),
          ],
        ),
      ),
    );
  }
}

class MainTab extends StatelessWidget {
  final IconData icon;

  const MainTab({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(icon),
    );
  }
}
