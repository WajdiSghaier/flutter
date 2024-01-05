import 'package:flutter/material.dart';
//import 'package:projet/atelier5/pages/add_etudiant.dart';
//import 'package:projet/atelier5/pages/list_etudiant.dart';
import 'package:tp1/Atelier5/AjoutEtudiant.dart';
import 'package:tp1/Atelier5/listEtudiant.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            accountName: Text("Ben Jazia"),
            accountEmail: Text("benjazia@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/image1.jpg'),
              radius: 5.0,
            ),
          ),
          elementMenu(context, AjoutEtud(), "Accuiel", "info dashbord",
              Icons.dashboard),
          elementMenu(context, AjoutEtud(), "Ajout Etudiant",
              "creer un new etud", Icons.add),
          elementMenu(context, ListEtudiant(), "Liste des Etudiants",
              "afficher list etudiant", Icons.list),
        ],
      ),
    );
  }

  Widget elementMenu(BuildContext context, dynamic page, String titre,
      String sousTitre, IconData uneIcone) {
    return ListTile(
      title: Text(titre),
      subtitle: Text(sousTitre),
      leading: Icon(uneIcone),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => page));
      },
    );
  }
}
