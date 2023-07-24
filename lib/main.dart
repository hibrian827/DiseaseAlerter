import 'package:disease_alerter/screens/loading_screen.dart';
import 'package:disease_alerter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future checkSaved() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt("location") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: checkSaved(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (snapshot.data == 0) {
              return const LogInScreen();
            } else {
              return LoadingScreen(location: snapshot.data);
            }
          }
        },
      ),
      theme: ThemeData(
        primaryColor: const Color(0xFF1A2634),
        primaryColorLight: const Color(0xFF203E5F),
        highlightColor: const Color(0xFFFFCC00),
        splashColor: const Color(0xFFFEE5B1),
        indicatorColor: const Color(0xFFFEE5B1),
      ),
    );
  }
}
