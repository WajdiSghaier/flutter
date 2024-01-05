import 'package:flutter/material.dart';

class HomeIcn extends StatefulWidget {
  const HomeIcn({super.key});

  @override
  State<HomeIcn> createState() => _HomeIcnState();
}

class _HomeIcnState extends State<HomeIcn> {
  List<Icon> lst = [
    //Icon(Icons.ad_units),
    Icon(Icons.add),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("générer une nouvelle icône"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        lst.add(Icon(Icons.access_alarm_sharp));
                      });
                    },
                    child: Text("Ajouter Icone")),
              ],
            ),
            Column(
              children: (lst),
            ),
          ],
        ),
      ),
    );
  }
}
