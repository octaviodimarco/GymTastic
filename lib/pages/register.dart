import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gymtastic/behaviors/hiddenScrollBehavior.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gymtastic/services/crud.dart';
//import 'package:gymtastic/ui/blur_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gymtastic/services/usermanagement.dart';

import 'package:overlay_support/overlay_support.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  _signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final firebaseUser =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print('Signed in as: ' + firebaseUser.displayName);
      await Navigator.of(context).pushReplacementNamed('/maintabs');
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: <Widget>[
              FlutterLogo(
                size: 150,
              ),
              Padding(
                padding: EdgeInsets.all(32),
                child: Text(
                  'Firebase Auth + Google Auth',
                  textAlign: TextAlign.center,
                ),
              ),

//              RaisedButton.icon(
//                icon: Icon(FontAwesomeIcons.google),
//                label: Text('Sign in with Google'),
//                onPressed: _signInWithGoogle,
//                color: Theme.of(context).primaryColor,
//                textColor: Colors.white,
//              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  crudMethods crudObj = crudMethods();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _name;
  String _lastname;
  String _born;
  String _email;
  String _password;
  String _city;
  var datos;

  bool _isRegistering = false;


  TextEditingController customController = TextEditingController();

  Future<String> createAlertDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Ingrese la clave de profesor"),
        content: TextField(
          controller: customController,

        ),
        actions: <Widget>[
          MaterialButton(elevation: 5.0,
          child: Text('Enviar'),
          onPressed: (){
            Navigator.of(context).pop(customController.text.toString());
          },)
        ],
      );
    });
  }
/*
  ____    _  _____  _    ____    _    ____  _____ 
 |  _ \  / \|_   _|/ \  | __ )  / \  / ___|| ____|
 | | | |/ _ \ | | / _ \ |  _ \ / _ \ \___ \|  _|  
 | |_| / ___ \| |/ ___ \| |_) / ___ \ ___) | |___ 
 |____/_/   \_\_/_/   \_\____/_/   \_\____/|_____|                                                
*/
  final DocumentReference documentReference =
      Firestore.instance.document("myData/dummy");

  int probador = 0;
  String usuario = "Alumno";
  String _claveSecreta = "123";
  
  String Prueba = null;

  // StreamSubscription<DocumentSnapshot> subscription;


  // void _add() {
  //   Map<String, String> data = <String, String>{
  //     "name": "Octavio",
  //     "desc": "CEO"
  //   };
  //   documentReference.setData(data).whenComplete(() {
  //     print("Document Added");
  //   }).catchError((e) => print(e));
  // }

  // void _update() {
  //   Map<String, String> data = <String, String>{
  //     "name": "Octavio Updated",
  //     "desc": "CEO Updated"
  //   };
  //   documentReference.updateData(data).whenComplete(() {
  //     print("Document Updated");
  //   }).catchError((e) => print(e));
  // }

  // void _fetch() {
  //   documentReference.get().then((datasnapshot) {
  //     if (datasnapshot.exists) {
  //       setState(() {
  //         Prueba = datasnapshot.data['desc'];
  //       });
  //     }
  //   });
  // }

  int usuario1 = 0;
  void userchange(){
    setState(()=> usuario1++);
    
  }

  void tipousuario(){
    if (usuario1 == 1)
    usuario = 'Profesor';
    else 
      usuario='Alumno';
      
    
  }

  void _delete() {
    documentReference.delete().whenComplete(() {
      print("Deleted Successfully");
      setState(() {});
    }).catchError((e) => print(e));
  }

// @override
// void initState(){
//     crudObj.getData().then((results){
//       setState((){
//         datos = results;
//       });
//     });
//     super.initState();
//   }

  // @override
  // void dispose() {
  //   super.dispose();
  //   subscription?.cancel();
  // }

