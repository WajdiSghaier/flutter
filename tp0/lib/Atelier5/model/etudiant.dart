import 'dart:convert';

class Etudiant {
  //int? idetd;
  String matricule;
  String nom;
  String prenom;
  int age;

  Etudiant({
    //this.idetd,
    this.matricule = "",
    this.nom = "",
    this.prenom = "",
    this.age = 0,
  });

  // get getMatricule => this.matricule;

  // get getId => this.idetd;

  set setMatricule(matricule) => this.matricule = matricule;

  get getNom => this.nom;

  set setNom(nom) => this.nom = nom;

  get getPrenom => this.prenom;

  set setPrenom(prenom) => this.prenom = prenom;

  get getAge => this.age;

  set setAge(age) => this.age = age;

  String toJson() => json.encode(toMap());

  factory Etudiant.fromJson(String source) =>
      Etudiant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Etudiant(matricule: $matricule, nom: $nom, prenom: $prenom, age: $age)';
  }

  Map<String, dynamic> toMap() {
    return {
      // 'id': this.idetd,
      'matricule': this.matricule,
      'nom': this.nom,
      'prenom': this.prenom,
      'age': this.age,
    };
  }

  factory Etudiant.fromMap(Map<String, dynamic> map) {
    return Etudiant(
      //idetd: map['id'] as int,
      matricule: map['matricule'] as String,
      nom: map['nom'] as String,
      prenom: map['prenom'] as String,
      age: map['age'] as int,
    );
  }
}
