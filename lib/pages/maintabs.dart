import 'package:flutter/material.dart';
import 'package:gymtastic/pages/horarios.dart';
import 'package:gymtastic/pages/paravos.dart';
//import 'package:gymtastic/pages/settings.dart';
import 'package:gymtastic/pages/plan.dart';

class MainTabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DefaultTabController(
        length: 3,
          child: new Scaffold(
            body: TabBarView(
                children: <Widget>[
                  PlanPage(),
                  ParaVosPage(),
                  HorariosPage()
                ]
            ),
            bottomNavigationBar: PreferredSize(
                preferredSize: Size(60.0, 60.0),
            child: Container(
              height: 60.0,
              child: TabBar(
                labelColor: Theme.of(context).toggleableActiveColor,
                labelStyle: TextStyle(fontSize: 10.0),
                tabs: <Widget>[
                  Tab(
                      icon: Icon(Icons.timeline,size: 35,),
                      text: 'Progreso',),
                  Tab(
                    icon: Icon(Icons.fitness_center,size: 35,),
                    text: 'Actividad',),
                  Tab(
                      icon: Icon(Icons.settings,size: 35,),
                    text: 'Ajustes',)
                ],
              ),
            ),),
          ),
      ),
    );
  }



}