import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymtastic/routes.dart';





class ParaVosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParaVosPageState();
}

class _ParaVosPageState extends State<ParaVosPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
      // This next line does the trick.
      children: <Widget>[
      new SizedBox(
      height: 25.0,
      child: Text("NUEVOS ENTRENAMIENTOS",
      style: TextStyle(fontSize: 20.0),),
    ),
    new Container(
    height: 250.0,
    margin: EdgeInsets.all(10.0),
    child: new ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
    new Container(
    margin: EdgeInsets.all(10.0),
    child: new ClipRRect(
    borderRadius: new BorderRadius.circular(17.0),
    child: new Image(
    image: new AssetImage("assets/gym1.jpg"),
    height: 200.0,
    width: 200.0,
    fit: BoxFit.cover,
    ),

    ),
    ),
    new Container(
    margin: EdgeInsets.all(10.0),
    child: new ClipRRect(
    borderRadius: new BorderRadius.circular(17.0),
    child: new Image(
    image: new AssetImage("assets/gym2.jpg"),
    height: 200.0,
    width: 200.0,
    fit: BoxFit.cover,
    ),

    ),
    ),
    new Container(
    margin: EdgeInsets.all(10.0),
    child: new ClipRRect(
    borderRadius: new BorderRadius.circular(17.0),
    child: new Image(
    image: new AssetImage("assets/gym3.jpg"),
    height: 200.0,
    width: 200.0,
    fit: BoxFit.cover,
    ),

    ),
    )
    ],
    ),
    ),

    new SizedBox(
    height: 25.0,
    child: Text("OTRAS ACTIVIDADES DEL GYM",
    style: TextStyle(fontSize: 20.0),),
    ),
    new Container(
    height: 250.0,
    margin: EdgeInsets.all(10.0),
    child: new ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
    new Container(
    margin: EdgeInsets.all(10.0),
    child: new ClipRRect(
    borderRadius: new BorderRadius.circular(17.0),
    child: new Image(
    image: new AssetImage("assets/gym4.jpg"),
    height: 200.0,
    width: 200.0,
    fit: BoxFit.cover,
    ),

    ),
    ),
    new Container(
    margin: EdgeInsets.all(10.0),
    child: new ClipRRect(
    borderRadius: new BorderRadius.circular(17.0),
    child: new Image(
    image: new AssetImage("assets/gym5.jpg"),
    height: 200.0,
    width: 200.0,
    fit: BoxFit.cover,
    ),

    ),
    ),
    new Container(
    margin: EdgeInsets.all(10.0),
    child: new ClipRRect(
    borderRadius: new BorderRadius.circular(17.0),
    child: new Image(
    image: new AssetImage("assets/gym6.jpg"),
    height: 200.0,
    width: 200.0,
    fit: BoxFit.cover,
    ),

    ),
    )
    ],
    ),
    ),
    ]
      ),
    );
  }
}