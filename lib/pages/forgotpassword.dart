import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gymtastic/behaviors/hiddenScrollBehavior.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String _email;

  bool _isSendingForgotPassword = false;

  _forgotPassword() async {
    if (_isSendingForgotPassword) return;
    setState(() {
      _isSendingForgotPassword = true;
    });

    final form = _formKey.currentState;

    if(!form.validate()) {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      setState(() {
        _isSendingForgotPassword = false;

      });
      return;

    }

    form.save();

  try {
  await FirebaseAuth.instance
      .sendPasswordResetEmail(email: _email);
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Password reset email sent! Please check your inbox',
          ),
        duration: Duration(seconds: 10),
      ));

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
  _isSendingForgotPassword = false;
  });
  }
}


@override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
          behavior: HiddenScrollBehavior(),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                FlutterLogo(style: FlutterLogoStyle.markOnly, size: 100.0),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                      'Please enter your email address to sent yo a reset password link'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
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
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _forgotPassword();
          },
          child: Icon(Icons.restore),
          ),
    );
  }
}
