import 'package:flutter/material.dart';

String commonInfoSource = "질병관리청 (국가건강정보포털-질병관리청 국가건강정보포털)";

class DiseaseScreen extends StatefulWidget {
  final String name;
  final String infoSource;
  final String url;
  final String statisticSource;

  const DiseaseScreen({
    super.key,
    required this.name,
    required this.infoSource,
    required this.url,
    required this.statisticSource,
  });

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  late String _name;
  late String _infoSource;
  late String _url;
  late String _statisticSource;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _infoSource = widget.infoSource;
    _url = widget.url;
    _statisticSource = widget.statisticSource;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(_name),
          Text(_infoSource),
        ],
      ),
    );
  }
}
