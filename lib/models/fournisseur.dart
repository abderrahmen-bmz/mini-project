import 'package:flutter/cupertino.dart';

class Fournisseur {
  Fournisseur({
     this.id,
    @required this.nom,
    @required this.telephone,
    @required this.mobile,
    @required this.mail,
    @required this.siteweb,
  });

  final String id;
  final String nom;
  final String telephone;
  final String mobile;
  final String mail;
  final String siteweb;
}
