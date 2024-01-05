import 'dart:math';

import 'package:flutter/material.dart';

class HomeIcon extends StatefulWidget {
  const HomeIcon({super.key});

  @override
  State<HomeIcon> createState() => _HomeIconState();
}

class _HomeIconState extends State<HomeIcon> {
  int codePoint = 0;
  IconData ic = Icons.ad_units;
  int indice = 0;
  List<IconData> lst = [
    Icons.ac_unit,
    Icons.add,
    Icons.ac_unit_sharp,
    Icons.access_alarm_rounded,
    Icons.access_alarm_outlined,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion des icones"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                //ic = lst[0];
                indice = Random().nextInt(lst.length);
                ic = lst[indice];

                //if (ic == Icons.ad_units) {
                // }  else {
                // ic = Icons.ad_units;
                // }
                codePoint = generateIconData();
              });
            },
            child: Text("changer Icon"),
          ),
          Row(
            children: [
              Icon(ic),
            ],
          ),
          Icon(IconData(codePoint, fontFamily: "MaterialIcons")),
        ],
      ),
    );
  }
}

generateIconData() {
  String ch = "0123456789abcdef";
  String code = "0xe";
  int i = 0;
  int indice = 0;
  for (i = 0; i < 3; i++) {
    indice = Random().nextInt(ch.length);
    code += ch[indice];
    return int.parse(code);
  }
}
