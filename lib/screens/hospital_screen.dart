import 'package:flutter/material.dart';

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    "국군 병원",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
                MilitaryHospital(
                  name: "국군강릉병원",
                  location: "경기도 구리시 인창2로 177",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MilitaryHospital extends StatelessWidget {
  final String name;
  final String location;

  const MilitaryHospital({
    super.key,
    required this.name,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            location,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
