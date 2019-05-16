import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage>{
  String t = "";
  String t1 = "";
  String t2 = "";
  String t3 = "";
  String t4 = "";
  String t5 = "";
  String t6 = "";
  String t7 = "";
  bool checkBoxState = false;
  bool checkBoxState1 = false;
  bool checkBoxState2 = false;
  bool checkBoxState3 = false;
  bool checkBoxState4 = false;
  bool checkBoxState5 = false;
  bool checkBoxState6 = false;
  bool checkBoxState7 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: ListView(
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
                height: 70, width: 25,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something(),
                value: checkBoxState),
              ),
              new Container(
                height: 70, width: 35,
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
                height: 70, width: 25,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something1(),
                value: checkBoxState1),
              ),
              new Container(
                height: 70, width: 35,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t1),
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
                height: 70, width: 25,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something2(),
                value: checkBoxState2),
              ),
              new Container(
                height: 70, width: 35,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t2),
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
                height: 70, width: 25,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something3(),
                value: checkBoxState3),
              ),
              new Container(
                height: 70, width: 35,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t3),
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
                height: 70, width: 25,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something4(),
                value: checkBoxState4),
              ),
              new Container(
                height: 70, width: 35,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t4),
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
                height: 70, width: 25,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something5(),
                value: checkBoxState5),
              ),
              new Container(
                height: 70, width: 35,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t5),
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
                height: 70, width: 25,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something6(),
                value: checkBoxState6),
              ),
              new Container(
                height: 70, width: 35,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t6),
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
                height: 70, width: 25,
                padding: new EdgeInsets.only(top: 5.0),
                child:Checkbox(onChanged: (bool e) => something7(),
                value: checkBoxState7),
              ),
              new Container(
                height: 70, width: 35,
                padding: new EdgeInsets.only(top: 25.0),
                child: Text(t7),
              )
            ],
          ),

        ],

      )
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
  }void something1(){
    setState((){
      if(checkBoxState1){
        t1 = "No Listo";
        checkBoxState1 = !checkBoxState1;
      } else{
        t1 = "Listo!";
        checkBoxState1 = !checkBoxState1;
      }
    });
  }
  void something2(){
    setState((){
      if(checkBoxState2){
        t2 = "No Listo";
        checkBoxState2 = !checkBoxState2;
      } else{
        t2 = "Listo!";
        checkBoxState2 = !checkBoxState2;
      }
    });
  }
  void something3(){
    setState((){
      if(checkBoxState3){
        t3 = "No Listo";
        checkBoxState3 = !checkBoxState3;
      } else{
        t3 = "Listo!";
        checkBoxState3 = !checkBoxState3;
      }
    });
  }
  void something4(){
    setState((){
      if(checkBoxState4){
        t4 = "No Listo";
        checkBoxState4 = !checkBoxState4;
      } else{
        t4 = "Listo!";
        checkBoxState4 = !checkBoxState4;
      }
    });
  }
  void something5(){
    setState((){
      if(checkBoxState5){
        t5 = "No Listo";
        checkBoxState5 = !checkBoxState5;
      } else{
        t5 = "Listo!";
        checkBoxState5 = !checkBoxState5;
      }
    });
  }
  void something6(){
    setState((){
      if(checkBoxState6){
        t6 = "No Listo";
        checkBoxState6 = !checkBoxState6;
      } else{
        t6 = "Listo!";
        checkBoxState6 = !checkBoxState6;
      }
    });
  }
  void something7(){
    setState((){
      if(checkBoxState7){
        t7 = "No Listo";
        checkBoxState7 = !checkBoxState7;
      } else{
        t7 = "Listo!";
        checkBoxState7 = !checkBoxState7;
      }
    });
  }
}