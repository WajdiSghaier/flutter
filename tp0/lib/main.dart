import 'package:flutter/material.dart';
//import 'package:tp1/Atelier5/AddEtudiant.dart';
import 'package:tp1/Atelier5/AjoutEtudiant.dart';
import 'package:tp1/Atelier5/listEtudiant.dart';
import 'package:tp1/Atelier5/listeetudiant.dart';
import 'package:tp1/exeIcone.dart';
import 'package:tp1/execompteur.dart';
import 'package:tp1/exeimage.dart';
import 'package:tp1/tp3app.dart';
import 'package:tp1/tp3ex1.dart';
import 'package:tp1/tp1.dart';
import 'package:tp1/tp2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //@override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: AjoutEtud(),
      //home: ListEtudiant(),
      //home: PageSms(),
      home: Astro(),
    );
  }
}
