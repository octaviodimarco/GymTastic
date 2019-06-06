import 'package:flutter/material.dart';

class User {
  String firstName;
  String lastName;
 
  User({this.firstName, this.lastName});
 
  static List<User> getUsers() {
    return <User>[
      User(firstName: "Mancuernas", lastName: "Sala 1"),
      User(firstName: "Pesas", lastName: "Sala 1"),
      User(firstName: "Prebanca", lastName: "Sala 3"),
      User(firstName: "Estocadas", lastName: "Sala 2"),
      User(firstName: "Mariposa", lastName: "Sala 3"),
      User(firstName: "Mancuernas", lastName: "Sala 1"),
      User(firstName: "Pesas", lastName: "Sala 1"),
      User(firstName: "Prebanca", lastName: "Sala 3"),
      User(firstName: "Estocadas", lastName: "Sala 2"),
      User(firstName: "Mariposa", lastName: "Sala 3"),
      User(firstName: "Mancuernas", lastName: "Sala 1"),
      User(firstName: "Pesas", lastName: "Sala 1"),
      User(firstName: "Prebanca", lastName: "Sala 3"),
      User(firstName: "Estocadas", lastName: "Sala 2"),
      User(firstName: "Mariposa", lastName: "Sala 3"),
    ];
  }
}
 
class EjercicioProfe extends StatefulWidget {
  EjercicioProfe() : super();
 
  
 
  @override
  DataTableDemoState createState() => DataTableDemoState();
}
 
class DataTableDemoState extends State<EjercicioProfe> {
  List<User> users;
  List<User> selectedUsers;
  bool sort;
 
  @override
  void initState() {
    sort = false;
    selectedUsers = [];
    users = User.getUsers();
    super.initState();
  }
 
  onSortColum(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      if (ascending) {
        users.sort((a, b) => a.firstName.compareTo(b.firstName));
      } else {
        users.sort((a, b) => b.firstName.compareTo(a.firstName));
      }
    }
  }
 
  onSelectedRow(bool selected, User user) async {
    setState(() {
      if (selected) {
        selectedUsers.add(user);
      } else {
        selectedUsers.remove(user);
      }
    });
  }
 
  deleteSelected() async {
    setState(() {
      if (selectedUsers.isNotEmpty) {
        List<User> temp = [];
        temp.addAll(selectedUsers);
        for (User user in temp) {
          users.remove(user);
          selectedUsers.remove(user);
        }
      }
    });
  }

 /* addNew() async{

    return <User>[
    User(firstName: "Emily", lastName: "Jane")
    ];
  }*/
 
  SingleChildScrollView dataBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortAscending: sort,
        sortColumnIndex: 0,
        columns: [
          DataColumn(
              label: Text("EJERCICIO"),
              numeric: false,
              tooltip: "This is First Name",
              onSort: (columnIndex, ascending) {
                setState(() {
                  sort = !sort;
                });
                onSortColum(columnIndex, ascending);
              }),
          DataColumn(
            label: Text("UBICACION"),
            numeric: false,
            tooltip: "This is Last Name",
          ),
        ],
        rows: users
            .map(
              (user) => DataRow(
                      selected: selectedUsers.contains(user),
                      onSelectChanged: (b) {
                        print("Onselect");
                        onSelectedRow(b, user);
                      },
                      cells: [
                        DataCell(
                          Text(user.firstName),
                          onTap: () {
                            print('Selected ${user.firstName}');
                          },
                        ),
                        DataCell(
                          Text(user.lastName),
                        ),
                      ]),
            )
            .toList(),
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x000000),
        title: Text('Ejercicios DIsponibles', style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.add, color: Colors.black,size: 35,),
          
          )
        ],
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Expanded(
            child: dataBody(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  color: Colors.green,
                  child: Text('${selectedUsers.length}'),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(0),
                child: OutlineButton(
                  color: Color(0x11111),
                  child: Text('BORRAR SELECCIONADOS'),
                  onPressed: selectedUsers.isEmpty
                      ? null
                      : () {
                          deleteSelected();
                        },
                ),
              ),
              
            ],
          ),
        ],
      ),
      
      
    );
  }
}
