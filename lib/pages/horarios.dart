import 'package:flutter/material.dart';

class HorariosPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold (appBar: AppBar(
      title: Text('Horarios'),
    ),
      body: Center(child: Text("En construccion"),
      ),
    );
  }


}