import 'package:flutter/material.dart';

Map<String, List<String>> hospitals = {
  "국군강릉병원": ["강원도 강릉시 주문진읍 동해대로 4371-34", "033-662-7802"],
  "국군고양병원": ["경기도 고양시 덕양구 혜음로 215 사서함 111-8호", "031-963-6657"],
  "국군구리병원": ["경기도 구리시 인창2로 177", "031-331-1919"],
  "국군대구병원": ["경북 경산시 하양읍 대경로 425-41", "053-750-1731"],
  "국군대전병원": ["대전광역시 유성구 자운로 90번(자운동) 국군대전병원", "1688-9152"],
  "국군수도병원": ["경기도 성남시 분당구 새마을로 177번길 81번지 사서함 99호", "1688-9151"],
  "국군양주병원": ["경기도 양주시 은현면 화합로 사서함 94-12호", "1688-9163"],
  "국군춘천병원": ["강원도 춘천시 방고개길 57번", "033-243-0130"],
  "국군포천병원": ["경기도 포천시 화현면 화동로 564", "031-531-0803"],
  "국군함평병원": ["전남 함평군 해보면 신해로 1027 국군함평병원", "1688-9153"],
  "국군홍천병원": ["강원도 홍천군 두촌면 아홉사리로 53", "1688-9167"],
  "서울지구병원": ["서울시 종로구 삼청로 10길 13번 국군서울지구병원", "02-748-1111"],
};

List<Widget> getHospitals() {
  List<Widget> hospitalsList = [];
  for (String hospital in hospitals.keys) {
    hospitalsList.add(MilitaryHospital(
      name: hospital,
      location: hospitals[hospital]![0],
      contact: hospitals[hospital]![1],
    ));
  }
  return hospitalsList;
}

class HospitalScreen extends StatefulWidget {
  const HospitalScreen({super.key});

  @override
  State<HospitalScreen> createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    "국군 병원",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                ),
                Column(
                  children: getHospitals(),
                )
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
  final String contact;

  const MilitaryHospital({
    super.key,
    required this.name,
    required this.location,
    required this.contact,
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
          Text(
            contact,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
