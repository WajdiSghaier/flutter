import 'package:flutter/material.dart';

//import 'package:projet/atelier5/widgets/menu.dart';
import 'package:tp1/Atelier5/database.dart';
import 'package:tp1/Atelier5/menu.dart';

class ListEtudiant extends StatefulWidget {
  const ListEtudiant({super.key});

  @override
  State<ListEtudiant> createState() => _ListEtudiantState();
}

class _ListEtudiantState extends State<ListEtudiant> {
  DataBaseHelper db = DataBaseHelper.instance;
  List etudiants = [];

  Future readData() async {
    List tmp = await db.getEtudiants();
    print("Liste des etudiants:$tmp");
    setState(() {
      etudiants.addAll(tmp);
    });
  }

  //cycle de vie
  @override
  void initState() {
    readData(); //
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List des Etudiants"),
        centerTitle: true,
      ),
      drawer: Menu(),
      body: ListView.builder(
        itemCount: etudiants.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(etudiants[index]["nom"]),
              subtitle: Text(etudiants[index]["nom"]),
            ),
          );
        },
      ),
    );
  }
}
