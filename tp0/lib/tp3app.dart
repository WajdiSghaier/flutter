import 'package:flutter/material.dart';

class Home3 extends StatelessWidget {
  const Home3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TP3 Application")),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: app(Colors.red, "1", 100),
              ),
              Expanded(flex: 1, child: app(Colors.yellow, "2", 100))
            ],
          ),
          Row(
            children: [
              Expanded(flex: 1, child: app(Colors.green, "3", 200)),
              Expanded(
                  flex: 2,
                  child: Container(
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: app(Colors.purple, "4", 100)),
                              Expanded(
                                  flex: 1, child: app(Colors.yellow, "5", 100)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1, child: app(Colors.blue, "6", 100)),
                            ],
                          )
                        ],
                      )))
            ],
          ),
        ],
      ),
    );
  }
}

Widget app(Color c, String t, double h) {
  return (Container(
    color: c,
    height: h,
    child: Center(child: Text(t)),
  ));
}
