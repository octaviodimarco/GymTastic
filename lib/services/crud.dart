import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethods {
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(userData) async {
    if (isLoggedIn()) {
      Firestore.instance
          .collection('informacionUsuarios')
          .add(userData)
          .catchError((e) {
        print(e);
      });
    } else {
      print('Error');
    }
  }

  
  

  getData() async {
    return await Firestore.instance
        .collection('informacionUsuarios')
        .getDocuments();
  }
 

  deleteData(docID) {
    Firestore.instance
        .collection('informacionUsuarios')
        .document(docID)
        .delete()
        .catchError((e) {
      print(e);
    });
  }



/*
  ____  ____   ___  _____ _____ ____   ___  ____  
 |  _ \|  _ \ / _ \|  ___| ____/ ___| / _ \|  _ \ 
 | |_) | |_) | | | | |_  |  _| \___ \| | | | |_) |
 |  __/|  _ <| |_| |  _| | |___ ___) | |_| |  _ < 
 |_|   |_| \_\\___/|_|   |_____|____/ \___/|_| \_\
                                                  
*/




Future<void> addDataProfe(alumnoData) async {
  if (isLoggedIn()) {
      Firestore.instance
          .collection('informacionAlumnos')
          .add(alumnoData)
          .catchError((e) {
        print(e);
      });
      } else {
      print('Error');
    }
  }

    getDataProfe() async {
    return Firestore.instance
        .collection('InformacionAlumnos')
        .snapshots();
  }


updateDataProfe(selectedDoc, newValues) {
    Firestore.instance
        .collection('informacionAlumnos')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
  }

deleteDataProfe(docID) {
    Firestore.instance
        .collection('informacionAlumnos')
        .document(docID)
        .delete()
        .catchError((e) {
      print(e);
    });
  }


}


// void readData() async {
// DocumentSnapshot snapshot = await Firestore.instance
// .collection('informacionUsuarios').document().get();
// print(snapshot.data['nombre']);

// }   