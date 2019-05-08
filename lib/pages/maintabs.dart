import 'package:flutter/material.dart';
import 'package:gymtastic/pages/horarios.dart';
import 'package:gymtastic/pages/paravos.dart';
//import 'package:gymtastic/pages/settings.dart';
import 'package:gymtastic/pages/plan.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:gymtastic/pages/profile.dart';

/* Posibles colores:
0xff8356ba1 (Azul marino)
 */
class MainTabsPage extends StatelessWidget {








  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: DefaultTabController(length: 3, child: Scaffold(






        appBar: AppBar(

          backgroundColor: Color(0xffe8e8e8),
          centerTitle: false,
          elevation: 3.0,
//          leading: Image.asset("assets/perfildefault.png",),

          title: Container(height: 40, alignment: Alignment.topRight,
              child: Image.asset("assets/logo2.png",)),




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
          
          // child: new ListView(
          //   children: <Widget>[
          //     new UserAccountsDrawerHeader(accountName: null,
          //         accountEmail: null,
          //       currentAccountPicture: new CircleAvatar(

          //         backgroundColor: Colors.red,

          //       child: new Text("P"),
          //       ),

          //     ),
          //     ListTile(
          //       title: Text("Close"),
          //       trailing: Icon(Icons.close),
          //       onTap: () {
          //         Navigator.of(context).pushNamed('/profile');},

          //     ),



            //   Container(
            //   // This align moves the children to the bottom
            //   child: Align(
            //       alignment: FractionalOffset.bottomCenter,
            //       // This container holds all the children that will be aligned
            //       // on the bottom and should not scroll with the above ListView
            //       child: Container(
            //           child: Column(
            //         children: <Widget>[
            //           Divider(),
            //           ListTile(
            //               leading: Icon(Icons.settings),
            //               title: Text('Settings')),
            //           ListTile(
            //               leading: Icon(Icons.help),
            //               title: Text('Help and Feedback'))
            //         ],
            //       )
            //     )
            //   )
            // ),
              
          child: new Column(
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
  new UserAccountsDrawerHeader(accountName: null,
                  accountEmail: null,
                currentAccountPicture: new CircleAvatar(

                  backgroundColor: Colors.red,

                child: new Text("P"),
                ),

              ),
              ListTile(
                title: Text("Configuracion de perfil"),
                trailing: Icon(Icons.supervised_user_circle),
                onTap: () {
                  Navigator.of(context).pushNamed('/profile');},

              ),
              ListTile(
                title: Text("Estadisticas de usuario"),
                trailing: Icon(Icons.assessment),
                onTap: () {},

              ),
              


      new Expanded(
        child: new Align(
          alignment: Alignment.bottomCenter,
          child: 
          ListTile(
            title: Text("Cerrar sesion"),
            trailing: Icon(Icons.close),
            onTap: (){
 FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamed('/register');

            },
          ),
          
        
          
          
        ),
      )






            ],


          ),
          
          



        ),

        body:


        TabBarView(children: [
          ParaVosPage(),
          PlanPage(),
          HorariosPage(),
        ]),





      )),



    );
  }
}



//
//class MainTabsPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//
//      body: DefaultTabController(
//        length: 3,
//        child: new Scaffold(
//          body: TabBarView(
//              children: <Widget>[
//                PlanPage(),
//                ParaVosPage(),
//                HorariosPage()
//              ]
//          ),
//
//          bottomNavigationBar: PreferredSize(
//            preferredSize: Size(60.0, 60.0),
//            child: Container(
//              height: 60.0,
//
//              child: TabBar(
//                labelColor: Theme.of(context).toggleableActiveColor,
//                labelStyle: TextStyle(fontSize: 10.0),
//                tabs: <Widget>[
//                  Tab(
//
//                    text: 'PARA VOS',),
//                  Tab(
//
//                    text: 'PLAN',),
//                  Tab(
//
//                    text: 'HORARIOS',)
//                ],
//              ),
//            ),),
//        ),
//      ),
//
//      bottomNavigationBar: CurvedNavigationBar(
//        backgroundColor: Colors.grey,
//        items: <Widget>[
//          Icon(Icons.add, size: 30),
//          Icon(Icons.list, size: 30),
//          Icon(Icons.compare_arrows, size: 30),
//        ],
//        onTap: (index) {
//          //Handle button tap
//        },
//      ),
//
//
//
//    );
//
//
//
//
//  }
//
//
//
//}