/* 
   ____  ___   ___   ____ _     _____    ____ ___ ____ _   _    ___ _   _ 
  / ___|/ _ \ / _ \ / ___| |   | ____|  / ___|_ _/ ___| \ | |  |_ _| \ | |
 | |  _| | | | | | | |  _| |   |  _|    \___ \| | |  _|  \| |   | ||  \| |
 | |_| | |_| | |_| | |_| | |___| |___    ___) | | |_| | |\  |   | || |\  |
  \____|\___/ \___/ \____|_____|_____|  |____/___\____|_| \_|  |___|_| \_|
                                                                          
*/

  _signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final firebaseUser =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print('Signed in as: ' + firebaseUser.displayName);
      await Navigator.of(context).pushReplacementNamed('/maintabs');
    } catch (e) {
      print(e);
    }
  }

  _register() async {
    if (_isRegistering) return;
    setState(() {
      _isRegistering = true;
    });

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text('Registering user'),
    ));

    final form = _formKey.currentState;

    if (!form.validate()) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
        _isRegistering = false;
      });
      return;
    }

    form.save();

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _email, password: _password);
      crudObj.addData({
            'e-mail': this._email,
            'Nombre': this._name,
            'Apellido': this._lastname,
            'Ciudad': this._city,
            'TipoUsuario': this.usuario,
          });
          if (usuario == 'Profesor') {
      Navigator.of(context).pushReplacementNamed('/maintabsprofe');
          }
          else {
            Navigator.of(context).pushReplacementNamed('/maintabs');
          }
    } catch (e) {
      // error
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(e.message),
        duration: Duration(seconds: 10),
        action: SnackBarAction(
            label: 'Dismiss',
            onPressed: () {
              _scaffoldKey.currentState.hideCurrentSnackBar();
            }),
      ));
    } finally {
      setState(() {
        _isRegistering = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
            behavior: HiddenScrollBehavior(),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Image.asset('assets/logo2.png'),

                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid email';
                      } else
                        return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _email = val;
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter a valid password';
                      } else
                        return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _password = val;
                      });
                    },
                  ),

                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Nombre'),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter your name';
                      } else
                        return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _name = val;
                      });
                    },
                  ),

                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Apellido'),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter your last name';
                      } else
                        return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _lastname = val;
                      });
                    },
                  ),

                  // TextFormField(autocorrect: false,
                  //   keyboardType: TextInputType.datetime,
                  //   decoration: InputDecoration(labelText: 'Fecha de nacimiento'),

                  //   validator: (val) {
                  //     if (val.isEmpty) {
                  //       return 'Please enter your birth';
                  //     } else
                  //       return null;
                  //   },
                  //   onSaved: (val) {
                  //     setState(() {
                  //       _born = val;
                  //     });
                  //   },
                  // ),

                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Ciudad'),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter your city';
                      } else
                        return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _city = val;
                      });
                    },
                  ),

                  // DropdownButton<String>(
                  //   items: <String>['Alummo', 'Profesor'].map((String value) {
                  //     return new DropdownMenuItem<String>(
                  //       value: value,
                  //       child: new Text(value),
                  //     );
                  //   }).toList(),
                  //   onChanged: (_) {},
                  //   hint: Text("Por favor seleccione el tipo de usuario"),
                  // ),

                
                  
                  
                  Container(
                    width: 300,
  height: 50,
  margin: EdgeInsets.all(10),
  child: FlatButton(
    onPressed: (){
            createAlertDialog(context).then((onValue) {
              if("$onValue" == _claveSecreta){
               userchange();
               usuario = 'Profesor';
               showSimpleNotification(
              context,
              Text(
                "Bienvenido profe!",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20)),
              ),
              background: Colors.grey[600]);
              }
              else {
                showSimpleNotification(
              context,
              Text(
                "Contraseña incorrecta, por favor intente nuevamente",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20)),
              ),
              background: Colors.grey[600]);
              }
            
              
            });
          },
          child: Text('Soy $usuario',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        )
      
                  ),

                 

                  Separator,

                  //Boton de ingreso con Google
                  Container(
                    width: 300,
                    height: 50,
                    margin: EdgeInsets.only(top: 26),
                    child: FlatButton.icon(
                      icon: Icon(FontAwesomeIcons.google),
                      label: Text('Google'),
                      onPressed: () {
                        _signInWithGoogle();
                      },
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      textColor: Colors.white,
                    ),
                  ),

                  // Separator2,

                  // //Boton de ingreso con Facebook
                  // Container(
                  //   width: 300,
                  //   height: 50,
                  //   margin: EdgeInsets.only(top: 26),
                  //   child: FlatButton.icon(
                  //     icon: Icon(FontAwesomeIcons.facebook),
                  //     onPressed: () {},
                  //     label: Text('Facebook'),
                  //     color: Color.fromARGB(255, 37, 71, 155),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(5)),
                  //     ),
                  //     textColor: Colors.white,
                  //   ),
                  // ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Welcome to GymTastic!',
                      style:
                          TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                    ),
                  )
                ],
              ),
            )),
            
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _register();
          // crudObj.addData({
          //   'e-mail': this._email,
          //   'Nombre': this._name,
          //   'Apellido': this._lastname,
          //   'Ciudad': this._city,
          //   'TipoUsuario': this.usuario,
          // });
        },
        child: Icon(Icons.person_add),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/login');
          },
          child: Text('I already have an account'),
        )
      ],
    );
  }




}

