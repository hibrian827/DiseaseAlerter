import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> list1 = ["감기", "눈병", "피부병", "식중독", "기타"];
List<String> list2 = ["감기", "눈병", "피부병", "식중독", "기타"];

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  List<List<dynamic>> _data = [];
  late String city;
  late String town;

  void _loadCSV() async {
    final rawData = await rootBundle.loadString("assets/kindacode.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    print(listData[0]);
    setState(() {
      _data = listData;
    });
  }

  @override
  void initState() {
    super.initState();
    city = list1.first;
    town = list2.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButton(
                  value: city,
                  items: list1.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      city = value!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButton(
                  value: town,
                  items: list2.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      town = value!;
                    });
                  },
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
        ],
      ),
    );
  }
}
