import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:overlay_support/overlay_support.dart';

void main() => runApp(MaterialApp(
    home: SafeArea(child: Scaffold(body: Material(child: HorarioMiercoles())))));

int _count = 20;
int _count1 = 15;
int _count2 = 20;
int _count3 = 20;
int _count4 = 20;
int _count5 = 20;
int _count6 = 0;

class HorarioMiercoles extends StatefulWidget {
  _HorarioMiercoles createState() => _HorarioMiercoles();
}

class _HorarioMiercoles extends State<HorarioMiercoles> {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();
  bool checkBoxState = false;
  bool checkBoxState1 = false;
  bool checkBoxState2 = false;
  bool checkBoxState3 = false;
  bool checkBoxState4 = false;
  bool checkBoxState5 = false;
  bool checkBoxState6 = false;
  bool checkBoxState7 = false;
  

  void _decrease() {
    setState(() => _count--);
  }

  void _decrease1() {
    setState(() => _count1--);
  }

  void _decrease2() {
    setState(() => _count2--);
  }

  void _decrease3() {
    setState(() => _count3--);
  }

  void _decrease4() {
    setState(() => _count4--);
  }

  void _decrease5() {
    setState(() => _count5--);
  }

  void _decrease6() {
    setState(() => _count6--);
  }

  @override
  Widget build(BuildContext context) {
    /*
  _    _   _ _   _ _____ ____  
 | |  | | | | \ | | ____/ ___| 
 | |  | | | |  \| |  _| \___ \ 
 | |__| |_| | |\  | |___ ___) |
 |_____\___/|_| \_|_____|____/                               

    */

    return Container(
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: SimpleFoldingCell(
          key: _foldingCellKey,
          frontWidget: buildFrontWidgetMiercoles(),
          innerTopWidget: _buildInnerTopWidgetMiercoles(),
          innerBottomWidget: _buildInnerBottomWidgetMiercoles(),
          cellSize: Size(MediaQuery.of(context).size.width, 120),
          padding: EdgeInsets.all(10),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print('cell opened'),
          onClose: () => print('cell closed')),
    );
  }

