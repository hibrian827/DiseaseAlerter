import 'package:flutter/material.dart';

List<String> city = ["감기", "눈병", "피부", "식중독", "기타"];
List<String> town = ["감기", "눈병", "피부", "식중독", "기타"];
List<String> diseases = ["감기", "눈병", "피부염", "천식"];
// List<String> diseases = ["감기", "눈병", "피부염", "천식", "식중독"];

class StatisticScreen extends StatefulWidget {
  final Map<String, Map<String, List<List<dynamic>>>> data;

  const StatisticScreen({
    super.key,
    required this.data,
  });

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  late final Map<String, Map<String, List<List<dynamic>>>> _data;

  late String _city;
  late String _town;
  late bool _isCheckedCold;
  late bool _isCheckedEyedisease;
  late bool _isCheckedDermatitis;
  late bool _isCheckedAsthma;
  late bool _isCheckedFoodpoisoning;

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

  void _onChangedDermatitis(value) {
    setState(() {
      _isCheckedDermatitis = value;
    });
  }

  void _onChangedAsthma(value) {
    setState(() {
      _isCheckedAsthma = value;
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
    _isCheckedDermatitis = false;
    _isCheckedAsthma = false;
    _isCheckedFoodpoisoning = false;
    _data = widget.data;
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
                        isChecked: _isCheckedDermatitis,
                        onChanged: _onChangedDermatitis,
                      ),
                      DiseaseCheckBox(
                        name: "천식",
                        isChecked: _isCheckedAsthma,
                        onChanged: _onChangedAsthma,
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
    return Column(
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
