import 'package:mini_project_android_version/models/fournisseur.dart';
import 'package:flutter/material.dart';

class FournisseursData with ChangeNotifier {
  List<Fournisseur> fournisseurs = [
    Fournisseur(
      id: '12351',
      nom: 'Omar AbdElahdi',
      telephone: '027141485',
      mobile: '0765859545',
      mail: 'Omar@gmail.coom',
      siteweb: "www.AbdElahdi.com",
    ),
    Fournisseur(
      id: '0102',
      nom: 'Sofiane Bouzid',
      telephone: '027415896',
      mobile: '0778989841',
      mail: 'sofiane@gmail.coom',
      siteweb: "www.sofiane.com",
    ),
      Fournisseur(
      id: '00258',
      nom: 'Abderrahmen Bmz',
      telephone: '027459632',
      mobile: '0778526391',
      mail: 'Abderrahmen@gmail.coom',
      siteweb: "www.Abderrahmen.com",
    ),
      Fournisseur(
      id: '1512',
      nom: 'Taha Karrouzi',
      telephone: '027589632',
      mobile: '07781258965',
      mail: 'Karrouzi@gmail.coom',
      siteweb: "www.Karrouzi.com",
    ),
      Fournisseur(
      id: '15154',
      nom: 'Djilali Boukabza',
      telephone: '025859632',
      mobile: '05552585963',
      mail: 'Boukabza@gmail.coom',
      siteweb: "www.Boukabza.com",
    ),
  ];

  void addFournisseur(Fournisseur fournisseur) {
    final newFournisseur = Fournisseur(
      id: DateTime.now().toString(),
      nom: fournisseur.nom,
      telephone: fournisseur.telephone,
      mobile: fournisseur.mobile,
      mail: fournisseur.mail,
      siteweb: fournisseur.siteweb,
    );
    fournisseurs.add(newFournisseur);
    notifyListeners();
  }

  void deleteFournisseur(String id) {
    fournisseurs.removeWhere((fournisseur) => fournisseur.id == id);
    notifyListeners();
  }

  Fournisseur findById(String id) {
    return fournisseurs.firstWhere((fournisseurs) => fournisseurs.id == id);
  }

  List<Fournisseur> get addNewFournisseurs {
    return [...fournisseurs];
  }
}
