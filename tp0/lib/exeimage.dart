import 'dart:math';
import 'package:flutter/material.dart';

class HomeImg extends StatefulWidget {
  const HomeImg({super.key});

  @override
  State<HomeImg> createState() => _HomeImgState();
}

class _HomeImgState extends State<HomeImg> {
  int taille = 100;
  String src = "";
  int i = 0;
  String path = "";
  List<String> lst = [
    "assets/img/img1.jpg",
    "assets/img/img2.jpg",
    "assets/img/img3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("charger image"),
      ),
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        taille = Random().nextInt(5);
                        src = "https://picsum.photos/$taille";
                      });
                    },
                    child: Text("charger image")),
                Container(
                    height: 300,
                    width: 300,
                    child: Image.network(
                      src,
                      fit: BoxFit.cover,
                    )),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        //taille = Random().nextInt(500);
                        i = Random().nextInt(lst.length);
                      });
                    },
                    child: Text("charger image locale",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ))),
                Container(
                    height: 300,
                    width: 300,
                    child: Image.asset(lst[i], fit: BoxFit.cover)),

                /*Container(
                    height: 300,
                    width: 300,
                    child: Image.asset("assets/img/img1.png")),*/
              ],
            ),
          ],
        ),
      ),
    );
  }
}
