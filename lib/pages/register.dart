import 'package:flutter/material.dart';
import 'package:gymtastic/behaviors/hiddenScrollBehavior.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gymtastic/ui/blur_background.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



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
      await Navigator.of(context)
          .pushReplacementNamed('/maintabs');
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
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






  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _name;
  String _lastname;
  String _born;
  String _email;
  String _password;
  String _city;

  bool _isRegistering = false;


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
      await Navigator.of(context)
          .pushReplacementNamed('/maintabs');
    } catch (e) {
      print(e);
    }
  }



//  _signInWithFacebook() async {
//    final facebookLogin = new FacebookLogin();
//    final result = await facebookLogin.logInWithReadPermissions(['email']);
//    switch (result.status) {
//      case FacebookLoginStatus.loggedIn:
//        print(result.accessToken.token);
//        break;
//      case FacebookLoginStatus.cancelledByUser:
//        print('Canceled by user');
//        break;
//      case FacebookLoginStatus.error:
//        print(result.errorMessage);
//        break;
//
//    }
//
//  }

//  FirebaseAuth _auth = FirebaseAuth.instance;
//
//  Future<FirebaseUser> _loginWithFacebook() async {
//
//    var facebookLogin = new FacebookLogin();
//    var result = await facebookLogin.logInWithReadPermissions(['email']);
//
//    debugPrint(result.status.toString());
//
//    if (result.status == FacebookLoginStatus.loggedIn) {
//      FirebaseUser user =
//      await _auth.signInWithFacebook(accessToken: result.accessToken.token);
//      return user;
//    }
//    return null;
//
//  }






  _register() async {
    if (_isRegistering) return;
    setState(() {
      _isRegistering = true;
    });

    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Registering user'),
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
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email, password: _password);
      Navigator.of(context).pushReplacementNamed('/maintabs');
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
//      appBar: AppBar(
//
//        title: Text('Register'),
//
//      ),

      body: Container(




        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
            behavior: HiddenScrollBehavior(),
            child: Form(
              key: _formKey,
              child: ListView(
                children:

                <Widget>[

                  Image.asset('assets/logo2.png'),

                  TextFormField(autocorrect: false,
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
                  TextFormField(obscureText: true,
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

                  TextFormField(autocorrect: false,
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

                  TextFormField(autocorrect: false,
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

                  TextFormField(autocorrect: false,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(labelText: 'Fecha de nacimiento'),
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter your birth';
                      } else
                        return null;
                    },
                    onSaved: (val) {
                      setState(() {
                        _born = val;
                      });
                    },
                  ),

                  TextFormField(autocorrect: false,
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

                  Separator,


              //Boton de ingreso con Google
              Container(

                width: 300,
                height: 50,
                margin: EdgeInsets.only(top: 26),
                child: FlatButton.icon(
                  icon: Icon(FontAwesomeIcons.google),
                  label: Text('Google'),
                  onPressed: () {_signInWithGoogle();},
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  textColor: Colors.white,
                ),
              ),

              Separator2,

              //Boton de ingreso con Facebook
              Container(
                width: 300,
                height: 50,
                margin: EdgeInsets.only(top: 26),
                child: FlatButton.icon(
                  icon: Icon(FontAwesomeIcons.facebook),
                  onPressed: () {},
                  label: Text('Facebook'),
                  color: Color.fromARGB(255, 37, 71, 155),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  textColor: Colors.white,
                ),
              ),




                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),

                    child: Text('Welcome to GymTastic!', style: TextStyle(
                        color: Color.fromARGB(255, 200, 200, 200)),),
                  )
                ],
              ),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _register();
        },
        child: Icon(Icons.person_add),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(onPressed: () {
          Navigator.of(context).pushNamed('/login');
        },
          child: Text('I already have an account'),
        )
      ],
    );
  }
}




var facebookSignInButton = Container(
  width: 300,
  height: 50,
  margin: EdgeInsets.only(top: 26),
  child: FlatButton.icon(
    icon: Icon(FontAwesomeIcons.facebook),
    onPressed: () {},
    label: Text('Facebook'),
    color: Color.fromARGB(255, 37, 71, 155),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    textColor: Colors.white,
  ),
);



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