// var facebookSignInButton = Container(
//   width: 300,
//   height: 50,
//   margin: EdgeInsets.only(top: 26),
//   child: FlatButton.icon(
//     icon: Icon(FontAwesomeIcons.facebook),
//     onPressed: () {},
//     label: Text('Facebook'),
//     color: Color.fromARGB(255, 37, 71, 155),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.all(Radius.circular(5)),
//     ),
//     textColor: Colors.white,
//   ),
// );

var googleSignInButton = Container(
  width: 300,
  height: 50,
  margin: EdgeInsets.only(top: 26),
  child: FlatButton.icon(
    icon: Icon(FontAwesomeIcons.google),
    label: Text('Google'),
    onPressed: () {},
    color: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    textColor: Colors.white,
  ),
);


// var TipoUsuario = Container(
//   width: 300,
//   height: 50,
//   margin: EdgeInsets.only(top: 26),
//   child: FlatButton(
//     onPressed: (){
//             createAlertDialog(context);
//           },
//           child: Text('Soy profesor'),
//         )
//       );
      
//       Future<String> createAlertDialog(BuildContext context) {
// return showDialog(context: context, builder: (context){
//       return AlertDialog(
//         title: Text("Ingrese la clave de profesor"),
//         content: TextField(
//           controller: customController,

//         ),
//         actions: <Widget>[
//           MaterialButton(elevation: 5.0,
//           child: Text('Enviar'),
//           onPressed: (){},)
//         ],
//       );
//     });
// }
// TextEditingController customController = TextEditingController();




var Separator = Container(
  width: 312,
  height: 17,
  margin: EdgeInsets.only(top: 26),
  child: Stack(
    fit: StackFit.expand,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "or Sign In using",
            style: TextStyle(
              color: Color.fromARGB(255, 156, 156, 156),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      Row(
        children: [
          Container(
            width: 124.5,
            height: 1,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 156, 156, 156),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 124.5,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 156, 156, 156),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
);

var Separator2 = Container(
  width: 312,
  height: 17,
  margin: EdgeInsets.only(top: 26),
  child: Stack(
    fit: StackFit.expand,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "or",
            style: TextStyle(
              color: Color.fromARGB(255, 156, 156, 156),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      Row(
        children: [
          Container(
            width: 124.5,
            height: 1,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 156, 156, 156),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 124.5,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 156, 156, 156),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
);

// var SeleccionUsuario = Container(
//   alignment: Alignment.center,
//   child: ListView(
//     children: <Widget>[
//       Container(
//         padding: EdgeInsets.all(10),
//         width: 100,
//         height: 100,
//         child: Text("Seleccione el tipo de usuario",
//         style: TextStyle(color: Colors.black))
//       ),

//       Row(children: <Widget>[
//         Container(
//           margin: const EdgeInsets.all(10),
//           width: 100,
//         height: 100,
//           child: Text("Alumno",
//           textAlign: TextAlign.center,
//           style: TextStyle(color:Colors.black),
//           ),

//         ),
//         Container(
//           margin: const EdgeInsets.all(10),
//           width: 100,
//         height: 100,
//           child: Text("Alumno",
//           textAlign: TextAlign.center,
//           style: TextStyle(color:Colors.black),
//           ),
//         )
//       ],)
//     ],
//   ),
// );

class Datos {
  final String _name;
  final String _lastname;

  Datos(this._name, this._lastname);

  String get nombre {
    return _name;
  }
}
