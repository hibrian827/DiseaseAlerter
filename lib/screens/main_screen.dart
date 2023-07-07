import 'package:csv/csv.dart';
import 'package:disease_alerter/models/disease_model.dart';
import 'package:disease_alerter/screens/alert_screen.dart';
import 'package:disease_alerter/screens/hospital_screen.dart';
import 'package:disease_alerter/screens/statistic_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> diseases = ["감기", "눈병", "피부염", "천식"];
// List<String> diseases = ["감기", "눈병", "피부염", "천식", "식중독"];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future _loadData() async {
    Map<String, Map<int, List<DiseaseModel>>> data = {};
    for (int i = 0; i < diseases.length; i++) {
      String disease = diseases[i];
      Map<int, List<DiseaseModel>> map = {};
      String rawData;
      List<dynamic> listData;
      List<String> type = ["시군구", "시도"];
      for (int j = 0; j < type.length; j++) {
        rawData = await rootBundle
            .loadString("assets/진료정보_${disease}_${type[j]}.csv");
        listData = const CsvToListConverter().convert(rawData);
        for (var data in listData) {
          List<String> date = data[0]?.split("-");
          int year = int.parse(date[0]);
          int month = int.parse(date[1]);
          int day = int.parse(date[2]);
          int location = data[1];
          int status = data[2];
          DiseaseModel diseaseModel =
              DiseaseModel(disease, year, month, day, location, status);
          if (map.containsKey(location)) {
            map[location]?.add(diseaseModel);
          } else {
            map[location] = [diseaseModel];
          }
        }
      }
      data[disease] = map;
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
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
              body: TabBarView(
                children: [
                  StatisticScreen(data: snapshot.data),
                  const AlertScreen(),
                  const HospitalScreen(),
                ],
              ),
            ),
          );
        }
      },
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
