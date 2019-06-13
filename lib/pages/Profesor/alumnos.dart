import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymtastic/pages/Profesor/user.dart';
 
class AlumnosPage extends StatefulWidget {
  AlumnosPage() : super();
 
  final String title = "CloudFireStore Demo";
  @override
  AlumnosPageState createState() => AlumnosPageState();
}
 
class AlumnosPageState extends State<AlumnosPage> {
  //
  bool showTextField = false;
  TextEditingController controller = TextEditingController();
  String collectionName = "Alumnos";
  bool isEditing = false;
  User curUser;
 
  getUsers() {
    return Firestore.instance.collection(collectionName).snapshots();
  }
 
  addUser() {
    User user = User(name: controller.text);
    try {
      Firestore.instance.runTransaction(
        (Transaction transaction) async {
          await Firestore.instance
              .collection(collectionName)
              .document()
              .setData(user.toJson());
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }
 
  add() {
    if (isEditing) {
      // Update
      update(curUser, controller.text);
      setState(() {
        isEditing = false;
      });
    } else {
      addUser();
    }
    controller.text = '';
  }
 
  update(User user, String newName) {
    try {
      Firestore.instance.runTransaction((transaction) async {
        await transaction.update(user.reference, {'Nombre y Apellido': newName});
      });
    } catch (e) {
      print(e.toString());
    }
  }
 
  delete(User user) {
    Firestore.instance.runTransaction(
      (Transaction transaction) async {
        await transaction.delete(user.reference);
      },
    );
  }
 
  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.hasData) {
          print("Documents ${snapshot.data.documents.length}");
          return buildList(context, snapshot.data.documents);
        }
        return CircularProgressIndicator();
      },
    );
  }
 
  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => buildListItem(context, data)).toList(),
    );
  }
 
  Widget buildListItem(BuildContext context, DocumentSnapshot data) {
    final user = User.fromSnapshot(data);
    return Padding(
      key: ValueKey(user.name),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(user.name),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // delete
              delete(user);
            },
          ),
          onTap: () {
            // update
            setUpdateUI(user);
          },
        ),
      ),
    );
  }
 
  setUpdateUI(User user) {
    controller.text = user.name;
    setState(() {
      showTextField = true;
      isEditing = true;
      curUser = user;
    });
  }
 
  button() {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        child: Text(isEditing ? "ACTUALIZAR" : "AGREGAR"),
        onPressed: () {
          add();
          setState(() {
            showTextField = false;
          });
        },
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            showTextField
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: controller,
                        decoration: InputDecoration(
                            labelText: "Nombre y Apellido", hintText: "Ingrese nombre completo"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      button(),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 20,
            ),
            Text(
              "REGISTRO ALUMNOS",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: buildBody(context),
            ),
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
         backgroundColor: Colors.redAccent,
         //parentButtonBackground: Colors.redAccent,
        onPressed: () {
              setState(() {
                showTextField = !showTextField;
              });
            },
        child: Icon(Icons.person_add),
        
      ),
    );
  }
}