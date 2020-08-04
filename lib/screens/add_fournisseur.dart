import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_project_android_version/data/fournisseurs_data.dart';
import 'package:mini_project_android_version/models/fournisseur.dart';
import 'package:provider/provider.dart';

class AddFournisseur extends StatefulWidget {
    static const routeName = '/add-fournisseur';

  @override
  _AddFournisseurState createState() => _AddFournisseurState();
}

class _AddFournisseurState extends State<AddFournisseur> {
  final _nomFocusNode = FocusNode();
  final _telephoneFocusNode = FocusNode();
  final _mobileFocusNode = FocusNode();
  final _mailFocusNode = FocusNode();
  final _sitewebFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  @override
  void dispose() {
    _nomFocusNode.dispose();
    _telephoneFocusNode.dispose();
    _mobileFocusNode.dispose();
    _mailFocusNode.dispose();
    _sitewebFocusNode.dispose();
    super.dispose();
  }

  var _editedFournisseur = Fournisseur(
    id: null,
    nom: '',
    telephone: '',
    mobile: '',
    mail: '',
    siteweb: '',
  );
  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    //FournisseursData.addFournisseur(_editedFournisseur);
    Provider.of<FournisseursData>(context).addFournisseur(_editedFournisseur);
    // print(_editedFournisseur.nom);
    // print(_editedFournisseur.telephone);
    // print(_editedFournisseur.mobile);
    // print(_editedFournisseur.mail);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ajoute Fournisseur',
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.save,
          color: Colors.white,
        ),
       onPressed: _saveForm,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
            key: _form,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nom',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please nom a value.';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_telephoneFocusNode);
                  },
                  onSaved: (value) {
                    _editedFournisseur = Fournisseur(
                      nom: value,
                      telephone: _editedFournisseur.telephone,
                      mobile: _editedFournisseur.mobile,
                      mail: _editedFournisseur.mail,
                      siteweb: _editedFournisseur.siteweb,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Telephone',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please nom a value.';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_mobileFocusNode);
                  },
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    _editedFournisseur = Fournisseur(
                      nom: _editedFournisseur.nom,
                      telephone: value,
                      mobile: _editedFournisseur.mobile,
                      mail: _editedFournisseur.mail,
                      siteweb: _editedFournisseur.siteweb,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mobile',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Svp nom a value.';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_mailFocusNode);
                  },
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    _editedFournisseur = Fournisseur(
                      nom: _editedFournisseur.nom,
                      telephone: _editedFournisseur.telephone,
                      mobile: value,
                      mail: _editedFournisseur.mail,
                      siteweb: _editedFournisseur.siteweb,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Mail',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please nom a value.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_sitewebFocusNode);
                  },
                  onSaved: (value) {
                    _editedFournisseur = Fournisseur(
                      nom: _editedFournisseur.nom,
                      telephone: _editedFournisseur.telephone,
                      mobile: _editedFournisseur.mobile,
                      mail: value,
                      siteweb: _editedFournisseur.siteweb,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Site Web',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please entre an image URL.';
                    }
                    if (!value.startsWith('www.')) {
                      return 'Please entre a valid URL.';
                    }
                    if (!value.endsWith('.com') &&
                        !value.endsWith('.org') &&
                        !value.endsWith('.dz')) {
                      return 'Please enter a valid image URL.';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.url,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    _saveForm();
                  },
                  onSaved: (value) {
                    _editedFournisseur = Fournisseur(
                      nom: _editedFournisseur.nom,
                      telephone: _editedFournisseur.telephone,
                      mobile: _editedFournisseur.mobile,
                      mail: value,
                      siteweb: _editedFournisseur.siteweb,
                      //  id: _editedProduct.id,
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
