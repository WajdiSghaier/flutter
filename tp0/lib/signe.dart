import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Application de gestion de signe astrologique",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Numero de Jour"),
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
                  hintText: "Entrer Numero de jour",
                  hintStyle: TextStyle(color: Colors.blue, fontSize: 20),
                  filled: true,
                  fillColor: Colors.yellow[300],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45)),
                ),
                validator: (value) {},
                onSaved: (value) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Numero de Mois"),
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
                  hintText: "Entrer Numero de Mois",
                  hintStyle: TextStyle(color: Colors.blue, fontSize: 20),
                  filled: true,
                  fillColor: Colors.yellow[300],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45)),
                ),
                validator: (value) {},
                onSaved: (value) {},
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Valider"),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  label: Text(""),
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
                  hintText: "",
                  hintStyle: TextStyle(color: Colors.blue, fontSize: 20),
                  filled: true,
                  //fillColor: const Color.fromARGB(255, 145, 189, 224),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45)),
                ),
                validator: (value) {},
                onSaved: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
