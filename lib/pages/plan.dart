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
  bool checkBoxState1 = false;
  bool checkBoxState2 = false;
  bool checkBoxState3 = false;
  bool checkBoxState4 = false;
  bool checkBoxState5 = false;
  bool checkBoxState6 = false;

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
        child: Icon(Icons.timer),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyHomePage();
          }));
          
        },
      ),

    ));

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Temporizer",
        currentButton: FloatingActionButton(
            heroTag: "airplane",
            backgroundColor: Colors.greenAccent,
            mini: true,
            child: Icon(Icons.watch_later),
            onPressed: (){
              Navigator.of(context).pushNamed('/profile');
            },
            )));

    childButtons.add(UnicornButton(
      hasLabel: true,
      labelText: "Personalized",
        currentButton: FloatingActionButton(
            heroTag: "directions",
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.av_timer),
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
                child: Text("- Correr 10 minutos seguidos. Repetir 4 veces con breves descansos", textAlign: TextAlign.center, style: new TextStyle(
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
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/gym2.jpg", height: 100.0, width: 100.0, )
              ),

              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Levantamiento de Soga, 5 repeticiones de 15", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something1(),
                    value: checkBoxState1),
              ),
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/gym3.jpg", height: 100.0, width: 100.0, )
              ),
              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Remo con barra, 10 repeticiones por 4 series", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something2(),
                    value: checkBoxState2),
              ),
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/bb2.jpg", height: 100.0, width: 100.0, )
              ),
              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Sentadillas 25 repeticiones por 4 series", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something3(),
                    value: checkBoxState3),
              ),
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/bb3.jpg", height: 100.0, width: 100.0, )
              ),
              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Triceps con mancuernas, 4 repeticiones de 10 cada una", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something4(),
                    value: checkBoxState4),
              ),
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/gym6.jpg", height: 100.0, width: 100.0, )
              ),
              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("Remo al pecho con soga, 5 repeticiones de 8 cada una", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something5(),
                    value: checkBoxState5),
              ),
            ],
          ),
          new Row(
            children: [
              new Container(
                  height: 140, width: 140,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset("assets/asdasd.jpeg", height: 100.0, width: 100.0, )
              ),
              new Container(
                  height: 140, width: 140,
                  padding: new EdgeInsets.only(top: 25.0),
                  //margin: const EdgeInsets.all(10.0),
                  child: Text("IOKESE, NO SOI 100TIFIKO", textAlign: TextAlign.center, style: new TextStyle(
                    fontFamily: "Arial",
                    fontStyle: FontStyle.italic,
                    fontSize: 14.0,
                  ),)
              ),
              new Container(
                height: 70, width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something6(),
                    value: checkBoxState6),
              ),
            ],
          ),
        ],
      ),      
        );       
  }

  void something(){
    setState((){
      if(checkBoxState){
        checkBoxState = !checkBoxState;
      } else{
        checkBoxState = !checkBoxState;
      }
    });
  }
  void something1(){
    setState((){
      if(checkBoxState1){
        checkBoxState1 = !checkBoxState1;
      } else{
        checkBoxState1 = !checkBoxState1;
      }
    });
  }
  void something2(){
    setState((){
      if(checkBoxState2){
        checkBoxState2 = !checkBoxState2;
      } else{
        checkBoxState2 = !checkBoxState2;
      }
    });
  }
  void something3(){
    setState((){
      if(checkBoxState3){
        checkBoxState3 = !checkBoxState3;
      } else{
        checkBoxState3 = !checkBoxState3;
      }
    });
  }
  void something4(){
    setState((){
      if(checkBoxState4){
        checkBoxState4 = !checkBoxState4;
      } else{
        checkBoxState4 = !checkBoxState4;
      }
    });
  }
  void something5(){
    setState((){
      if(checkBoxState5){
        checkBoxState5 = !checkBoxState5;
      } else{
        checkBoxState5 = !checkBoxState5;
      }
    });
  }
  void something6(){
    setState((){
      if(checkBoxState6){
        checkBoxState6 = !checkBoxState6;
      } else{
        checkBoxState6 = !checkBoxState6;
      }
    });
  }
}