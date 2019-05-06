import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymtastic/routes.dart';





class ParaVosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParaVosPageState();
}

class _ParaVosPageState extends State<ParaVosPage> {

  _logout() async {
   await FirebaseAuth.instance.signOut();

   //   Navigator.of(context).pushReplacementNamed('/register');



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: new Color(0xfffffff),
//        centerTitle: false,
//        elevation: 3.0,
//        leading: Image.asset("assets/perfil.png",),
//        title: Container(height: 40, alignment: Alignment.topRight,
//            child: Image.asset("assets/logo2.jpg",)),
//
//      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              _logout();
              Navigator.of(context).pushReplacementNamed('/register');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Log out', style: TextStyle(color: Colors.red),),
                Spacer(),
                Icon(Icons.exit_to_app, color: Colors.red),
              ],
            )),
      ),
    );
  }
}
