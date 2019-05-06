import 'package:flutter/material.dart';
import 'package:gymtastic/pages/login.dart';
import 'package:gymtastic/pages/forgotpassword.dart';
import 'package:gymtastic/pages/maintabs.dart';
import 'package:gymtastic/pages/register.dart';
import 'package:gymtastic/pages/curvedbar.dart';
import 'package:gymtastic/pages/settings.dart';

Map<String, WidgetBuilder> buildAppRoutes(){
  return {
    '/login':(BuildContext context) =>  LoginPage(),
    '/register':(BuildContext context) =>  RegisterPage(),
    '/forgotpassword':(BuildContext context) => ForgotPasswordPage(),
    '/maintabs':(BuildContext context) => MainTabsPage(),
//    '/curvedbar':(BuildContext context) => CurvedBar(),
    '/settings':(BuildContext context) => SettingsPage(),

  };

}