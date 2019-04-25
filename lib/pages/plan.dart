import 'package:flutter/material.dart';

class PlanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold (appBar: AppBar(
      title: Text('Pagina principal'),
    ),
    body: Center(child: Text("En construccion"),
    ),
    );
  }


}