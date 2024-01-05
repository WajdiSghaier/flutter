import 'package:flutter/material.dart';
import 'package:tp1/Atelier5/Widget/CustTexet.dart';
import 'package:tp1/Atelier5/Widget/CustumBoutton.dart';
import 'package:tp1/Atelier5/menu.dart';
import 'package:tp1/Atelier5/model/etudiant.dart';
import 'package:tp1/Atelier5/database.dart';

//import 'package:tp1/Atelier5/Widget/CustumBoutton.dart';

class AjoutEtud extends StatefulWidget {
  const AjoutEtud({super.key});

  @override
  State<AjoutEtud> createState() => _AjoutEtudState();
}

class _AjoutEtudState extends State<AjoutEtud> {
  //late List<Etudiant> etudiants;
  final formkey = GlobalKey<FormState>();
  // var etd = Etudiant();
  Etudiant etd = Etudiant(matricule: "", nom: "", age: 0, prenom: "");
  DataBaseHelper db = DataBaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Atelier 5")),
      drawer: Menu(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: Form(
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formkey,
            child: Column(
              children: [
                CustemText(
                  lab: "Matricule",
                  hint: "Entree Votre Matricule",
                  valider: (String? valeur) {
                    if (valeur == null || valeur.isEmpty)
                      return ("Le champ matricule est vide");
                    if (valeur.length < 6)
                      return ("Le champ Matricule incorrecte");
                    return null;
                  },
                  onsaved: (String? value) {
                    etd.setMatricule = value!;
                    //DataBaseHelper db = DataBaseHelper();
                    //print(etd);
                  },
                ),
                CustemText(
                  lab: "Nom",
                  hint: "Entree Votre Nom",
                  clavier: TextInputType.text,
                  valider: (String? valeur) {
                    if (valeur == null || valeur.isEmpty)
                      return ("Le champ Nom est vide");
                    return null;
                  },
                  onsaved: (String? value) {
                    etd.setNom = value!;
                    //print(etd);
                  },
                ),
                CustemText(
                  lab: "Prenom",
                  hint: "Entree Votre Prenom",
                  clavier: TextInputType.text,
                  valider: (String? valeur) {
                    if (valeur == null || valeur.isEmpty)
                      return ("Le champ Prenom est vide");
                    return null;
                  },
                  onsaved: (String? value) {
                    etd.prenom = value!;
                    //print(etd);
                  },
                ),
                CustemText(
                  lab: "Age",
                  clavier: TextInputType.number,
                  hint: "Entree Votre Age",
                  valider: (String? valeur) {
                    //val =valeur.
                    /* if (valeur == null || valeur.isEmpty)
                      return ("Le champ Prenom est vide");*/

                    if (int.parse(valeur!) < 20)
                      return ("Age incorrect (Age>20)");
                    return null;
                  },
                  onsaved: (String? value) {
                    //etd.setAge = int.parse(value)!;
                    etd.setAge = int.parse(value!);
                    //print(etd);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    children: [
                      CustumBoutton(
                        titreboutton: "Ajouter",
                        onpressed: () {
                          if (formkey.currentState!.validate()) {
                            print('Form Ok');
                            formkey.currentState!.save();

                            print(etd);

                            db.add(etd);
                            formkey.currentState!.reset();
                          } else
                            print('Form Not Ok');
                        },
                      ),
                      SizedBox(width: 29.0),
                      CustumBoutton(
                        titreboutton: "Annuler",
                        onpressed: () {
                          formkey.currentState!.reset();
                          print("not ok");
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
