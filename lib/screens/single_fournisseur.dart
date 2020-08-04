import 'package:flutter/material.dart';
import 'package:mini_project_android_version/data/fournisseurs_data.dart';
import 'package:provider/provider.dart';

class FournisseurDetails extends StatelessWidget {
  static const routeName = '/details-fournisseur';

  @override
  Widget build(BuildContext context) {
    final fournisseurId = ModalRoute.of(context).settings.arguments as String;
    final loadedFournisseur =
        Provider.of<FournisseursData>(context, listen: false)
            .findById(fournisseurId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedFournisseur.nom,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.person,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  loadedFournisseur.nom.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Divider(
                color: Colors.black,
              ),
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.phone_android,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  loadedFournisseur.mobile.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              child: Divider(
                color: Colors.black,
              ),
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  loadedFournisseur.telephone.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              child: Divider(
                color: Colors.black,
              ),
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  loadedFournisseur.mail.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              child: Divider(
                color: Colors.black,
              ),
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.web,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  loadedFournisseur.siteweb.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Divider(
                color: Colors.black,
              ),
              height: 25.0,
            ),
          ],
        ),
      ),
    );
  }
}
