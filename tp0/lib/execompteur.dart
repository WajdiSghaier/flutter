import 'package:flutter/material.dart';

class Compt extends StatefulWidget {
  const Compt({super.key});

  @override
  State<Compt> createState() => _ComptState();
}

class _ComptState extends State<Compt> {
  int comp = 0;
  Color c = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice Compteur'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
          comp += 1;
          if (comp % 2 == 0) {
            c = Colors.red;
            print('paire');
          } else
            c = Colors.blue;
          print('impair');
        },
        child: Icon(Icons.ac_unit),
      ),
      body: Center(
        child: Text(
          "Compteur=$comp",
          style: TextStyle(color: c),
        ),
      ),
    );
  }
}
