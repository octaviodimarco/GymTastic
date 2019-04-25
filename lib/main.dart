import 'package:flutter/material.dart';
import 'package:gymtastic/pages/register.dart';
import 'package:gymtastic/routes.dart';
import 'package:gymtastic/theme.dart';
//import 'login_page.dart';

void main() => runApp(new TodoApp());

class TodoApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoAppState();


}



class _TodoAppState extends State<TodoApp> {

  Widget rootPage = RegisterPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GymTastic',
      home: rootPage,
      routes: buildAppRoutes(),
      theme: buildAppTheme(),
    );
  }
}

