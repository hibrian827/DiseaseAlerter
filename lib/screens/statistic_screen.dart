import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<String> city = ["감기", "눈병", "피부병", "식중독", "기타"];
List<String> town = ["감기", "눈병", "피부병", "식중독", "기타"];
List<String> diseases = ["감기", "눈병", "피부병", "식중독"];

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({super.key});

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  List<List<dynamic>> _coldCityData = [];
  final List<List<dynamic>> _coldTownData = [];
  final List<List<dynamic>> _EyediseaseCityData = [];
  final List<List<dynamic>> _EyediseaseTownData = [];
  final List<List<dynamic>> _SkindiseaseCityData = [];
  final List<List<dynamic>> _SkindiseaseTownData = [];
  final List<List<dynamic>> _FoodpoisoningCityData = [];
  final List<List<dynamic>> _FoodpoisoningTownData = [];
  late String _city;
  late String _town;
  late bool _isCheckedCold;
  late bool _isCheckedEyedisease;
  late bool _isCheckedSkindisease;
  late bool _isCheckedFoodpoisoning;

  void _loadCSV() async {
    final rawData = await rootBundle.loadString("assets/진료정보_감기_시군구.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    _coldCityData = listData;
  }

  Future loadData() async {
    _loadCSV();
  }

  void _onChangedCity(String? value) {
    setState(() {
      _city = value!;
    });
  }

  void _onChangedTown(String? value) {
    setState(() {
      _town = value!;
    });
  }

  void _onChangedCold(value) {
    setState(() {
      _isCheckedCold = value;
    });
  }

  void _onChangedEyeDisease(value) {
    setState(() {
      _isCheckedEyedisease = value;
    });
  }

  void _onChangedSkinDisease(value) {
    setState(() {
      _isCheckedSkindisease = value;
    });
  }

  void _onChangedFoodPoisoning(value) {
    setState(() {
      _isCheckedFoodpoisoning = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _city = city.first;
    _town = town.first;
    _isCheckedCold = false;
    _isCheckedEyedisease = false;
    _isCheckedSkindisease = false;
    _isCheckedFoodpoisoning = false;
    // loadData();
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
              Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DropdownButton(
                          value: _city,
                          items: city
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: _onChangedCity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: DropdownButton(
                          value: _town,
                          items: town
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: _onChangedTown,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      DiseaseCheckBox(
                        name: "감기",
                        isChecked: _isCheckedCold,
                        onChanged: _onChangedCold,
                      ),
                      DiseaseCheckBox(
                        name: "눈병",
                        isChecked: _isCheckedEyedisease,
                        onChanged: _onChangedEyeDisease,
                      ),
                      DiseaseCheckBox(
                        name: "피부염",
                        isChecked: _isCheckedSkindisease,
                        onChanged: _onChangedSkinDisease,
                      ),
                      DiseaseCheckBox(
                        name: "식중독",
                        isChecked: _isCheckedFoodpoisoning,
                        onChanged: _onChangedFoodPoisoning,
                      ),
                    ],
                  ),
                ],
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

class DiseaseCheckBox extends StatelessWidget {
  final String name;
  final bool isChecked;
  final void Function(bool?)? onChanged;

  const DiseaseCheckBox({
    super.key,
    required this.name,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
        ),
        Text(name),
      ],
    );
  }
}
