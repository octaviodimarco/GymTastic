import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HorariosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HorariosPageState();
}
class _HorariosPageState extends State<HorariosPage> {

  _logout() async {
    await FirebaseAuth.instance.signOut();

    //   Navigator.of(context).pushReplacementNamed('/register');



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
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