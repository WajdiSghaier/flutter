import 'dart:ui';

//import 'package:atelier4/models/etudiant.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tp1/Atelier5/model/etudiant.dart';
//import 'package:tp1/models/etudiant.dart';

class DataBaseHelper {
  DataBaseHelper._privateConstructor();

  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  DataBaseHelper();

  static Database? _database;

  Future<Database> get database async => _database ??= await initDatabase();

  Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'etudiant.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      //onUpgrade:_onupgrade,
      //onDowngrade:
    );
  }

  Future _onCreate(Database db, int version) async {
    print("Creatin database...........");
    await db.execute('''
      CREATE TABLE Etudiant(
      id INTEGER PRIMARY KEY ,
      matricule TEXT Not Null ,
      nom TEXT Not Null ,
      prenom TEXT Not Null ,
      age integer  );
      ''');
    print('Creation Base de donnes Etudiant.db Terminé avec succes');
  }

  Future<int> add(Etudiant etd) async {
    Database db = await instance.database;
    return await db.insert('Etudiant', etd.toMap());
  }

  Future getEtudiants() async {
    Database db = await instance.database;

    return await db.rawQuery("Select * from Etudiant");
  }
}

  
  

  /* Future<List<Etudiant>> getEtudiants() async {
    Database db = await instance.database;
    List<Etudiant> listesetudiants_tmp;
    listesetudiants_tmp = await db.rawQuery("Select * from Etudiant");
    //print('ici $listesarticles_tmp');
    return listesetudiants_tmp;

  }

  Future deleteArticle(int id) async {
    Database db = await instance.database;
    return await db.rawQuery("DELETE FROM produits WHERE id=$id");
  }*/


