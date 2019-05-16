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
        child: 
        new Image(image: new AssetImage("assets/gym3.gif"))
      ),
    );
  }


}