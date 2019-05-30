import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:gymtastic/pages/Profesor/alumnos.dart';
import 'package:gymtastic/pages/Profesor/ejerciciosprofe.dart';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:gymtastic/pages/register.dart';
import 'package:gymtastic/services/crud.dart';

/* Posibles colores:
0xff8356ba1 (Azul marino)
 */
class MainTabsProfePage extends StatefulWidget {
  @override
    _MainTabsProfePageState createState() => _MainTabsProfePageState();
}
class _MainTabsProfePageState extends State<MainTabsProfePage>{
  
   QuerySnapshot datos;

  crudMethods crudObj = new crudMethods();

  @override
  void initState(){
      crudObj.getData().then((results){
        setState((){
                  datos = results;
                });
              });
        
          }
        
        
        
          @override
          Widget build(BuildContext context) {
            return MaterialApp(
              theme: ThemeData(primarySwatch: Colors.blueGrey),
              home: DefaultTabController(
                  length: 2,
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
                          Tab(text: "Alumnos"),
                          Tab(text: "Ejercicios"),
                          
                        ],
                      ),
                    ),
                    drawer: new Drawer(
                      child: new Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          new UserAccountsDrawerHeader(
                            accountName: Text(
                              'Sos profe wacho',
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
                           
                          // ListTile(
                            
                          //   title: Text("Estadisticas de usuario",
                          //       style: TextStyle(fontSize: 16.5)),
                          //   trailing: Icon(Icons.assessment),
                          //   onTap: () {},
                          // ),
        
                          ListTile(
                            title: Text(
                              "About Us",
                              style: TextStyle(fontSize: 16.5),
                            ),
                            trailing: Icon(Icons.info),
                            onTap: () {},
                          ),
                          
        ListTile(
                            title: Text(
                              datos.documents[1].data['Nombre'],
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
                      AlumnosPage(),
                      EjerciciosProfePage(),
                      
                    ]),
                  )),
            );
          }
        



Widget _dataList(){
if (datos != null){
  return ListView.builder(
    itemCount: datos.documents.length,
    padding: EdgeInsets.all(5.0),
    itemBuilder: (context, i) {
      return ListTile(
        title: Text(datos.documents[i].data['Nombre']),
        subtitle: Text(datos.documents[i].data['Apellido']),
      );
    },
  );
}
else {
  return Text('Loading, Please wait');
}

}

}


