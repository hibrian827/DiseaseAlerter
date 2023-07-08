import 'package:disease_alerter/screens/hospital_screen.dart';
import 'package:flutter/material.dart';

List<String> diseases = [];

List<Widget> getDiseaseBtns() {
  List<Widget> btns = [];
  return btns;
}

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ScreenBtn(
            screen: HospitalScreen(),
            child: Text("군 병원 정보"),
          ),
          Column(
            children: getDiseaseBtns(),
          )
        ],
      ),
    );
  }
}

class ScreenBtn extends StatelessWidget {
  final Widget child;
  final Widget screen;

  const ScreenBtn({
    super.key,
    required this.child,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: child,
    );
  }
}
