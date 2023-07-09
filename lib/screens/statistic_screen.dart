import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum Diseases { cold, eyeDisease, dermatitis, asthma, foodPoisoning }

Map<Diseases, String> diseasesKOR = {
  Diseases.cold: "감기",
  Diseases.eyeDisease: "눈병",
  Diseases.dermatitis: "피부염",
  Diseases.asthma: "천식",
  Diseases.foodPoisoning: "식중독",
};

String commonStatisticSource = "국민건강보험공단 (공공데이터포털-국가중점데이터)";
Map<Diseases, String> source = {
  Diseases.cold: commonStatisticSource,
  Diseases.eyeDisease: commonStatisticSource,
  Diseases.dermatitis: commonStatisticSource,
  Diseases.asthma: commonStatisticSource,
  Diseases.foodPoisoning: "식품의약품안전처 (공공데이터포털)",
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
  late String _disease;

  BarTouchData get barTouchData => BarTouchData(
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
              const TextStyle(
                color: Colors.cyan,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(value.toInt().toString(), style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
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

  List<BarChartGroupData> barGroups() {
    List<BarChartGroupData> grps = [];
    for (int year in _specificData.keys) {
      grps.add(BarChartGroupData(
        x: year,
        barRods: [BarChartRodData(toY: _specificData[year]!.toDouble())],
        showingTooltipIndicators: [0],
      ));
    }
    return grps;
  }

  FlBorderData get borderData => FlBorderData(show: false);

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
    setSpecificData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        DropdownButton<String>(
          value: _disease,
          icon: const Icon(Icons.arrow_downward),
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
          padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 30,
          ),
          child: SizedBox(
            height: 400,
            child: BarChart(
              BarChartData(
                barTouchData: barTouchData,
                titlesData: titlesData,
                borderData: borderData,
                barGroups: barGroups(),
                gridData: const FlGridData(show: false),
                alignment: BarChartAlignment.spaceAround,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
