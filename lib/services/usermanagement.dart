import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/widgets.dart';

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
      Firestore.instance.collection('/users')
      .where('uid', isEqualTo: user.uid)
      .getDocuments().then((docs){
        if(docs.documents[0].exists) {
          if(docs.documents[0].data['role'] == 'admin') {
            Navigator.of(context).pushNamed('/settings');
          }
        }
      });

    });
  }
}