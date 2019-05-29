import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:gymtastic/pages/Profesor/maintabsprofesor.dart';

import 'package:gymtastic/pages/maintabs.dart';
import 'package:gymtastic/pages/register.dart';

class UserManagement {
  Widget handleAuth(){
    return new StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot){
        // if (snapshot.connectionState == ConnectionState.waiting)
        if (snapshot.hasData) {
          return MainTabsPage();
        }
        return RegisterPage();
      },
    );
  }

  authorizeAccess(BuildContext context){
    FirebaseAuth.instance.currentUser().then((user) {
          Firestore.instance
              .collection('/informacionUsuarios')
              .where('e-mail', isEqualTo: user.email)
              .getDocuments()
              .then((docs) {
            if (docs.documents[0].exists) {
              if (docs.documents[0].data['TipoUsuario'] == 'Profesor') {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/maintabsprofe');
              }
              if (docs.documents[0].data['TipoUsuario'] == 'Alumno') {
                // Navigator.of(context).pop();
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (BuildContext context) => MainTabsProfePage()));
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/maintabs');
              }
        }
      });

    });
  }
}