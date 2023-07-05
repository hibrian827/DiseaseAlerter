import 'package:flutter/material.dart';

List<String> list = ["감기", "눈병", "피부병", "식중독", "기타"];

class AlertScreen extends StatefulWidget {
  const AlertScreen({super.key});

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              "환자가 발생했나요?",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const Text("상황을 자세히 설명해줘서 추가해주세요!"),
            const Text("당신의 노력이 다음 환자를 예방합니다"),
            DropdownButton(
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "상황을 자세히 설명해주세요",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
