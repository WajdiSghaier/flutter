import 'package:flutter/material.dart';

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              ElevatedButton(onPressed: () {}, child: Text("Button1")),
              // ignore: prefer_const_constructors
              Icon(
                Icons.ac_unit,
                color: Colors.blue,
                size: 50,
              ),
              //Padding(padding: 20),
              Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                width: 100,
                height: 100,
                child: ElevatedButton(onPressed: () {}, child: Text("Button2")),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),

              ElevatedButton(
                  onPressed: () {}, child: Text("Very Long Button3")),

              //Text()
            ],
          ),
        ),
      ),
    );
  }
}
