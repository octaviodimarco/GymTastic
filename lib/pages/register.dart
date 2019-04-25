import 'package:flutter/material.dart';
import 'package:gymtastic/behaviors/hiddenScrollBehavior.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
            behavior: HiddenScrollBehavior(),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[

                  Image.asset('assets/logo2.jpg'),

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
