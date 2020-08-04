import 'package:flutter/material.dart';
import 'package:mini_project_android_version/data/fournisseurs_data.dart';
import 'package:mini_project_android_version/screens/add_fournisseur.dart';
import 'package:provider/provider.dart';

import 'single_fournisseur.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-fournisseur';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final fournisseursData = Provider.of<FournisseursData>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fournisseurs',
          style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AddFournisseur.routeName);
        },
      ),
      body: Container(
        child: ListView.builder(
          itemCount: fournisseursData.fournisseurs.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  FournisseurDetails.routeName,
                  arguments: fournisseursData.fournisseurs[index].id,
                );
              },
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      size: 15,
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(fournisseursData.fournisseurs[index].nom),
                  ],
                ),
                subtitle: Row(
                  children: <Widget>[
                    Icon(Icons.phone, size: 15),
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(fournisseursData.fournisseurs[index].telephone),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.amber,
                  ),
                  onPressed: null,
                ),
              ),
            );
        
          },
        ),
      ),
    );
  }
}
