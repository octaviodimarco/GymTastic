import 'package:flutter/material.dart';
import 'package:gymtastic/pages/Profesor/alumnos.dart';
import 'package:gymtastic/pages/Profesor/ejerciciosprofe.dart';
import 'package:gymtastic/pages/Profesor/maintabsprofesor.dart';
// import 'package:gymtastic/pages/aboutUs.dart';
import 'package:gymtastic/pages/login.dart';
import 'package:gymtastic/pages/forgotpassword.dart';
import 'package:gymtastic/pages/maintabs.dart';
import 'package:gymtastic/pages/register.dart';

import 'package:gymtastic/pages/settings.dart';
import 'package:gymtastic/pages/profile.dart';
import 'package:gymtastic/pages/Clock/mainstopwatch.dart';

Map<String, WidgetBuilder> buildAppRoutes(){
  return {
    '/login':(BuildContext context) =>  LoginPage(),
    '/register':(BuildContext context) =>  RegisterPage(),
    '/forgotpassword':(BuildContext context) => ForgotPasswordPage(),
    '/maintabs':(BuildContext context) => MainTabsPage(),

    '/settings':(BuildContext context) => SettingsPage(),

    '/profile':(BuildContext context) => ProfilePage(),
    // '/aboutus':(BuildContext context) => AboutUs(),
    '/stopwatch':(BuildContext context) => MyHomePage(),

/*

  ____  ____   ___  _____ _____ ____   ___  ____  
 |  _ \|  _ \ / _ \|  ___| ____/ ___| / _ \|  _ \ 
 | |_) | |_) | | | | |_  |  _| \___ \| | | | |_) |
 |  __/|  _ <| |_| |  _| | |___ ___) | |_| |  _ < 
 |_|   |_| \_\\___/|_|   |_____|____/ \___/|_| \_\
                                                  

*/

  '/maintabsprofe':(BuildContext context) => MainTabsProfePage(),
  '/alumnosprofe':(BuildContext context) => AlumnosPage(),
  '/ejerciciosprofe':(BuildContext context) => EjerciciosProfePage(),

  };

}