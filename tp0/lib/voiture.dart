import 'package:flutter/material.dart';

class AjoutVoiture extends StatefulWidget {
  const AjoutVoiture({super.key});

  @override
  State<AjoutVoiture> createState() => _AjoutVoitureState();
}

class _AjoutVoitureState extends State<AjoutVoiture> {
  final formkey = GlobalKey<FormState>();
  int matr1 = 0;
  int matr2 = 0;

  String model = "";

  late int date = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ajouter Voiture")),
      body: Column(
        children: [
          Form(
            key: formkey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Matricule"),
                          hintText: "Entrer Votre Matricule",
                          hintStyle: TextStyle(color: Colors.blue),
                          filled: true,
                          fillColor: Colors.yellow,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length == 0) {
                            return ("Champ obligatoire");
                          } else if (value!.length > 3) {
                            return ("Champ invalide");
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          matr1 = int.parse(value!);
                          print(matr1);
                        },
                      ),
                    ),
                    Text("TN"),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          label: Text("Matricule"),
                          hintText: "Entrer Votre Matricule",
                          hintStyle: TextStyle(color: Colors.blue),
                          filled: true,
                          fillColor: Colors.yellow,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45),
                          ),
                        ),
                        validator: (value) {
                          if (value?.length == 0) {
                            return ("Champ obligatoire");
                          } else if (value!.length > 4) {
                            return ("Champ invalide");
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          matr2 = int.parse(value!);
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      label: Text("Model"),
                      hintText: "Entrer Votre Model",
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.yellow,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                    validator: (String? value) {
                      if (value?.length == 0) {
                        return ("Champ obligatoire");
                      } else if (value!.length > 5) {
                        return ("Champ invalide");
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      model = value!;
                      print(model);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      label: Text("Année"),
                      hintText: "Entrer Année ",
                      hintStyle: TextStyle(color: Colors.blue),
                      filled: true,
                      fillColor: Colors.yellow,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                    validator: (value) {},
                    onSaved: (value) {
                      date = int.parse(value!);
                      //print(date);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String datee;
                    setState(() {
                      if (formkey.currentState!.validate()) {
                        formkey.currentState!.save();
                        print(date);
                      }
                    });
                  },
                  child: Text("Valider"),
                ),
              ],
            ),
          ),
          Text(" modele : $model  date : $date $matr1 $matr2"),
        ],
      ),
    );
  }
}
