import 'package:flutter/material.dart';
import 'package:mini_project_android_version/data/fournisseurs_data.dart';
import 'package:mini_project_android_version/screens/add_fournisseur.dart';
import 'package:mini_project_android_version/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'screens/single_fournisseur.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (_) => FournisseursData(),
          child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fournisseur',
          theme: ThemeData(
            primarySwatch: Colors.amber,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomeScreen(),
          routes: {
            HomeScreen.routeName: (ctx) => HomeScreen(),
            AddFournisseur.routeName: (ctx) => AddFournisseur(),
            FournisseurDetails.routeName: (ctx) => FournisseurDetails(),
          }),
    );
  }
}
