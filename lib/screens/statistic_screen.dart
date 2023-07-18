import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum Diseases { cold, eyeDisease, dermatitis, asthma, foodPoisoning }

Map<Diseases, String> diseasesKOR = {
  Diseases.cold: "감기",
  Diseases.eyeDisease: "눈병",
  Diseases.dermatitis: "피부염",
  Diseases.asthma: "천식",
  // Diseases.foodPoisoning: "식중독",
};

String commonStatisticSource = "국민건강보험공단 (공공데이터포털-국가중점데이터)";
Map<String, String> source = {
  "감기": commonStatisticSource,
  "눈병": commonStatisticSource,
  "피부염": commonStatisticSource,
  "천식": commonStatisticSource,
  // "식중독": "식품의약품안전처 (공공데이터포털)",
};

class StatisticScreen extends StatefulWidget {
  final Map<String, Map<int, Map<int, int>>> data;

  const StatisticScreen({
    super.key,
    required this.data,
  });

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  late Map<String, Map<int, Map<int, int>>> _data;
  late Map<int, int> _specificData;
  late int _year;
  late String _disease;
  final Color selectedTitleColor = Colors.blue;
  final Color selectedBarColor = Colors.cyan;
  final Color unselectedTitleColor = Colors.grey;
  final Color unselectedBarColor = Colors.grey;
  final Color subTitleColor = Colors.purple;
  final Color subBarColor = Colors.deepPurple;

  // 공통 그래프 함수
  FlBorderData get borderData => FlBorderData(show: false);

  // 년도별 그래프 함수
  BarTouchData get barTouchDataYear => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: _year == _specificData.keys.toList()[groupIndex]
                    ? selectedBarColor
                    : unselectedBarColor,
                fontSize: 8,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitlesYear(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: _year == value.toInt() ? selectedTitleColor : unselectedTitleColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: TextButton(
        onPressed: () {
          setState(() {
            _year = value.toInt();
          });
        },
        child: Text(value.toInt().toString(), style: style),
      ),
    );
  }

  FlTitlesData get titlesDataYear => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: getTitlesYear,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<BarChartGroupData> barGroupsYear() {
    List<BarChartGroupData> grps = [];
    for (int year in _specificData.keys) {
      grps.add(BarChartGroupData(
        x: year,
        barRods: [
          BarChartRodData(
            toY: _specificData[year]!.toDouble(),
            color: _year == year ? selectedBarColor : unselectedBarColor,
          )
        ],
        showingTooltipIndicators: [0],
      ));
    }
    return grps;
  }

  // 월별 그래프 용 함수
  BarTouchData get barTouchDataMonth => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: subBarColor,
                fontSize: 7,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitlesMonth(double value, TitleMeta meta) {
    TextStyle style = TextStyle(
      color: subTitleColor,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(value.toInt().toString(), style: style),
    );
  }

  FlTitlesData get titlesDataMonth => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: getTitlesMonth,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<BarChartGroupData> barGroupsMonth() {
    List<BarChartGroupData> grps = [];
    for (int month = 1; month <= 12; month++) {
      grps.add(BarChartGroupData(
        x: month,
        barRods: [
          BarChartRodData(
            toY: _data[_disease]![_year]![month]!.toDouble(),
            color: subBarColor,
          )
        ],
        showingTooltipIndicators: [0],
      ));
    }
    return grps;
  }

  // build

  void setSpecificData() {
    _specificData = {};
    for (int year in _data[_disease]!.keys) {
      _specificData[year] = 0;
      for (int month in _data[_disease]![year]!.keys) {
        _specificData[year] =
            _data[_disease]![year]![month]! + _specificData[year]!;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _data = widget.data;
    _disease = diseasesKOR.values.first;
    _year = _data[_disease]!.keys.first;

    setSpecificData();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(height: 40),
        DropdownButton<String>(
          value: _disease,
          icon: const Icon(Icons.arrow_drop_down),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? value) {
            setState(() {
              _disease = value!;
              setSpecificData();
            });
          },
          items:
              diseasesKOR.values.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              15, screenHeight * 0.05, 15, screenHeight * 0.02),
          child: SizedBox(
            height: screenHeight * 0.25,
            child: BarChart(
              BarChartData(
                barTouchData: barTouchDataYear,
                titlesData: titlesDataYear,
                borderData: borderData,
                barGroups: barGroupsYear(),
                gridData: const FlGridData(show: false),
                alignment: BarChartAlignment.spaceAround,
              ),
            ),
          ),
        ),
        const Text("연도를 눌러 월별 그래프를 알아보세요!"),
        SizedBox(
          height: screenHeight * 0.04,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: BarChart(
              BarChartData(
                barTouchData: barTouchDataMonth,
                titlesData: titlesDataMonth,
                borderData: borderData,
                barGroups: barGroupsMonth(),
                gridData: const FlGridData(show: false),
                alignment: BarChartAlignment.spaceAround,
              ),
            ),
          ),
        ),
        Text(
          "출처 : ${source[_disease]}",
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
