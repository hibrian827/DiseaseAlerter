import 'package:flutter/material.dart';

class DiseaseScreen extends StatelessWidget {
  final String name;
  final String infoSource;
  final Map<String, List<String>> info;

  const DiseaseScreen({
    super.key,
    required this.name,
    required this.infoSource,
    required this.info,
  });

  List<Widget> getDetails(String name) {
    List<Widget> details = [];
    for (String detail in info[name]!) {
      details.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(detail),
      ));
    }
    return details;
  }

  List<Widget> getInfos() {
    List<Widget> infos = [];
    for (String name in info.keys) {
      infos.add(const SizedBox(
        height: 35,
      ));
      infos.add(Text(
        name,
        style: const TextStyle(
          fontSize: 25,
        ),
      ));
      infos += getDetails(name);
    }
    return infos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "출처 : $infoSource",
                style: const TextStyle(
                  fontSize: 11,
                ),
              ),
              Column(
                children: getInfos(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("돌아가기"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
