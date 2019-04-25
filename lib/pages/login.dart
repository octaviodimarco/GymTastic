import 'package:flutter/material.dart';
import 'package:gymtastic/behaviors/hiddenScrollBehavior.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ScrollConfiguration(
            behavior: HiddenScrollBehavior(),
            child: Form(
              child: ListView(
                children: <Widget>[
                  FlutterLogo(
                    style: FlutterLogoStyle.horizontal,
                    size: 200.0,
                  ),
                  TextFormField(
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Password'),
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
        onPressed: () {},
        child: Icon(Icons.account_circle),
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
