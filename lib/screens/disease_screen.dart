import 'package:flutter/material.dart';

class DiseaseScreen extends StatelessWidget {
  final String name;
  final String infoSource;
  final Map<String, Map<String, List<String>>> info;

  const DiseaseScreen({
    super.key,
    required this.name,
    required this.infoSource,
    required this.info,
  });

  List<Widget> getDetails(String name) {
    List<Widget> details = [];
    for (String category in info[name]!.keys) {
      if (category != "") {
        details.add(const SizedBox(
          height: 20,
        ));
        details.add(Text(
          category,
          style: const TextStyle(fontSize: 18),
        ));
      }
      for (String detail in info[name]![category]!) {
        details.add(Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            detail,
            style: const TextStyle(fontSize: 15),
          ),
        ));
      }
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
        "- $name -",
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
