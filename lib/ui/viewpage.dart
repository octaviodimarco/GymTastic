import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gymtastic/ui/addpage.dart';
import 'package:gymtastic/ui/consultas.dart';
import 'package:gymtastic/ui/informationPage.dart';
import 'package:gymtastic/ui/listviewpage.dart';
import 'package:gymtastic/ui/updatepage.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
       //title: 'Configuración de ejercicios',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class CommonThings {
  static Size size;
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


     
  
  TextEditingController descriptionInputController;
  TextEditingController nameInputController;
  String id;
  final db = Firestore.instance;
  //final _formKey = GlobalKey<FormState>();
  String name;
  String description;

  //create function for delete one register
   void deleteData(DocumentSnapshot doc) async {
    await db.collection('ejercicios').document(doc.documentID).delete();
    setState(() => id = null);
  }

  //create tha funtion navigateToDetail
  navigateToDetail(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyUpdatePage(
                  ds: ds,
                )));
  }

   //create tha funtion navigateToDetail
  navigateToInfo(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyInfoPage(
                  ds: ds,
                )));
  }


  @override




  
  Widget build(BuildContext context) {


     var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Add",
      currentButton: FloatingActionButton(
        heroTag: "add",
        backgroundColor: Colors.redAccent,
        mini: true,
        child: Icon(Icons.add),
        onPressed: (){
          Route route = MaterialPageRoute(builder: (context) => MyAddPage());
          Navigator.push(context, route);
        },
      ),

    ));

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "ListView",
        currentButton: FloatingActionButton(
            heroTag: "listview",
            backgroundColor: Colors.greenAccent,
            mini: true,
            child: Icon(Icons.list),
            onPressed: (){
              Route route = MaterialPageRoute(builder: (context) => MyListPage());
             Navigator.push(context, route); 
            },
            )));

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Search",
        currentButton: FloatingActionButton(
            heroTag: "search",
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.search),
            onPressed: (){
               Route route = MaterialPageRoute(builder: (context) => MyQueryPage());
             Navigator.push(context, route); 
            },)));






    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //  // title: Text('View Page1'),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.list),
      //       tooltip: 'List',
      //       onPressed: () { 
      //         Route route = MaterialPageRoute(builder: (context) => MyListPage());
      //        Navigator.push(context, route);            
      //       },
      //     ),
      //     IconButton(
      //       icon: Icon(Icons.search),
      //       tooltip: 'Search',
      //       onPressed: () { 
      //         Route route = MaterialPageRoute(builder: (context) => MyQueryPage());
      //        Navigator.push(context, route);            
      //       },
      //     ),
      //   ],
      // ),
      body: StreamBuilder(
        
        stream: Firestore.instance.collection("ejercicios").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text('"Loading...');
          }
          int length = snapshot.data.documents.length;
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //two columns
              mainAxisSpacing: 0.1, //space the card
              childAspectRatio: 0.800, //space largo de cada card
          ),
           itemCount: length,
            padding: EdgeInsets.all(2.0),
            itemBuilder: (_, int index) {
              final DocumentSnapshot doc = snapshot.data.documents[index];                         
              return new Container(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          InkWell(
                             onTap: () => navigateToDetail(doc),
                            child: new Container(
                              child: Image.network(
                                '${doc.data["image"]}' + '?alt=media',
                              ),
                              width: 170,
                              height: 120,
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            doc.data["name"],
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15.0,
                            ),
                          ),
                          subtitle: Text(
                            doc.data["description"],
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 12.0),
                          ),
                           onTap: () => navigateToDetail(doc),
                        ),
                      ),
                      Divider(),
                      Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            child: new Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                  ),
                                  onPressed: () => deleteData(doc), //funciona
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.blueAccent,
                                  ),
                                   onPressed: () => navigateToInfo(doc),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
          );
        }
      ),
      floatingActionButton: UnicornDialer(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
            parentButtonBackground: Colors.redAccent,
            orientation: UnicornOrientation.VERTICAL,
            parentButton: Icon(Icons.add),
            childButtons: childButtons),
      
      
      // FloatingActionButton(
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      //   backgroundColor: Colors.pinkAccent,
      //   onPressed: () {
      //     Route route = MaterialPageRoute(builder: (context) => MyAddPage());
      //     Navigator.push(context, route);
      //   },
      // ),
    );
  }
}