import 'package:flutter/widgets.dart';

enum Diseases { cold, eyeDisease, dermatitis, asthma, foodPoisoning }

Map<Diseases, String> diseasesKOR = {
  Diseases.cold: "감기",
  Diseases.eyeDisease: "눈병",
  Diseases.dermatitis: "감기",
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

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return const Center();
  }
}
