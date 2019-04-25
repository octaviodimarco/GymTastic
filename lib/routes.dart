import 'package:flutter/material.dart';
import 'package:gymtastic/pages/login.dart';
import 'package:gymtastic/pages/forgotpassword.dart';
import 'package:gymtastic/pages/register.dart';

Map<String, WidgetBuilder> buildAppRoutes(){
  return {
    '/login':(BuildContext context) => new LoginPage(),
    '/register':(BuildContext context) => new RegisterPage(),
    '/forgotpassword':(BuildContext context) => new ForgotPasswordPage(),
//    '/maintabs':(BuildContext context) => new MainTabsPage();
  };

}