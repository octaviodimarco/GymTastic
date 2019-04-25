import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold (appBar: AppBar(
      backgroundColor: new Color(0xfffffff),
      centerTitle: false,
      elevation: 3.0,
      leading: Image.asset("assets/perfil.png",height: 10,),
      title: Container(height: 40, alignment: Alignment.topRight,
          child: Image.asset("assets/logo2.jpg",)),

    ),
    body: Center(child: Text("En construccion"),
    ),
    );
  }


}