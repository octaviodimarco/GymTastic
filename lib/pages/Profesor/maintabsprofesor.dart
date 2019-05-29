import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gymtastic/pages/horarios.dart';
import 'package:gymtastic/pages/paravos.dart';
//import 'package:gymtastic/pages/settings.dart';
import 'package:gymtastic/pages/plan.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:gymtastic/pages/register.dart';
import 'package:gymtastic/services/crud.dart';

/* Posibles colores:
0xff8356ba1 (Azul marino)
 */
class MainTabsProfePage extends StatelessWidget {
  // void initState(){
  //   crudObj.getData().then((results){
  //     setState((){
  //       cars = results;
  //     });
  //   });
  //   super.initState();
  // }

  // crudMethods crudObj = crudMethods();
  var datos;

// void initState(){
//     crudObj.getData().then((results){
//         datos = results;
//     });

//   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffe8e8e8),
              centerTitle: false,
              elevation: 3.0,
//          leading: Image.asset("assets/perfildefault.png",),

              title: Container(
                  height: 40,
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    "assets/logo2.png",
                  )),

              bottom: TabBar(
                labelColor: Color(0xff000000),
                tabs: [
                  Tab(text: "Para vos"),
                  Tab(text: "Plan"),
                  Tab(text: "Horarios"),
                ],
              ),
            ),
            drawer: new Drawer(
              child: new Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountName: Text(
                      'Ricardo Milos',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    accountEmail: null,
                    currentAccountPicture: new CircleAvatar(
                      backgroundColor: Colors.red,
                      child: new Text("R"),
                    ),
                  ),

                 
                  // StreamBuilder(
                  //     stream: Firestore.instance.collection('informacionUsuario').snapshots(),
                  //     builder: (context, snapshot) {
                  //       if(!snapshot.hasData)
                  //       return Text('Loading data.. Please Wait..');
                  //       return Column(

                  //         children: <Widget>[
                  //           Text(snapshot.data.documents[0]['Nombre']),
                  //           Text(snapshot.data.documents[0]['Apellido']),
                  //         ],
                  //       );
                  //     },
                  //   ),
                  ListTile(
                    title: Text(
                      "Configuracion de perfil",
                      style: TextStyle(fontSize: 16.5),
                    ),
                    trailing: Icon(Icons.supervised_user_circle),
                    onTap: () {
                      Navigator.of(context).pushNamed('/profile');
                    },
                  ),
                   
                  ListTile(
                    
                    title: Text("Estadisticas de usuario",
                        style: TextStyle(fontSize: 16.5)),
                    trailing: Icon(Icons.assessment),
                    onTap: () {},
                  ),

                  ListTile(
                    title: Text(
                      "About Us",
                      style: TextStyle(fontSize: 16.5),
                    ),
                    trailing: Icon(Icons.info),
                    onTap: () {},
                  ),

                  new Expanded(
                    child: new Align(
                      alignment: Alignment.bottomCenter,
                      child: ListTile(
                        title: Text("Cerrar sesion",
                            style: TextStyle(fontSize: 16.5)),
                        trailing: Icon(Icons.close),
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushNamed('/register');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              ParaVosPage(),
              PlanPage(),
              HorariosPage(),
            ]),
          )),
    );
  }
}

Widget build(BuildContext context) {
  return new StreamBuilder(
      stream: Firestore.instance
          .collection('informacionUsuarios')
          .document('Nombre')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return new Text("Loading");
        }
        var userDocument = snapshot.data;
        return new Text(userDocument["Nombre"]);
      });
}
