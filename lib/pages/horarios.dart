import 'package:flutter/material.dart';

class HorariosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold (appBar: AppBar(
      backgroundColor: new Color(0xfffffff),
      centerTitle: false,
      elevation: 3.0,
      leading: Image.asset("assets/Frases-Arnold-Schwarzenegger.jpg",height: 10,),
      title: Container(height: 40, alignment: Alignment.topRight,
          child: Image.asset("assets/logo2.jpg",)),

    ),
      body: Center(child: Text("En construccion"),
      ),
    );
  }


}