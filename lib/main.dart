import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymtastic/pages/maintabs.dart';
import 'package:gymtastic/pages/register.dart';
import 'package:gymtastic/routes.dart';
import 'package:gymtastic/theme.dart';


void main() => runApp(new GymTasticApp());

class GymTasticApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GymTasticAppState();
}

class _GymTasticAppState extends State<GymTasticApp> {
  Widget _rootPage = RegisterPage();

  /*Esto carga la pagina principal en caso de que
  el usuario ya este loggeado */
  Future<Widget> getRootPage() async =>
      await FirebaseAuth.instance.currentUser() == null
          ? RegisterPage()
          : MainTabsPage();

  @override
  initState() {
    super.initState();

    getRootPage().then((Widget page) {
      setState(() {
        _rootPage = page;
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymTastic',
      home: _rootPage,
      routes: buildAppRoutes(),
      theme: buildAppTheme(),
    );
  }
}


