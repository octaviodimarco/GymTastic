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
        .snapshots();
  }

  updateData(selectedDoc, newValues) {
    Firestore.instance
        .collection('informacionUsuarios')
        .document(selectedDoc)
        .updateData(newValues)
        .catchError((e) {
      print(e);
    });
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
}