  Widget buildFrontWidgetMiercoles() {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[600],
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  'MIERCOLES',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 22.0),
                                ))),
                        Container(
                            child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'WEDNESDAY',
                                  style: TextStyle(
                                      color: Color(0xffD9D9E3), fontSize: 14.0),
                                ))),
                        Container(
                          height: 50.0,
                          width: 50.0,
                          alignment: Alignment.bottomCenter,
                          child: FittedBox(
                            child: FloatingActionButton.extended(
                              onPressed: () =>
                                  _foldingCellKey?.currentState?.toggleFold(),
                              label: Text(
                                "Ver Mas",
                                style: TextStyle(fontSize: 40),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffDEDEE5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("Personalizado",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("CrossFit",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("Cardio",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("GAP",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("Tabata",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text("BoxFit",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInnerTopWidgetMiercoles() {
    return Container(
      color: Color(0xffDEDEE5),
      child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            new Container(
              color: Colors.grey[600],
              padding: new EdgeInsets.only(top: 10.0),
              margin: const EdgeInsets.only(bottom: 4.5),
              height: 30.0,
              child: Text("MIERCOLES",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            new Row(children: [
              new Container(
                height: 20,
                width: 70,
                margin: const EdgeInsets.only(left: 10.0, top: 5),
                child: Text("Horario",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    )),
              ),
              new Container(
                  height: 20,
                  width: 170,
                  margin: const EdgeInsets.only(left: 10.0, top: 5),
                  child: Text(
                    "Actividad",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  )),
              new Container(
                  height: 20,
                  width: 50,
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Cupos",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  )),
            ]),
            Row(children: [
              new Container(
                  height: 15,
                  width: 70,
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    "7:00 - 8:00",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 12.0,
                    ),
                  )),
              new Container(
                  height: 15,
                  width: 170,
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    "PERSONALIZADO",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              new Container(
                  height: 15,
                  width: 50,
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$_count",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                height: 15,
                width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child: Checkbox(
                    onChanged: (bool e) => something(), value: checkBoxState),
              ),
            ]),
            Row(children: [
              new Container(
                  height: 15,
                  width: 70,
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    "8:00 - 9:00",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 12.0,
                    ),
                  )),
              new Container(
                  height: 15,
                  width: 170,
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    "CROSSFIT",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                  height: 15,
                  width: 50,
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$_count1",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                height: 15,
                width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child: Checkbox(
                    onChanged: (bool e) => something1(), value: checkBoxState1),
              ),
            ]),
            Row(children: [
              new Container(
                  height: 15,
                  width: 70,
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    "14:00 - 15:00",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 12.0,
                    ),
                  )),
              new Container(
                  height: 15,
                  width: 170,
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    "CARDIO",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                  height: 15,
                  width: 50,
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$_count3",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                height: 15,
                width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child: Checkbox(
                    onChanged: (bool e) => something3(), value: checkBoxState3),
              ),
            ]),
          ]),
    );
  }

  Widget _buildInnerBottomWidgetMiercoles() {
    return Container(
        color: Color(0xffDEDEE5),
        alignment: Alignment.bottomCenter,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Row(children: [
              new Container(
                  height: 15,
                  width: 70,
                  margin: const EdgeInsets.only(left: 10.0, top: 0.0),
                  child: Text(
                    "15:00 - 16:00",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 12.0,
                    ),
                  )),
              new Container(
                  height: 15,
                  width: 170,
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    "GAP",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                  height: 15,
                  width: 50,
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$_count4",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                height: 15,
                width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child: Checkbox(
                    onChanged: (bool e) => something4(), value: checkBoxState4),
              ),
            ]),
            Row(children: [
              new Container(
                  height: 15,
                  width: 70,
                  margin: const EdgeInsets.only(left: 10.0, top: 0.0),
                  child: Text(
                    "16:00 - 17:00",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 12.0,
                    ),
                  )),
              new Container(
                  height: 15,
                  width: 170,
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    "TABATA",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                  height: 15,
                  width: 50,
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$_count5",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                height: 15,
                width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child: Checkbox(
                    onChanged: (bool e) => something5(), value: checkBoxState5),
              ),
            ]),
            Row(children: [
              new Container(
                  height: 15,
                  width: 70,
                  margin: const EdgeInsets.only(left: 10.0, top: 0.0),
                  child: Text(
                    "20:00 - 21:00",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 12.0,
                    ),
                  )),
              new Container(
                  height: 15,
                  width: 170,
                  margin: const EdgeInsets.only(left: 10.0, top: 5.0),
                  child: Text(
                    "BOXFIT",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                  height: 15,
                  width: 50,
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    "$_count6",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "Arial",
                      fontSize: 14.0,
                    ),
                  )),
              Container(
                height: 15,
                width: 50,
                padding: new EdgeInsets.only(top: 5.0),
                child: Checkbox(
                    onChanged: (bool e) => something6(), value: checkBoxState6),
              ),
            ]),
            Row(children: [
              Container(
                padding: new EdgeInsets.only(left: 5.0),
                child: FlatButton(
                  onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
                  child: Text(
                    "Close",
                  ),
                  textColor: Colors.white,
                  color: Colors.indigoAccent,
                  splashColor: Colors.white.withOpacity(0.5),
                ),
              ),
            ])
          ],
        ));
  }

  void something() {
    setState(() {
      if (_count == 0) {
        showSimpleNotification(
            context,
            Text("Fuera de cupo",
                textAlign: TextAlign.center, style: (TextStyle(fontSize: 20))),
            background: Colors.grey[600]);
      } else {
        if (checkBoxState) {
          _count++;

          checkBoxState = !checkBoxState;
        } else {
          _decrease();
          showSimpleNotification(
              context,
              Text(
                "Inscripto correctamente!",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20)),
              ),
              background: Colors.grey[600]);
          checkBoxState = !checkBoxState;
        }
      }
    });
  }

  void something1() {
    setState(() {
      if (_count1 == 0) {
        showSimpleNotification(
            context,
            Text("Fuera de cupo",
                textAlign: TextAlign.center, style: (TextStyle(fontSize: 20))),
            background: Colors.grey[600]);
      } else {
        if (checkBoxState1) {
          _count1++;
          checkBoxState1 = !checkBoxState1;
        } else {
          _decrease1();
          showSimpleNotification(
              context,
              Text(
                "Inscripto correctamente!",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20)),
              ),
              background: Colors.grey[600]);
          checkBoxState1 = !checkBoxState1;
        }
      }
    });
  }

  void something2() {
    setState(() {
      if (_count2 == 0) {
        showSimpleNotification(
            context,
            Text("Fuera de cupo",
                textAlign: TextAlign.center, style: (TextStyle(fontSize: 20))),
            background: Colors.grey[600]);
      } else {
        if (checkBoxState2) {
          _count2++;
          checkBoxState2 = !checkBoxState2;
        } else {
          _decrease2();
          showSimpleNotification(
              context,
              Text(
                "Inscripto correctamente!",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20)),
              ),
              background: Colors.grey[600]);
          checkBoxState2 = !checkBoxState2;
        }
      }
    });
  }

  void something3() {
    setState(() {
      if (_count3 == 0) {
        showSimpleNotification(
            context,
            Text("Fuera de cupo",
                textAlign: TextAlign.center, style: (TextStyle(fontSize: 20))),
            background: Colors.grey[600]);
      } else {
        if (checkBoxState3) {
          _count3++;
          checkBoxState3 = !checkBoxState3;
        } else {
          _decrease3();
          showSimpleNotification(
              context,
              Text(
                "Inscripto correctamente!",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20)),
              ),
              background: Colors.grey[600]);
          checkBoxState3 = !checkBoxState3;
        }
      }
    });
  }

  void something4() {
    setState(() {
      if (_count4 == 0) {
        showSimpleNotification(
            context,
            Text("Fuera de cupo",
                textAlign: TextAlign.center, style: (TextStyle(fontSize: 20))),
            background: Colors.grey[600]);
      } else {
        if (checkBoxState4) {
          _count4++;
          checkBoxState4 = !checkBoxState4;
        } else {
          _decrease4();
          showSimpleNotification(
              context,
              Text(
                "Inscripto correctamente!",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20)),
              ),
              background: Colors.grey[600]);
          checkBoxState4 = !checkBoxState4;
        }
      }
    });
  }

  void something5() {
    setState(() {
      if (_count5 == 0) {
        showSimpleNotification(
            context,
            Text("Fuera de cupo",
                textAlign: TextAlign.center, style: (TextStyle(fontSize: 20))),
            background: Colors.grey[600]);
      } else {
        if (checkBoxState5) {
          _count5++;
          checkBoxState5 = !checkBoxState5;
        } else {
          _decrease5();
          showSimpleNotification(
              context,
              Text(
                "Inscripto correctamente!",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20)),
              ),
              background: Colors.grey[600]);
          checkBoxState5 = !checkBoxState5;
        }
      }
    });
  }

  void something6() {
    setState(() {
      if (_count6 == 0) {
        showSimpleNotification(
            context,
            Text("Fuera de cupo",
                textAlign: TextAlign.center, style: (TextStyle(fontSize: 20))),
            background: Colors.grey[600]);
      } else {
        if (checkBoxState6) {
          _count6++;
          checkBoxState6 = !checkBoxState6;
        } else {
          _decrease6();
          showSimpleNotification(
              context,
              Text(
                "Inscripto correctamente!",
                textAlign: TextAlign.center,
                style: (TextStyle(fontSize: 20)),
              ),
              background: Colors.grey[600]);
          checkBoxState6 = !checkBoxState6;
        }
      }
    });
  }
  // void something7(){
  //   setState((){
  //     if(checkBoxState7){
  //       t7 = "No Listo";
  //       checkBoxState7 = !checkBoxState7;
  //     } else{
  //       t7 = "Listo!";
  //       checkBoxState7 = !checkBoxState7;
  //     }
  //   });
  // }

}

// Container(
//                 child: FlatButton(
//           onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
//           child: Text(
//             "Close",
//           ),
//           textColor: Colors.white,
//           color: Colors.indigoAccent,
//           splashColor: Colors.white.withOpacity(0.5),
//         ),
//                 ),
