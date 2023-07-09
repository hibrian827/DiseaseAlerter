import 'package:csv/csv.dart';
import 'package:disease_alerter/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadingScreen extends StatefulWidget {
  final int location;

  const LoadingScreen({super.key, required this.location});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late int _location;

  Future _loadData() async {
    // 지역별로 질병이 어느 년도에 어느 달에 얼마나 발생했는지 카운트
    Map<String, Map<int, Map<int, int>>> data = {};
    // 공통 질병 받기
    List<String> diseases = ["감기", "눈병", "천식", "피부염"];
    for (String disease in diseases) {
      data[disease] = {};
      for (int year = 2014; year <= 2022; year++) {
        data[disease]![year] = {};
        for (int month = 1; month <= 12; month++) {
          data[disease]![year]![month] = 0;
        }
      }
    }
    for (String disease in diseases) {
      List<String> types = ["시군구", "시도"];
      for (String type in types) {
        String rawData =
            await rootBundle.loadString("assets/진료정보_${disease}_$type.csv");
        final listDatas = const CsvToListConverter().convert(rawData);
        for (var listData in listDatas) {
          int loc = listData[1];
          if (loc != _location) continue;
          List<String> date = listData[0]?.split("-");
          int year = int.parse(date[0]);
          int month = int.parse(date[1]);
          int count = listData[2];
          data[disease]![year]![month] = data[disease]![year]![month]! + count;
        }
      }
    }
    // 식중독 받기
    data["식중독"] = {};
    for (int year = 2018; year <= 2022; year++) {
      data["식중독"]![year] = {};
      for (int month = 1; month <= 12; month++) {
        data["식중독"]![year]![month] = 0;
      }
    }
    // for (int year = 2018; year <= 2022; year++) {
    //   String rawData =
    //       await rootBundle.loadString("assets/지역별_월별_식중독_통계_$year.csv");
    //   List<List<dynamic>> listDatas =
    //       const CsvToListConverter(eol: "\n").convert(rawData);
    //   print(listDatas);
    // }
    // print(data["식중독"]);
    return data;
  }

  @override
  void initState() {
    super.initState();
    _location = widget.location;
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
          return MainScreen(
            data: snapshot.data,
          );
        }
      },
    );
  }
}
