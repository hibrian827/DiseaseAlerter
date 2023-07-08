import 'package:disease_alerter/screens/alert_screen.dart';
import 'package:disease_alerter/screens/statistic_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Map<String, Map<int, Map<int, int>>> data;

  const MainScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: const <Widget>[
              Icon(Icons.bar_chart),
              Icon(Icons.add_alert_rounded),
              Icon(Icons.question_mark),
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
        body: TabBarView(
          children: [
            StatisticScreen(
              data: data,
            ),
            const AlertScreen(),
            const Center(),
          ],
        ),
      ),
    );
  }
}
