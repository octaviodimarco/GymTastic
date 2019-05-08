import 'package:flutter/material.dart';
import 'package:gymtastic/pages/login.dart';
import 'package:gymtastic/pages/forgotpassword.dart';
import 'package:gymtastic/pages/maintabs.dart';
import 'package:gymtastic/pages/register.dart';

import 'package:gymtastic/pages/settings.dart';
import 'package:gymtastic/pages/profile.dart';

Map<String, WidgetBuilder> buildAppRoutes(){
  return {
    '/login':(BuildContext context) =>  LoginPage(),
    '/register':(BuildContext context) =>  RegisterPage(),
    '/forgotpassword':(BuildContext context) => ForgotPasswordPage(),
    '/maintabs':(BuildContext context) => MainTabsPage(),

    '/settings':(BuildContext context) => SettingsPage(),

    '/profile':(BuildContext context) => ProfilePage(),
  };

}