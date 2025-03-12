import 'package:flutter/material.dart';

class Basestats extends StatefulWidget {
  var powerData;
  Basestats({super.key, required this.powerData});

  @override
  State<Basestats> createState() => _BasestatsState();
}

class _BasestatsState extends State<Basestats> {
  final List<Map<String, dynamic>> stats = [];

  void formatData(){
    for (var stat in widget.powerData) {
      stats.add({"label": '${stat.name}', "value": '${stat.baseStat}'});
    }
  }

  @override
  void initState() {
    formatData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for(var info in stats) Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                info["label"],
                style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 8),
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 30,
              child: Text(info["value"].toString(), style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: LinearProgressIndicator(
                value: int.parse(info["value"])  / 100,
                backgroundColor: Colors.orange.shade100,
                color: Colors.orange,
                minHeight: 8,
              ),
            ),
          ],
        )
      ]
    );
  }
}
