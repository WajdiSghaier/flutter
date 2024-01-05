import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Exercice 4"),
        ),
        body: GridView.count(
          crossAxisCount: 4,
          children: List.generate(82, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.blue,
                  child: Center(
                      child: Text(
                    "case n°:${index + 1}",
                    style: TextStyle(color: Colors.white),
                  ))),
            );
          }),
        ));
  }
}
