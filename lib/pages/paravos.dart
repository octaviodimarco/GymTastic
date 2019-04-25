import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParaVosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParaVosPageState();
}

class _ParaVosPageState extends State<ParaVosPage> {

  _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacementNamed('/register');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ParaVos'),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () {
              _logout();
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
