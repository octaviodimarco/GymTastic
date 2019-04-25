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
                labelColor: Theme.of(context).primaryColor,
                labelStyle: TextStyle(fontSize: 10.0),
                tabs: <Widget>[
                  Tab(
//                      icon: Icon(Icons.),
                      text: 'PARAVOS',),
                  Tab(
//                    icon: Icon(Icons.list),
                    text: 'PLAN',),
                  Tab(
//                      icon: Icon(Icons.),
                    text: 'HORARIOS',)
                ],
              ),
            ),),
          ),
      ),
    );
  }



}