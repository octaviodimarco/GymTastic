import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymtastic/behaviors/hiddenScrollBehavior.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email;
  String _password;

  bool _isLoggingIn = false;

  _loggin() async {
    if (_isLoggingIn) return;
    setState(() {
      _isLoggingIn = true;
    });

    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text('Loggin in user'),
        ));

    final form = _formKey.currentState;

    if (!form.validate()) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
        _isLoggingIn = false;
      });
      return;
    }

    form.save();

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pop();
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
        _isLoggingIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
      ),
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      'Welcome to GymTastic!',
                      style:
                          TextStyle(color: Color.fromARGB(255, 200, 200, 200)),
                    ),
                  ),
                  FlatButton(
                    child: Text('I forgot my password'),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/forgotpassword');
                    },
                    textColor: Colors.blueGrey,
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _loggin();
        },
        child: Icon(Icons.check_circle),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("I don't have an account"),
        )
      ],
    );
  }
}
