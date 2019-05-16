import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:gymtastic/pages/Clock/mainstopwatch.dart';

class PlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage>{
  String t = "";
  bool checkBoxState = false;
  @override
  Widget build(BuildContext context) {

    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "StopWatch",
      currentButton: FloatingActionButton(
        heroTag: "train",
        backgroundColor: Colors.redAccent,
        mini: true,
        child: Icon(Icons.train),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }));
          
        },
      ),

    ));

    childButtons.add(UnicornButton(
        currentButton: FloatingActionButton(
            heroTag: "airplane",
            backgroundColor: Colors.greenAccent,
            mini: true,
            child: Icon(Icons.airplanemode_active),
            onPressed: (){
              Navigator.of(context).pushNamed('/profile');
            },
            )));

    childButtons.add(UnicornButton(
        currentButton: FloatingActionButton(
            heroTag: "directions",
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.directions_car),
            onPressed: (){},)));


    return Scaffold (

 floatingActionButton: UnicornDialer(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
            parentButtonBackground: Colors.redAccent,
            orientation: UnicornOrientation.VERTICAL,
            parentButton: Icon(FontAwesomeIcons.clock),
            childButtons: childButtons),
      


    


      body: 
      
      
      ListView(
        children: <Widget>[
         
          new Container(
            color: Colors.grey[400],
            padding: new EdgeInsets.only(top: 25.0),
            height: 60.0,
            child: Text("ESTE ES TU PLAN DE HOY", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                margin: const EdgeInsets.all(10.0),
              child: Image.asset("assets/gym1.jpg", height: 100.0, width: 100.0, )
              ),

              new Container(
                height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                child: Text("Deberas poder solventar esta actividad sin problemas", textAlign: TextAlign.center, style: new TextStyle(
                  fontFamily: "Arial",
                  fontStyle: FontStyle.italic,
                  fontSize: 14.0,
                ),)

              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something(),
                value: checkBoxState),
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t),
              )
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/gym1.jpg", height: 100.0, width: 100.0, )
              ),

              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Deberas poder solventar esta actividad sin problemas", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)

              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something(),
                    value: checkBoxState),
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t),
              )
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/gym1.jpg", height: 100.0, width: 100.0, )
              ),

              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Deberas poder solventar esta actividad sin problemas", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)

              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something(),
                    value: checkBoxState),
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t),
              )
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/gym1.jpg", height: 100.0, width: 100.0, )
              ),

              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Deberas poder solventar esta actividad sin problemas", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)

              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something(),
                    value: checkBoxState),
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t),
              )
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/gym1.jpg", height: 100.0, width: 100.0, )
              ),

              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Deberas poder solventar esta actividad sin problemas", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)

              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something(),
                    value: checkBoxState),
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t),
              )
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/gym1.jpg", height: 100.0, width: 100.0, )
              ),

              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Deberas poder solventar esta actividad sin problemas", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)

              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something(),
                    value: checkBoxState),
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t),
              )
            ],
          ),

        ],

      ),
      
      
        );

       
  }

  void something(){
    setState((){
      if(checkBoxState){
        t = "No Listo";
        checkBoxState = !checkBoxState;
      } else{
        t = "Listo!";
        checkBoxState = !checkBoxState;
      }
    });
  }
}