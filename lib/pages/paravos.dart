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
      body: ListView(
          // This next line does the trick.
          children: <Widget>[
            new SizedBox(
              height: 15.0,
              child: Text("NUEVOS ENTRENAMIENTOS",),
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
              height: 15.0,
              child: Text("OTRAS ACTIVIDADES DEL GYM"),
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



//      appBar: AppBar(
//        backgroundColor: new Color(0xfffffff),
//        centerTitle: false,
//        elevation: 3.0,
//        leading: Image.asset("assets/perfil.png",),
//        title: Container(height: 40, alignment: Alignment.topRight,
//            child: Image.asset("assets/logo2.jpg",)),
//
//      ),
      ),
    );
  }
}
