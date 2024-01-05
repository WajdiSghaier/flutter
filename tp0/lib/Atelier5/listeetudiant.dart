import 'package:flutter/material.dart';
import 'package:tp1/Atelier5/AjoutEtudiant.dart';
import 'package:tp1/Atelier5/Widget/CustTexet.dart';
import 'package:tp1/Atelier5/Widget/CustumBoutton.dart';
import 'package:tp1/Atelier5/model/etudiant.dart';
import 'package:tp1/Atelier5/database.dart';

class ListeEtudiant extends StatefulWidget {
  const ListeEtudiant({super.key});

  @override
  State<ListeEtudiant> createState() => _ListeEtudiantState();
}

class _ListeEtudiantState extends State<ListeEtudiant> {
  late List<Etudiant> etudiants;
  late DataBaseHelper db;
  @override
  void initState() {
    super.initState();
    db = DataBaseHelper.instance;
    etudiants = [
      // Etudiant(nom: 'sgh', prenom: 'wajdi'),
    ];

    ListeEtudiants();
  }

  Future<void> ListeEtudiants() async {
    await db.initDatabase();
    //List<Etudiant> etudiants;
    etudiants = await db.getEtudiants();
    print('ici $db.getEtudiants()');
    setState(() {
      etudiants = etudiants;
    });
    print(etudiants);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: couleur.withOpacity(0.5),
        title: Text('Liste des étudiants'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AjoutEtud()),
                      );
                    },
                    child: Text('Ajouter Etudiant')),
                SizedBox(width: 8.0),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: etudiants.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      ListTile(
                        iconColor: Colors.black,
                        title: Text(
                          '${etudiants[index].matricule} , ${etudiants[index].nom} ${etudiants[index].prenom} , ${etudiants[index].age}',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.normal),
                        ),
                        contentPadding: EdgeInsets.all(0.0),
                        textColor: Colors.black,
                      ),
                      Divider(color: Colors.black, thickness: 1.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
