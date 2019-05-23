import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';

void main() => runApp(MaterialApp(
    home: SafeArea(
        child: Scaffold(body: Material(child: HorariosPage())))));

/// Example 1 folding cell inside [Container]

var t1 = "";
var t2 = "";
var t3 = "";
var t4 = "";
var t5 = "";
var t6 = "";
var t7 = "";

class HorariosPage extends StatelessWidget {
  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return 
      new Column(
        children: <Widget>[
          new Container(
      color: Colors.white,
      alignment: Alignment.topCenter,
      child: SimpleFoldingCell(
          key: _foldingCellKey,
          frontWidget: _buildFrontWidget(),
          innerTopWidget: _buildInnerTopWidget(),
          innerBottomWidget: _buildInnerBottomWidget(),
          cellSize: Size(MediaQuery.of(context).size.width, 120),
          padding: EdgeInsets.all(10),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print('cell opened'),
          onClose: () => print('cell closed')),
    ),
    new Container(
        
        color: Colors.white,
      alignment: Alignment.bottomCenter,
      child: SimpleFoldingCell(
          key: _foldingCellKey,
          frontWidget: _buildFrontWidget(),
          innerTopWidget: _buildInnerTopWidget(),
          innerBottomWidget: _buildInnerBottomWidget(),
          cellSize: Size(MediaQuery.of(context).size.width, 120),
          padding: EdgeInsets.all(10),
          animationDuration: Duration(milliseconds: 300),
          borderRadius: 10,
          onOpen: () => print('cell opened'),
          onClose: () => print('cell closed')),
    
    )    
        ]
        );
  }

  Widget _buildFrontWidget() {
    return Container(
        color:Colors.white,
        alignment: Alignment.center,
        child: Row(children: <Widget>[
          Expanded(
            flex:1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff606060),
              ),
            
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Container(
                    child:Padding(
                      padding: const EdgeInsets.all(1.0),
                    
                    child: Text('LUNES', style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 24.0),)
                  )),
                  
                 
                    
                  
                  Container(
                    child:Padding(
                      padding: const EdgeInsets.all(4.0),
                    
                    child: Text('MONDAY', style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 14.0),)
                  )
                  ),
 Container(
   
        height: 50.0,
        width: 50.0,
        alignment: Alignment.bottomCenter,
        child: FittedBox(
          
          child: FloatingActionButton.extended(
         
            onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
            label: Text("Ver Mas",
            style: TextStyle(fontSize: 40),),)
        ),
      ),
  ],)
],),
            ),


            ),


            
          ),

          Expanded(
            flex:2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xffcdcdcd),
              ),


              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Personalizado",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,  
                    )),
                  ),),
                  Container(child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("CrossFit",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,  
                    )),
                  ),),
                  Container(child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Cardio",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,  
                    )),
                  ),),


                  Container(child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("GAP",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,  
                    )),
                  ),),

                  Container(child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("Tabata",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,  
                    )),
                  ),),

                  Container(child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text("BoxFit",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,  
                    )),
                  ),),

                  
                  
                ],
              ),
            
            
            ),
            
          ),


        ],),

        );
  }

  Widget _buildInnerTopWidget() {
    return  Container(
    color: Color(0xffcdcdcd),
    child: ListView(
      
      physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
         
          new Container(
            color: Color(0xff606060),
            padding: new EdgeInsets.only(top: 10.0),
            height: 30.0,
            child: Text("LUNES", 
            textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold,
            color: Color(0xffffffff),

            
          
            )),
          ),
          new Row(
            children: [
              new Container(
                  height: 30, width: 60,
                margin: const EdgeInsets.all(10.0),
              child: Text("Horario", textAlign: TextAlign.center, style: new TextStyle(
                  fontFamily: "Arial",
                 fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                )),
              
              ),

              new Container(
                height: 30, width: 200,
                  
                  margin: const EdgeInsets.all(10.0),
                child: Text("Actividad", textAlign: TextAlign.center, style: new TextStyle(
                  fontFamily: "Arial",
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),)

              ),
            ]
            ),
            Row(
            children: [
              new Container(
                  height: 30, width: 60,
                margin: const EdgeInsets.all(10.0),
              child: Text("7:00 - 8:00", textAlign: TextAlign.center, style: new TextStyle(
                  fontFamily: "Arial",
                 
                  fontSize: 12.0,),)
              
              ),

              new Container(
                height: 30, width: 200,
                  
                  margin: const EdgeInsets.all(10.0),
                child: Text("PERSONALIZADO", textAlign: TextAlign.center, style: new TextStyle(
                  fontFamily: "Arial",
                  
                  fontSize: 14.0,
                ),)

              ),
            ]
            ),
            Row(
            children: [
              new Container(
                  height: 30, width: 60,
                margin: const EdgeInsets.all(10.0),
              child: Text("8:00 - 9:00", textAlign: TextAlign.center, style: new TextStyle(
                  fontFamily: "Arial",
                 
                  fontSize: 12.0,),)
              
              ),

              new Container(
                height: 30, width: 200,
                  
                  margin: const EdgeInsets.all(10.0),
                child: Text("CROSSFIT", textAlign: TextAlign.center, style: new TextStyle(
                  fontFamily: "Arial",
                  
                  fontSize: 14.0,
                ),)

              ),
            ]
            ),
          ]
            
    ),);
              }

  Widget _buildInnerBottomWidget() {
    return Container(
      color: Color(0xffcdcdcd),

      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
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
    );
  }
}