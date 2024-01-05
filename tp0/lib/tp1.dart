import 'package:flutter/material.dart';

class Astro extends StatefulWidget {
  const Astro({Key? key}) : super(key: key);

  @override
  State<Astro> createState() => _AstroState();
}

class _AstroState extends State<Astro> {
  final formkey = GlobalKey<FormState>();

  late int? numJour;
  late int? numMois;

  late int numAstro = 13;
  String imageAstroo = '';
  late int numX = 0;

  Widget ImageAstro(int num) {
    String nomImage = 'assets/images/';
    if (num == 1)
      nomImage += 'belier.png';
    else if (num == 2)
      nomImage += 'taureau.png';
    else if (num == 3) nomImage += 'gumaux.png';

    //print(nomImage);

    if (num < 13)
      return Image.asset(nomImage);
    else
      return Text(
        "",
        style: TextStyle(fontSize: 20.0, color: Colors.red),
      );
  }

  Widget ImageAstro1(String num) {
    //print(nomImage);

    if (num != '')
      return Image.asset('assets/images/' + num);
    else
      return Text(
        "Pas d'image",
        style: TextStyle(fontSize: 20.0, color: Colors.red),
      );
  }

  Widget ImageX(int n) {
    if (n > 0)
      return Image.asset('assets/images/belier.png');
    else
      return Text('...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Signe'),
        backgroundColor: Colors.blue.withOpacity(0.5),
      ),
      body: Form(
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 20.0),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Num Jour',
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: 'Saisir le num Jour',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                      fillColor: Colors.yellow,
                      filled: true),
                  validator: (String? value) {
                    if (int.parse(value!) < 1 || int.parse(value!) > 31)
                      return 'Num Jour Erroné';
                    return null;
                  },
                  onSaved: (String? value) {
                    numJour = int.parse(value!);
                    print(numJour);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(fontSize: 20.0),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Num Mois',
                      labelStyle: TextStyle(color: Colors.blue),
                      hintText: 'Saisir le num Mois',
                      hintStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                      fillColor: Colors.yellow,
                      filled: true),
                  validator: (String? value) {
                    if (int.parse(value!) < 1 || int.parse(value!) > 12)
                      return 'Num Mois Erroné';
                    return null;
                  },
                  onSaved: (String? value) {
                    numMois = int.parse(value!);
                    print(numMois);
                  },
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22.0),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.brown)),
                        onPressed: () {
                          int numAstroo = 13;
                          setState(() {
                            if (formkey.currentState!.validate()) {
                              numAstro = 13;
                              formkey.currentState!.save();
                              if (((numJour! >= 21) && numMois! == 3) ||
                                  (numJour! <= 19 && numMois! == 4)) {
                                numAstroo = 1;
                                imageAstroo = 'belier.png';
                                numX = 1;
                              } else if (((numJour! >= 20) && numMois! == 4) ||
                                  (numJour! <= 20 && numMois! == 5))
                                numAstroo = 2;
                              else if (((numJour! >= 22) && numMois! == 5) ||
                                  (numJour! <= 22 && numMois! == 6))
                                numAstroo = 3;
                              else if (((numJour! >= 23) && numMois! == 6) ||
                                  (numJour! <= 23 && numMois! == 7))
                                numAstroo = 4;
                              else if (((numJour! >= 23) && numMois! == 7) ||
                                  (numJour! <= 23 && numMois! == 8))
                                numAstroo = 5;
                              else if (((numJour! >= 23) && numMois! == 8) ||
                                  (numJour! <= 23 && numMois! == 9))
                                numAstroo = 6;
                              else if (((numJour! >= 23) && numMois! == 9) ||
                                  (numJour! <= 23 && numMois! == 10))
                                numAstroo = 7;
                              else if (((numJour! >= 23) && numMois! == 10) ||
                                  (numJour! <= 23 && numMois! == 11))
                                numAstroo = 8;
                              else if (((numJour! >= 23) && numMois! == 11) ||
                                  (numJour! <= 23 && numMois! == 12))
                                numAstroo = 9;
                              else if (((numJour! >= 23) && numMois! == 12) ||
                                  (numJour! <= 23 && numMois! == 1))
                                numAstroo = 10;
                              else if (((numJour! >= 23) && numMois! == 1) ||
                                  (numJour! <= 23 && numMois! == 2))
                                numAstroo = 11;
                              else if (((numJour! >= 20) && numMois! == 2) ||
                                  (numJour! <= 20 && numMois! == 3))
                                numAstroo = 12;
                            } else
                              numAstroo = 13;

                            numAstro = numAstroo;
                          });
                        },
                        child: Text(
                          "Calculer",
                          style: TextStyle(fontSize: 30.0),
                        )),
                  ),

                  ImageX(numX)
                  //ImageAstro(numAstro)
                  // ImageAstro1(imageAstroo)
                  // Image.asset('assets/images/'+imageAstroo)
                ],
              )
            ],
          )),
    );
  }
}
