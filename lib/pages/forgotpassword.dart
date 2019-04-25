import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordPageState();

}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(child: Text("Forgot"),),
    );
  }
}