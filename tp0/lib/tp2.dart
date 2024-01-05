import 'package:flutter/material.dart';

class PageSms extends StatefulWidget {
  const PageSms({Key? key}) : super(key: key);

  @override
  State<PageSms> createState() => _PageSmsState();
}

class _PageSmsState extends State<PageSms> {
  final formkey = GlobalKey<FormState>();

  late List<String> lstMessage = [];
  late String lstMess;

  late String numGsm = '';

  late String nomOperateur = '';
  late Color coul = Colors.white;

  late String nomImage = '';

  void alert(String lst) {
    AlertDialog alert = AlertDialog(
      title: Text("Erreur"),
      content: Text(lst),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Icon(Icons.cancel),
        )
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget ImageOp(String op) {
    if (op == 'Telecom') {
      return ClipOval(
          child: Image.asset(
        'assets/images/TTL.png',
        width: 70.0,
        fit: BoxFit.fitWidth,
      ));
    } else if (op == 'Ooredoo')
      return ClipOval(
          child: Image.asset(
        'assets/images/ooredoo.png',
        width: 70.0,
      ));
    else if (op == 'Orange')
      return ClipOval(
          child: Image.asset(
        'assets/images/orange.png',
        width: 70.0,
      ));
    else
      return Text('');
  }

  Widget ImageOp1(String op) {
    if (op == 'Telecom')
      return CircleAvatar(
        backgroundImage: AssetImage("assets/images/Telecom"),
        radius: 10.0,
      );
    else if (op == 'Ooredoo')
      return CircleAvatar(
        backgroundImage: AssetImage('assets/images/ooredoo.png'),
        radius: 35.0,
      );
    else if (op == 'Orange')
      return CircleAvatar(
        backgroundImage: AssetImage('assets/images/orange.png'),
        radius: 35.0,
      );
    else
      return Text('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau SMS'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 5.0, left: 5.0, right: 5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20.0),
                    decoration: InputDecoration(
                        labelText: 'N°GSM',
                        labelStyle:
                            TextStyle(fontSize: 20.0, color: Colors.black),
                        fillColor: Colors.blue.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        hintText: 'Entrer Numero Gsm',
                        hintStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                    validator: (String? value) {
                      if (value!.length != 11) {
                        lstMessage.add('Format GSM Obligatoire');
                        lstMess += 'Format GSM Obligatoire ';
                        return 'Format GSM Obligatoire';
                      }
                    },
                    onSaved: (String? value) {
                      numGsm = value!;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20.0),
                    decoration: InputDecoration(
                        labelText: 'Titre',
                        labelStyle:
                            TextStyle(fontSize: 20.0, color: Colors.black),
                        fillColor: Colors.blue.withOpacity(0.5),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                        hintText: 'Entrer Titre Gsm',
                        hintStyle:
                            TextStyle(fontSize: 15.0, color: Colors.white)),
                    validator: (String? value) {
                      // if (value!.isEmpty) {
                      //   lstMessage.add('Titre Obligatoire');
                      //   return ' ';
                      // }
                      if (value!.length > 10) {
                        lstMessage.add('Taille Titre erroné');
                        lstMess += 'Taille Titre erroné';

                        return ' ';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20.0),
                      decoration: InputDecoration(
                          labelText: 'Detail',
                          labelStyle:
                              TextStyle(fontSize: 20.0, color: Colors.black),
                          fillColor: Colors.blue.withOpacity(0.5),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none),
                          hintText: 'Detail Gsm',
                          hintStyle:
                              TextStyle(fontSize: 15.0, color: Colors.white)),
                      validator: (String? value) {
                        // if (value!.isEmpty) {
                        //   lstMessage.add('Detail Obligatoire');
                        //   return ' ';
                        // }
                        if (value!.length > 10) {
                          lstMessage.add('Taille Detail Erronée');
                          lstMess += '/n Taille Detail Erronée';
                          return ' ';
                        }
                        return null;
                      }),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          lstMess = '';
                          lstMessage.clear();
                          nomOperateur = '';
                          nomImage = '';
                          setState(() {
                            if (formkey.currentState!.validate()) {
                              formkey.currentState!.save();
                              if (numGsm.startsWith('9')) {
                                nomOperateur = 'Telecom';
                                coul = Colors.blue;
                                nomImage = 'TTL.png';
                              } else if (numGsm.startsWith('2')) {
                                nomOperateur = 'Ooredoo';
                                coul = Colors.red;
                                nomImage = 'ooredoo.png';
                              } else if (numGsm.startsWith('5')) {
                                nomOperateur = 'Orange';
                                coul = Colors.orange;
                                nomImage = 'orange.png';
                              }
                              //print('ici'+lstMessage[0]);
                              // print('ici');
                            } else {
                              alert(lstMess);
                              //print(lstMessage);
                            }
                          });
                        },
                        child: Text('Envoyer')),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              nomOperateur,
                              style: TextStyle(color: coul, fontSize: 25.0),
                            ),
                          ),
                          ImageOp(nomOperateur)
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
