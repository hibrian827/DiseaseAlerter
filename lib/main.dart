import 'package:flutter/material.dart';
import 'package:disease_alerter/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainScreen(),
      theme: ThemeData(
        primaryColor: const Color(0xFF222831),
        primaryColorLight: const Color(0xFF393E46),
        scaffoldBackgroundColor: const Color(0xFF222831),
        highlightColor: const Color(0xFFFFD369),
        splashColor: const Color(0xFFEEEEEE),
        indicatorColor: const Color(0xFFEEEEEE),
      ),
    );
  }
}
